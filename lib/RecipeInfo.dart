import 'package:appebite/Widgets/nav_bar.dart';
import 'package:appebite/pages/Fav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:atlas_icons/atlas_icons.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;

bool hasArabicCharacters(String text) {
  final arabicRegex = RegExp(r'[\\u0600-\\u06FF]');
  return arabicRegex.hasMatch(text);
}

class Place {
  final String name;
  final double latitude;
  final double longitude;

  Place({required this.name, required this.latitude, required this.longitude});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
    );
  }
}

class RecipeInfo extends StatefulWidget {
  final Map<String, dynamic> recipe;

  const RecipeInfo({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeInfoState createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  late Future<Map<String, List<String>>> substitutesFuture;
  bool isReceiptClicked = false;
  List<Map<String, dynamic>> _breakfastRecipes = [];
  bool isIconUp = false;
  bool isIconUp1 = false;
  bool isCopied = false;
  bool isIconUpAlt = false;
  bool isIconUpStep = false;
  late int servings;
  bool showInvalidServingsMessage = false;
  Future<void>? initLangDetectFuture;
  String? selectedIngredient;
  List<String>? selectedSubstitute;
  List<Map<String, dynamic>> ingredients = [];
  List<double> originalValues = [];
  List<double> currentValues = [];
  bool isIconHSelected = false;
  bool isIconCSelected = false;

  @override
  void initState() {
    super.initState();
    isIconHSelected = widget.recipe['favorited'];
   isIconCSelected = widget.recipe['favorited'];
   
      fetchRecipeFavoriteStatus(widget.recipe['id'].toString()).then((isFavorited) {
    setState(() {
      isIconHSelected = isFavorited;
    });
  });

    fetchRecipeCookedStatus(widget.recipe['id'].toString()).then((isCooked) {
    setState(() {
      isIconCSelected = isCooked;
    });
  });


    for (var ingredient in widget.recipe['ingredients']) {
      double value = ingredient['amount']['metric']['value'];
      originalValues.add(value);
      currentValues.add(value);
    }
    _determinePosition();

    substitutesFuture = fetchIngredientSubstitutes(
        widget.recipe['id'].toString(), widget.recipe['ingredients']);
    initLangDetectFuture = langdetect.initLangDetect();
    // Load servings value from SharedPreferences
    loadServings();
    // Initialize servings with the recipe's servings from the API
    servings = widget.recipe['servings'] ??
        0; // Using ?? to provide a default value if recipe['servings'] is null
  }
Future<bool> fetchRecipeFavoriteStatus(String recipeId) async {
  // Get the current user
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Fetch the recipe document from the user's "favorite_recipes" collection
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .collection('favorite_recipes')
        .doc(recipeId)
        .get();

    // Return the favorited status, or false if the document doesn't exist
    if (doc.exists) {
      return (doc.data() as Map<String, dynamic>)['favorited'] ?? false;
    } else {
      return false;
    }
  }

  // If the user is not signed in, return false
  return false;
}
Future<bool> fetchRecipeCookedStatus(String recipeId) async {
  // Get the current user
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Fetch the recipe document from the user's "favorite_recipes" collection
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .collection('cooked_recipes')
        .doc(recipeId)
        .get();

    // Return the favorited status, or false if the document doesn't exist
    if (doc.exists) {
      return (doc.data() as Map<String, dynamic>)['cooked'] ?? false;
    } else {
      return false;
    }
  }

  // If the user is not signed in, return false
  return false;
}
  Future<void> fetchBreakfastRecipes(
      String mealType, cuisineType, String keywords) async {
    final String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final String apiUrl =
        'https://api.spoonacular.com/recipes/complexSearch?type=$mealType&cuisine=$cuisineType&keywords=$keywords&number=4&offset=11&includeIngredients=eggs&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Map<String, dynamic>> recipes = List<Map<String, dynamic>>.from(
            jsonData['results'] as Iterable<dynamic>);

        // Fetch and add rating, servings, calories, and prep time data for each recipe
        for (var recipe in recipes) {
          final List<dynamic> ingredients = await fetchRecipeIngredients(
              recipe['id'].toString()); // Fetching ingredients

          final Map<String, List<String>> substitutes =
              await fetchIngredientSubstitutes(
                  recipe['id'].toString(), ingredients);

          print('Substitutes: $substitutes');

          recipe['ingredientsCount'] = ingredients.length;
          recipe['ingredients'] = ingredients;
          recipe['instructions'] = instructions;
          recipe['ingredientSubstitutes'] = substitutes;
        }

