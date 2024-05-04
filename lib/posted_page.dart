import 'package:appebite/Widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:atlas_icons/atlas_icons.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/services.dart';
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

class RecipeInfoP extends StatefulWidget {
  final Map<String, dynamic> recipe;
  const RecipeInfoP({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeInfoPState createState() => _RecipeInfoPState();
}

class _RecipeInfoPState extends State<RecipeInfoP> {
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
      _determinePosition();
    initLangDetectFuture = langdetect.initLangDetect();
    // Load servings value from SharedPreferences
    // Initialize servings with the recipe's servings from the API
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
          await Future.delayed(const Duration(seconds: 3));
        }
      } else {
        throw Exception('Failed to load supermarkets');
      }
    } while (nextPageToken != null);

    return allSupermarkets;
  }
  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        widget.recipe['imageUrl'] ?? 'https://via.placeholder.com/150';
    final double rating = widget.recipe['RecipeRating'] ?? 0.0;

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
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 300,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
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
                                widget.recipe['foodName'] ?? 'Untitled Recipe',
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
                                    '${widget.recipe['servings'] ?? 'N/A'} serves',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 104, 111, 130),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
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
                                    '${(widget.recipe['cookingDuration'] ?? 0).round()} mins',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromARGB(255, 104, 111, 130),
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
                                      color: Color.fromARGB(255, 104, 111, 130),
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
                          '${widget.recipe['Ingredients'].length} Items',
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
      for (int i = 0; i < widget.recipe['Ingredients'].length; i += 2)
        Padding(
          padding: const EdgeInsets.only(right: 37, left: 37),
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i < widget.recipe['Ingredients'].length)
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
                    '${widget.recipe['Ingredients'][i]}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 37),
                if (i + 1 < widget.recipe['Ingredients'].length)
                  const Padding(
                    padding: EdgeInsets.only(top: 1.5),
                    child: Icon(
                      Atlas.arrow_right_circle_bold,
                      color: Color(0xffff7269),
                      size: 15,
                    ),
                  ),
                const SizedBox(width: 8),
                if (i + 1 < widget.recipe['Ingredients'].length)
                  Expanded(
                    child: Text(
                      '${widget.recipe['Ingredients'][i + 1]}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
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
                    height: 15,
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
                          '${widget.recipe['Steps'].length ?? 'N/A'} Steps',
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
              ])))),
          const Padding(
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
                            const Color.fromARGB(70, 22, 22, 22).withOpacity(
                                0.2), // Adjust opacity or color as needed
                          ],
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            widget.recipe['Ingredients'].length,
                            (index) {
                              final ingredient =
                                  widget.recipe['Ingredients'][index];
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
                                          ' $ingredient',
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
                                in widget.recipe['Ingredients']) {
                              ingredientsText += '- $ingredient\n';
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
                                          child: const Row(
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
                                                            leading: const Icon(
                                                              Icons
                                                                  .shopping_cart,
                                                              color: Color(
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
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        const Divider(
                                                          color: Color
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
                                                return const Center(
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
                              SizedBox(width: 9),
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
  final RecipeInfoP widget;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isIconUpStep,
      child: Column(
        children: [
          for (int i = 0; i < widget.recipe['Steps'].length; i++)
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
                    widget.recipe['Steps'][i],
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