        setState(() {
          _breakfastRecipes = recipes;
        });
      } else {
        throw Exception('Failed to load $mealType recipes');
      }
    } catch (error) {
      print('Error fetching $mealType recipes: $error');
      // Handle error appropriately, e.g., show a snackbar
    }
  }

  Future<void> favoriteRecipe(String recipeId, bool isFavorited) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get a reference to the recipe document in the user's "favorite_recipes" collection
      DocumentReference docRef = FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .collection('favorite_recipes')
          .doc(recipeId);

      if (isFavorited) {
        // If the recipe is favorited, set the favorited status in Firestore
        await docRef.set({'favorited': true});
      } else {
        // If the recipe is not favorited, delete the document from Firestore
        await docRef.delete();
      }
    }
  }

  Future<void> cookRecipe(String recipeId, bool isCooked) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get a reference to the recipe document in the user's "favorite_recipes" collection
      DocumentReference docRef = FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .collection('cooked_recipes')
          .doc(recipeId);

      if (isCooked) {
        // If the recipe is favorited, set the favorited status in Firestore
        await docRef.set({'cooked': true});
      } else {
        // If the recipe is not favorited, delete the document from Firestore
        await docRef.delete();
      }
    }
  }

  Future<List<dynamic>> fetchRecipeIngredients(String recipeId) async {
    final String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/ingredientWidget.json?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> ingredients = List<Map<String, dynamic>>.from(
          responseData['ingredients'] as Iterable<dynamic>);

      print('Ingredients for recipe $recipeId: $ingredients');
      return ingredients;
    } else {
      print('Failed to fetch ingredients for recipe $recipeId');
      return [];
    }
  }

  Future<Map<String, List<String>>> fetchIngredientSubstitutes(
      String recipeId, List<dynamic> ingredients) async {
    Map<String, List<String>> substitutes = {};
    final String apiKey = '25e156a57e0b43be98220d6f32fd8ff4';

    for (var ingredient in ingredients) {
      final String ingredientName = ingredient['name'];
      final String substitutesApiUrl =
          'https://api.spoonacular.com/food/ingredients/substitutes?ingredientName=$ingredientName&apiKey=$apiKey';

      try {
        final response = await http.get(Uri.parse(substitutesApiUrl));
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          print('Response for $ingredientName: $jsonData'); // Debug print
          if (jsonData['status'] == 'success') {
            if (jsonData['substitutes'] != null) {
              final List<dynamic> substitutesData = jsonData['substitutes'];
              // Convert all substitutes to strings and add them to the map
              substitutes[ingredientName] = substitutesData
                  .map((substitute) => substitute.toString())
                  .toList();
            }
          } else {
            print(
                'No substitutes found for $ingredientName: ${jsonData['message']}');
          }
        } else {
          print(
              'Failed to fetch substitutes for ingredient $ingredientName. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print(
            'Error fetching substitutes for ingredient $ingredientName: $error');
      }
    }

    return substitutes;
  }

  Future<void> initLangDetect() async {
    await langdetect.initLangDetect();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<List<Place>> fetchAllNearbySupermarkets(Position position) async {
    List<Place> allSupermarkets = [];
    String? nextPageToken;

    do {
      final response = await http.get(
        Uri.https('maps.googleapis.com', '/maps/api/place/nearbysearch/json', {
          'location': '${position.latitude},${position.longitude}',
          'radius': '6500',
          'type': 'supermarket',
          'key': 'AIzaSyAf6HTxdylUKq--4Wbi6Ana_A5CqROsAIY',
          if (nextPageToken != null) 'pagetoken': nextPageToken,
        }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        allSupermarkets.addAll(
            (data['results'] as List).map((i) => Place.fromJson(i)).toList());
        nextPageToken = data['next_page_token'];

        if (nextPageToken != null) {
          await Future.delayed(Duration(seconds: 3));
        }
      } else {
        throw Exception('Failed to load supermarkets');
      }
    } while (nextPageToken != null);

    return allSupermarkets;
  }

  void updateServings(int newServings) {
    double ratio = newServings / servings;
    setState(() {
      servings = newServings;
      for (var ingredient in ingredients) {
        ingredient['amount']['metric']['value'] *= ratio;
      }
    });
    saveServings(
        newServings); // Save the new servings value in SharedPreferences
  }

  void loadServings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedServings = prefs.getInt('servings') ?? widget.recipe['servings'];

    // If the saved servings value is different from the one fetched from the API,
    // reset the servings value to the one fetched from the API.
    if (savedServings != widget.recipe['servings']) {
      double ratio = savedServings / servings; // Calculate the ratio

      setState(() {
        servings = widget.recipe['servings'];

        // Update the amount of each ingredient
        for (var ingredient in ingredients) {
          ingredient['amount']['metric']['value'] *= ratio;
        }
      });

      saveServings(
          servings); // Save the new servings value in SharedPreferences
    } else {
      setState(() {
        servings = savedServings;
      });
    }
  }

  void saveServings(int servings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('servings', servings);
  }

  @override
  Widget build(BuildContext context) {
    final double rating = ((widget.recipe['rating'] / 100) * 5) ?? 0.0;
    bool _favoriteStatusChanged = false;
    @override
    void dispose() {
      Navigator.pop(context, _favoriteStatusChanged);
      super.dispose();
    }

    return Scaffold(
        backgroundColor: const Color(0xff272a32),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Positioned(
                        top: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image.network(
                            widget.recipe['image'] ??
                                '<https://via.placeholder.com/150>',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 300,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              // If there's an error (e.g., 404 not found), display a local asset
                              return const Image(
                                image: AssetImage(
                                    '/Users/swtayx/Desktop/flutter_projects/recipes/assets/notavaliable.png'),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 300,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 40),
                      child: Positioned(
                        left: 40,
                        top: 110,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(0, 53, 56, 66),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(125, 53, 56, 66),
                                  spreadRadius: 4,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(125, 53, 56, 66),
                                  spreadRadius: 4,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: const Icon(
                              IconlyLight.arrow_left_2,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 110,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 53, 56, 66),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(125, 53, 56, 66),
                              spreadRadius: 4,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                            BoxShadow(
                              color: Color.fromARGB(125, 53, 56, 66),
                              spreadRadius: 4,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                            onTap: () async {
                              if (isIconHSelected) {
                                // Show the alert only if the recipe is favorited
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  backgroundColor: const Color(0xff272a32),
                                  title: 'Are you sure',
                                  titleColor: Colors.white,
                                  text:
                                      "Are you sure you want to remove\n your ${widget.recipe['title']} recipe from favorites? \n",
                                  textColor: const Color(0xff686f82),
                                  confirmBtnColor: const Color(0xffff7269),
                                  confirmBtnText: 'Yes',
                                  cancelBtnText: 'No',
                                  onCancelBtnTap: () => Navigator.pop(context),
                                  onConfirmBtnTap: () {
                                    // Only change state and call favoriteRecipe if user clicks "Yes"
                                    setState(() {
                                      isIconHSelected = !isIconHSelected;
                                    });
                                    favoriteRecipe(
                                        widget.recipe['id'].toString(),
                                        isIconHSelected);
                                    Navigator.pop(context);
                                    QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        backgroundColor:
                                            const Color(0xff272a32),
                                        title: 'Recipe Removed',
                                        titleColor: Colors.white,
                                        text:
                                            "Your recipe has been removed\nfrom favorites. \n",
                                        textColor: const Color(0xff686f82),
                                        confirmBtnColor:
                                            const Color(0xffff7269),
                                        confirmBtnText: 'Back home',
                                        onConfirmBtnTap: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        });
                                  },
                                );
                              }
                              if (!isIconHSelected) {
                                setState(() {
                                  isIconHSelected = !isIconHSelected;
                                });
                                favoriteRecipe(widget.recipe['id'].toString(),
                                    isIconHSelected);
                              }
                            },
                            child: Icon(
                              Atlas.heart,
                              color: isIconHSelected
                                  ? Color(0xffff7269)
                                  : Colors.white,
                              size: 30,
                            )),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 175,
                      child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 53, 56, 66),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(125, 53, 56, 66),
                                spreadRadius: 4,
                                blurRadius: 3,
                                offset: Offset(0, 0),
                              ),
                              BoxShadow(
                                color: Color.fromARGB(125, 53, 56, 66),
                                spreadRadius: 4,
                                blurRadius: 3,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              if (isIconCSelected) {
                                // Show the alert only if the recipe is favorited
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  backgroundColor: const Color(0xff272a32),
                                  title: 'Are you sure',
                                  titleColor: Colors.white,
                                  text:
                                      "Are you sure you want to remove\n your ${widget.recipe['title']} recipe from your cooked? \n",
                                  textColor: const Color(0xff686f82),
                                  confirmBtnColor: const Color(0xffff7269),
                                  confirmBtnText: 'Yes',
                                  cancelBtnText: 'No',
                                  onCancelBtnTap: () => Navigator.pop(context),
                                  onConfirmBtnTap: () {
                                    // Only change state and call favoriteRecipe if user clicks "Yes"
                                    setState(() {
                                     isIconCSelected = !isIconCSelected;
                                    });
                                    cookRecipe(
                                        widget.recipe['id'].toString(),
                                        isIconCSelected);
                                    Navigator.pop(context);
                                    QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        backgroundColor:
                                            const Color(0xff272a32),
                                        title: 'Recipe Removed',
                                        titleColor: Colors.white,
                                        text:
                                            "Your recipe has been removed\nfrom cooked. \n",
                                        textColor: const Color(0xff686f82),
                                        confirmBtnColor:
                                            const Color(0xffff7269),
                                        confirmBtnText: 'Back home',
                                        onConfirmBtnTap: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        });
                                  },
                                );
                              }
                              if (!isIconCSelected) {
                                setState(() {
                                  isIconCSelected = !isIconCSelected;
                                });
                                cookRecipe(widget.recipe['id'].toString(),
                                    isIconCSelected);
                              }
                            },
                            child: Icon(
                              Atlas.hot_food,
                              color: isIconCSelected
                                  ? Color(0xffff7269)
                                  : Colors.white,
                              size: 30,
                            )),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 320,
                      ),
                      child: Positioned(
                        top: 200,
                        left: 30,
                        right: 30,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 53, 56, 66),
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the radius here
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  '${widget.recipe['title']} ',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.1,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 0,
                                  right: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.people_alt_outlined,
                                      color: Color.fromARGB(255, 231, 149, 91),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '$servings serve',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 104, 111, 130),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isIconUp1 = !isIconUp1;
                                        });
                                      },
                                      child: Icon(
                                        isIconUp1
                                            ? Iconsax.arrow_up_2_copy
                                            : Iconsax.arrow_down_1_copy,
                                        color: isIconUp1
                                            ? const Color.fromARGB(
                                                255, 231, 149, 91)
                                            : const Color.fromARGB(
                                                255, 255, 255, 255),
                                        size: 13,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Iconsax.timer_1_copy,
                                      color: Color.fromARGB(255, 231, 149, 91),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '${widget.recipe['prepTime'] ?? 'N/A'} mins',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 104, 111, 130),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      AkarIcons.fire,
                                      color: Color.fromARGB(255, 231, 149, 91),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '${widget.recipe['calories'] ?? 'N/A'} kcal',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color:
                                            Color.fromARGB(255, 104, 111, 130),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 300,
                        top: 303,
                      ),
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 225, 179),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              IconlyBold.star,
                              color: Color.fromARGB(255, 255, 173, 48),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${rating.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isIconUp1,
                      child: Padding(
                        padding: widget.recipe['title'].length >= 27
                            ? EdgeInsets.only(
                                left: 70,
                                top: widget.recipe['title'].length >= 70
                                    ? 500
                                    : widget.recipe['title'].length >= 44
                                        ? 467
                                        : 437,
                              )
                            : const EdgeInsets.only(
                                left: 70,
                                top: 405,
                              ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 170,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 53, 56, 66),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(78, 0, 0, 0),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          servings++; // Increase servings by one
                                          saveServings(
                                              servings); // Save servings

                                          showInvalidServingsMessage = false;
                                          for (int i = 0;
                                              i < originalValues.length;
                                              i++) {
                                            double newAmount =
                                                originalValues[i] *
                                                    servings /
                                                    widget.recipe['servings'];
                                            currentValues[i] = double.parse(
                                                newAmount.toStringAsFixed(2));
                                          }
                                        });
                                      },
                                      child: const Icon(
                                        Iconsax.add_circle_copy,
                                        color: Color(0xffff7269),
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  const VerticalDivider(
                                    color: Color.fromARGB(255, 37, 40, 48),
                                    thickness: 1,
                                    width: 10,
                                    endIndent: 0,
                                    indent: 0,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '$servings servings',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  const VerticalDivider(
                                    color: Color.fromARGB(255, 37, 40, 48),
                                    thickness: 1,
                                    width: 10,
                                    endIndent: 0,
                                    indent: 0,
                                  ),
                                  const SizedBox(width: 3),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (servings > 1) {
                                          servings--; // Decrease servings by one
                                          for (int i = 0;
                                              i < originalValues.length;
                                              i++) {
                                            double newAmount =
                                                originalValues[i] *
                                                    servings /
                                                    widget.recipe['servings'];
                                            currentValues[i] = double.parse(
                                                newAmount.toStringAsFixed(2));
                                          }
                                          showInvalidServingsMessage = false;
                                        } else {
                                          setState(() {
                                            showInvalidServingsMessage =
                                                true; // Show the message
                                          });
                                        }
                                        saveServings(servings); // Save servings
                                      });
                                    },
                                    child: const Icon(
                                      Iconsax.minus_cirlce_copy,
                                      color: Color(0xffff7269),
                                      size: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Visibility(
                              visible: showInvalidServingsMessage,
                              child: const Text(
                                'Servings cannot be less than 1',
                                style: TextStyle(
                                  color: Color(0xffff7269),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 23),
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 7),
                      GroceryDialog(context),
                      Expanded(
                        child: Text(
                          '${widget.recipe['ingredientsCount'] ?? 'N/A'} Items',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 104, 111, 130),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIconUp = !isIconUp;
                          });
                        },
                        child: Icon(
                          isIconUp
                              ? Iconsax.arrow_up_2_copy
                              : Iconsax.arrow_down_1_copy,
                          color: isIconUp
                              ? const Color(0xffff7269)
                              : const Color.fromARGB(255, 255, 255, 255),
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: isIconUp,
                    child: Column(
                      children: [
                        for (int i = 0;
                            i < widget.recipe['ingredients'].length;
                            i += 2)
                          Padding(
                            padding: const EdgeInsets.only(right: 37, left: 37),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (i < currentValues.length)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 1.5),
                                      child: Icon(
                                        Atlas.arrow_right_circle_bold,
                                        color: Color(0xffff7269),
                                        size: 15,
                                      ),
                                    ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '${currentValues[i]} ${widget.recipe['ingredients'][i]['amount']['metric']['unit']} ${widget.recipe['ingredients'][i]['name']}',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 37),
                                  if (i + 1 < currentValues.length)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 1.5),
                                      child: Icon(
                                        Atlas.arrow_right_circle_bold,
                                        color: Color(0xffff7269),
                                        size: 15,
                                      ),
                                    ),
                                  const SizedBox(width: 8),
                                  if (i + 1 < currentValues.length)
                                    Expanded(
                                      child: Text(
                                        '${currentValues[i + 1]} ${widget.recipe['ingredients'][i + 1]['amount']['metric']['unit']} ${widget.recipe['ingredients'][i + 1]['name']}',
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    height: 1,
                    color: const Color.fromARGB(255, 104, 111, 130),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 23),
                      const Text(
                        'Ingredients Alternatives',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Icon(
                          isIconUpAlt
                              ? SolarIconsOutline.chefHat
                              : SolarIconsOutline.chefHat,
                          color: isIconUpAlt
                              ? const Color(0xffff7269)
                              : const Color.fromARGB(255, 104, 111, 130),
                          size: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIconUpAlt = !isIconUpAlt;
                          });
                        },
                        child: Icon(
                          isIconUpAlt
                              ? Iconsax.arrow_up_2_copy
                              : Iconsax.arrow_down_1_copy,
                          color: isIconUpAlt
                              ? const Color(0xffff7269)
                              : const Color.fromARGB(255, 255, 255, 255),
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                  const SizedBox(height: 15),
                  FutureBuilder<Map<String, List<String>>>(
                    future: substitutesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(); // or you can use SizedBox.shrink()
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.red));
                      } else {
                        final Map<String, List<String>> substitutes =
                            snapshot.data ?? {};
                        final List<Map<String, dynamic>> ingredients =
                            widget.recipe['ingredients'];
                        List<Map<String, dynamic>> uniqueIngredients =
                            ingredients
                                .map((ingredient) => ingredient['name'])
                                .toSet()
                                .toList()
                                .map((name) => ingredients.firstWhere(
                                    (ingredient) => ingredient['name'] == name))
                                .toList();
                        return Visibility(
                          visible: isIconUpAlt,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'The Alternatives for:',
                                      style: TextStyle(
                                          fontSize: 17.5,
                                          color: Color.fromARGB(
                                              255, 104, 111, 130),
                                          fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Container(
                                    height: 65,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10), // This adds border radius
                                      color: Color.fromARGB(255, 53, 56, 66),
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        dividerColor: Color(0xffff7269),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 14.0, right: 14, bottom: 4),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            iconEnabledColor: Color(0xffff7269),
                                            iconDisabledColor: Color.fromARGB(
                                                255, 104, 111, 130),
                                            dropdownColor:
                                                Color.fromARGB(255, 53, 56, 66),
                                            menuMaxHeight: 170,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            isExpanded: true,
                                            value: selectedIngredient,
                                            hint: const Text(
                                                "Select Ingredient",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontFamily: 'Poppins')),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedIngredient = newValue;
                                                selectedSubstitute =
                                                    substitutes[newValue];
                                              });
                                            },
                                            items: uniqueIngredients
                                                .map<DropdownMenuItem<String>>(
                                                    (Map<String, dynamic>
                                                        ingredient) {
                                              return DropdownMenuItem<String>(
                                                value: ingredient['name'],
                                                child: Text(ingredient['name'],
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins')),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (selectedIngredient != null)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ...selectedSubstitute?.map((item) =>
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 45.0,
                                                    right: 15,
                                                    bottom: 5),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5.0),
                                                      child: Icon(
                                                        Icons.circle_outlined,
                                                        size: 15,
                                                        color:
                                                            Color(0xffff7269),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 30.0),
                                                        child: Text(
                                                          item,
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontFamily:
                                                                  'Poppins'),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )) ??
                                          [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 45.0,
                                                  right: 15,
                                                  bottom: 5),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'This ingredient cannot be replaced.',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Color.fromARGB(
                                                            255, 104, 111, 130),
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    height: 1,
                    color: const Color.fromARGB(255, 104, 111, 130),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 23),
                      const Text(
                        'Cooking Steps',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${widget.recipe['instructions'].length ?? 'N/A'} Steps',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 104, 111, 130),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIconUpStep = !isIconUpStep;
                          });
                        },
                        child: Icon(
                          isIconUpStep
                              ? Iconsax.arrow_up_2_copy
                              : Iconsax.arrow_down_1_copy,
                          color: isIconUpStep
                              ? const Color.fromARGB(255, 255, 114, 105)
                              : const Color.fromARGB(255, 255, 255, 255),
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                  const SizedBox(height: 20),
                  instructions(isIconUpStep: isIconUpStep, widget: widget),
                  const SizedBox(
                    height: 26,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: HomePage(
              index: 0,
            ),
          ),
        ]));
  }

  GestureDetector GroceryDialog(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isReceiptClicked = !isReceiptClicked;
        });
        if (isReceiptClicked) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 53, 56, 66),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Grocery List",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ), // Set your desired text color here
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Copy the grocery list, or take a screenshot and get the recipe ingredients from the nearest market!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 120, 126, 145),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.5,
                      ),
                    ),
                    const SizedBox(height: 30), // Adjust the spacing as needed
                    Container(
                      height: 166,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color.fromARGB(70, 22, 22, 22).withOpacity(
                                0.2), // Adjust opacity or color as needed
                          ],
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            widget.recipe['ingredients'].length,
                            (index) {
                              final ingredient =
                                  widget.recipe['ingredients'][index];
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 1.8),
                                        child: Icon(
                                          Atlas.check_clipboard_thin,
                                          color: Color(0xffff7269),
                                          size: 18,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          ' ${ingredient['name']}',
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 23),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      height: 1,
                      color: const Color.fromARGB(255, 104, 111, 130),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Create a string of all ingredients
                            String ingredientsText = "";
                            for (final ingredient
                                in widget.recipe['ingredients']) {
                              ingredientsText += '- ${ingredient['name']}\n';
                            }
                            // Copy ingredients to clipboard
                            Clipboard.setData(
                                ClipboardData(text: ingredientsText));
                            // Optionally, you can show a message that the ingredients are copied
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.fixed,
                                backgroundColor: const Color.fromARGB(255, 53,
                                    56, 66), // Background color of the SnackBar
                                content: SizedBox(
                                  width: 50, // Set your desired width here
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Radius for rounded corners
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(
                                          7.0), // Padding inside the container
                                      child: Text(
                                        'Grocery list is copied to clipboard!',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255), // Text color
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Iconsax.clipboard_text_copy,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 22,
                              ),
                              SizedBox(width: 9),
                              Text(
                                "Copy list to clipboard",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final position = await _determinePosition();
                            final supermarkets =
                                await fetchAllNearbySupermarkets(position);

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor:
                                      const Color.fromARGB(255, 53, 56, 66),
                                  child: Container(
                                    height: 390,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Choose a Supermarket',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: FutureBuilder(
                                            future: langdetect.initLangDetect(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                return ListView.builder(
                                                  itemCount:
                                                      supermarkets.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final language =
                                                        langdetect.detect(
                                                            supermarkets[index]
                                                                .name);
                                                    return Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10.0),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons
                                                                  .shopping_cart,
                                                              color: const Color(
                                                                  0xffff7269),
                                                              size: 20,
                                                            ),
                                                            title: Text(
                                                              supermarkets[
                                                                      index]
                                                                  .name,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily: language ==
                                                                        'ar'
                                                                    ? 'ReadexPro'
                                                                    : hasArabicCharacters(
                                                                            supermarkets[index].name)
                                                                        ? 'ReadexPro'
                                                                        : 'Poppins',
                                                              ),
                                                            ),
                                                            onTap: () async {
                                                              Navigator.pop(
                                                                  context);
                                                              final url = Uri.parse(
                                                                  'https://www.google.com/maps/search/?api=1&query=${supermarkets[index].latitude},${supermarkets[index].longitude}');
                                                              if (await canLaunchUrl(
                                                                  url)) {
                                                                await launchUrl(
                                                                    url);
                                                              } else {
                                                                print(
                                                                    'Could not launch $url');
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Divider(
                                                          color: const Color
                                                              .fromARGB(177,
                                                              255, 255, 255),
                                                          thickness: 0.5,
                                                          endIndent: 17,
                                                          indent: 17,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              } else {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  Iconsax.location_copy,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Find nearby supermarkets",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.4,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Iconsax.arrow_right_3_copy,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      child: const Icon(
        Iconsax.receipt_2_1_copy,
        color: Color.fromARGB(255, 255, 255, 255),
        size: 20,
      ),
    );
  }
}

class instructions extends StatelessWidget {
  const instructions({
    super.key,
    required this.isIconUpStep,
    required this.widget,
  });

  final bool isIconUpStep;
  final RecipeInfo widget;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isIconUpStep,
      child: Column(
        children: [
          for (int i = 0; i < widget.recipe['instructions'].length; i++)
            Container(
              width: 380, // Adjust width to fit the screen
              // Grey background color
              padding: const EdgeInsets.only(
                  top: 17,
                  bottom: 17,
                  right: 20,
                  left: 20), // Adjust padding as needed
              margin: const EdgeInsets.symmetric(
                  vertical: 8), // Adjust margin as needed
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                    255, 84, 88, 104), // Grey background color
                borderRadius:
                    BorderRadius.circular(12), // Adjust the radius as needed
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step ${i + 1}', // Step number
                    style: const TextStyle(
                      color: Color(0xffff7269),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                      height:
                          10), // Adjust spacing between step number and instruction
                  Text(
                    widget.recipe['instructions'][i],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
