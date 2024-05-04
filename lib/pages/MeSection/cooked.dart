import 'package:appebite/RecipeInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:iconly/iconly.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:http/http.dart' as http;

class CookedPage extends StatefulWidget {
  final String mealType;
  final String cuisineType;
  const CookedPage({
    Key? key,
    this.mealType = '',
    this.cuisineType = '',
  }) : super(key: key);

  @override
  State<CookedPage> createState() => _CookedPageState();
}

class _CookedPageState extends State<CookedPage> {
  List<Map<String, dynamic>> _breakfastRecipes = [];
  Future<void>? _fetchDataFuture;
  

  @override
  void initState() {
    super.initState();
  _fetchDataFuture = fetchRecipesFromCooked();

  }

  Future<void> fetchBreakfastRecipes(String mealType, cuisineType) async {
    const String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final String apiUrl =
        'https://api.spoonacular.com/recipes/complexSearch?type=$mealType&cuisine=$cuisineType&number=4&apiKey=$apiKey';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Map<String, dynamic>> recipes = List<Map<String, dynamic>>.from(
            jsonData['results'] as Iterable<dynamic>);

        // Fetch and add rating, servings, calories, and prep time data for each recipe
        for (var recipe in recipes) {
          final double rating =
              await fetchRecipeRating(recipe['id'].toString());
          final int servings =
              await fetchRecipeServings(recipe['id'].toString());
          final int calories =
              await fetchRecipeCalories(recipe['id'].toString());
          final int prepTime =
              await fetchRecipePrepTime(recipe['id'].toString());
          final List<dynamic> ingredients = await fetchRecipeIngredients(
              recipe['id'].toString()); // Fetching ingredients
          final List<String> instructions =
              await fetchRecipeInstructions((recipe['id'].toString()));
          final List<String> substitutes = await fetchIngredientSubstitutes(
              recipe['id'].toString(), ingredients);

          recipe['rating'] = rating;
          recipe['servings'] = servings;
          recipe['calories'] = calories;
          recipe['prepTime'] = prepTime;
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
      // Handle error appropriately, e.g., show a snackbar
    }
  }
Future<void> fetchRecipesFromFavorites() async {
  // Get the current user
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Fetch the user's favorite recipes from Firestore
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .collection('favorite_recipes')
        
        .get();
        

    // Loop over each document in the 'favorite_recipes' collection
    for (var doc in querySnapshot.docs) {
      // The document ID is the recipe ID
      String recipeId = doc.id;
 bool isFavorited = (doc.data() as Map<String, dynamic>)['favorited'] ?? false;
bool isCooked = (doc.data() as Map<String, dynamic>)['cooked'] ?? false;
      // Fetch and add rating, servings, calories, and prep time data for the recipe
      final String titleF = await fetchRecipeName(recipeId);
      final double ratingF = await fetchRecipeRating(recipeId);
      final String recipeImageUrl = await fetchRecipeImageUrl(recipeId);
      final int servingsF = await fetchRecipeServings(recipeId);
      final int caloriesF = await fetchRecipeCalories(recipeId);
      final int prepTimeF = await fetchRecipePrepTime(recipeId);
      final List<dynamic> ingredientsF = await fetchRecipeIngredients(recipeId);
      final List<String> instructionsF = await fetchRecipeInstructions(recipeId);
      final List<String> substitutesF = await fetchIngredientSubstitutes(recipeId, ingredientsF);
int ingredientsCount = ingredientsF.length;

      // Create a new map for the recipe
      Map<String, dynamic> recipe = {
        'id': recipeId,
        'rating': ratingF,
        'title' : titleF,
        'favorited': isFavorited,
        'cooked': isCooked,
        'image': recipeImageUrl,
        'servings': servingsF,
        'calories': caloriesF,
        'prepTime': prepTimeF,
        'ingredients': ingredientsF,
        'instructions': instructionsF,
        'substitutes': substitutesF,
        'ingredientsCount': ingredientsCount,
      };

      // Add the recipe to _breakfastRecipes
      setState(() {
        _breakfastRecipes.add(recipe);
      });
    }
  }
}
Future<void> fetchRecipesFromCooked() async {
  // Get the current user
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // Fetch the user's favorite recipes from Firestore
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .collection('cooked_recipes')
        .get();
        

    // Loop over each document in the 'favorite_recipes' collection
    for (var doc in querySnapshot.docs) {
      // The document ID is the recipe ID
      String recipeId = doc.id;
 bool isCooked = (doc.data() as Map<String, dynamic>)['cooked'] ?? false;
  bool isFavorited = (doc.data() as Map<String, dynamic>)['favorited'] ?? false;
      // Fetch and add rating, servings, calories, and prep time data for the recipe
      final String titleF = await fetchRecipeName(recipeId);
      final double ratingF = await fetchRecipeRating(recipeId);
      final String recipeImageUrl = await fetchRecipeImageUrl(recipeId);
      final int servingsF = await fetchRecipeServings(recipeId);
      final int caloriesF = await fetchRecipeCalories(recipeId);
      final int prepTimeF = await fetchRecipePrepTime(recipeId);
      final List<dynamic> ingredientsF = await fetchRecipeIngredients(recipeId);
      final List<String> instructionsF = await fetchRecipeInstructions(recipeId);
      final List<String> substitutesF = await fetchIngredientSubstitutes(recipeId, ingredientsF);
int ingredientsCount = ingredientsF.length;

      // Create a new map for the recipe
      Map<String, dynamic> recipe = {
        'id': recipeId,
        'rating': ratingF,
        'title' : titleF,
        'cooked': isCooked,
         'favorited': isFavorited,
        'image': recipeImageUrl,
        'servings': servingsF,
        'calories': caloriesF,
        'prepTime': prepTimeF,
        'ingredients': ingredientsF,
        'instructions': instructionsF,
        'substitutes': substitutesF,
        'ingredientsCount': ingredientsCount,
      };

      // Add the recipe to _breakfastRecipes
      setState(() {
        _breakfastRecipes.add(recipe);
      });
    }
  }
}
Future<String> fetchRecipeName(String recipeId) async {
  const String apiKey = '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final String recipeName = responseData['title'] ?? ''; // Fetch the recipe title here
    return recipeName;
  } else {
    return '';
  }
}

Future<String> fetchRecipeImageUrl(String recipeId) async {
  const String apiKey =
      '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final String imageUrl = responseData['image'] ?? '';
    return imageUrl;
  } else {
    return '';
  }
}

  Future<double> fetchRecipeRating(String recipeId) async {
    const String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final double rating = responseData['spoonacularScore'] ?? 0.0;
      return rating;
    } else {
      return 0.0;
    }
  }

  Future<int> fetchRecipeServings(String recipeId) async {
    const String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int servings = responseData['servings'] ?? 0;
      return servings;
    } else {
      return 0;
    }
  }

  Future<int> fetchRecipeCalories(String recipeId) async {
    const String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/nutritionWidget.json?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int calories = int.parse(responseData['calories'].toString());
      return calories;
    } else {
      return 0;
    }
  }

  Future<int> fetchRecipePrepTime(String recipeId) async {
    const String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int prepTime = responseData['readyInMinutes'] ?? 0;
      return prepTime;
    } else {
      return 0;
    }
  }

  Future<List<dynamic>> fetchRecipeIngredients(String recipeId) async {
    const String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/ingredientWidget.json?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      List<Map<String, dynamic>> ingredients = List<Map<String, dynamic>>.from(
          responseData['ingredients'] as Iterable<dynamic>);

      // Remove duplicates
      final ingredientNames =
          ingredients.map((ingredient) => ingredient['name']).toSet();
      ingredients.retainWhere(
          (ingredient) => ingredientNames.remove(ingredient['name']));

      return ingredients;
    } else {
      return [];
    }
  }

  Future<List<String>> fetchRecipeInstructions(String recipeId) async {
    const String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/analyzedInstructions?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final List<dynamic> instructionsData = json.decode(response.body);
      if (instructionsData.isNotEmpty) {
        final List<dynamic> steps = instructionsData[0]['steps'];
        List<String> instructions = [];
        steps.forEach((stepData) {
          final String step = stepData['step'].toString();
          final List<String> separatedSteps =
              _splitSteps(step); // Split steps based on patterns
          instructions.addAll(separatedSteps);
        });
        instructions = instructions
            .where((step) => step.trim().isNotEmpty)
            .toList(); // Remove empty steps
        return instructions;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  List<String> _splitSteps(String step) {
    // Define patterns that indicate the end of a step
    final List<String> patterns = ['.', '!', '?', ';'];

    // Loop through each pattern and split the step based on it
    for (String pattern in patterns) {
      step = step.replaceAll(pattern, '$pattern\n');
    }

    // Split the step into individual lines and trim each line
    List<String> lines = step.split('\n');
    lines = lines.map((line) => line.trim()).toList();

    // Remove any empty lines
    lines = lines.where((line) => line.isNotEmpty).toList();

    return lines;
  }

  Future<List<String>> fetchIngredientSubstitutes(
      String recipeId, List<dynamic> ingredients) async {
    List<String> substitutes = [];
    const String apiKey = '25e156a57e0b43be98220d6f32fd8ff4';

    for (var ingredient in ingredients) {
      final String ingredientName = ingredient['name'];
      final String substitutesApiUrl =
          'https://api.spoonacular.com/food/ingredients/substitutes?ingredientName=$ingredientName&apiKey=$apiKey';

      try {
        final response = await http.get(Uri.parse(substitutesApiUrl));
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          // Debug print
          if (jsonData['status'] == 'success') {
            if (jsonData['substitutes'] != null) {
              final List<dynamic> substitutesData = jsonData['substitutes'];
              // Cast each substitute to a string before adding it to the list
              substitutes.addAll(
                  substitutesData.map((substitute) => substitute.toString()));
            }
          } else {
          }
        } else {
        }
      } catch (error) {
      }
    }

    return substitutes;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff7269)),
            ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Container(
              padding: const EdgeInsets.only(
                  top: 100, bottom: 65, right: 15, left: 15),
              child: ListView.builder(
                  itemCount: _breakfastRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _breakfastRecipes[index];
                    return RecipeCard1(recipe: recipe);
                  }),
            );
          }
        });
  }
}

class RecipeCard1 extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeCard1({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rating = ((recipe['rating'] / 100) * 5) ?? 0.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => RecipeInfo(recipe: recipe),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0.0,
                    end: 500.0,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve:
                          Curves.easeInOut, // Specify the desired easing curve
                    ),
                  ),
                  child: child,
                );
              },
            ));
      },
      child: Card(
        margin: const EdgeInsets.all(15),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                recipe['image'] ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 190,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 20,
                      width: 50,
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
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${rating.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
                        const Color.fromARGB(0, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 3, right: 10),
                        child: Text(
                          recipe['title'] ?? 'Untitled Recipe',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.people_alt_outlined,
                              color: Color.fromARGB(255, 231, 149, 91),
                              size: 19,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${recipe['servings'] ?? 'N/A'} serves',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 13),
                            const Icon(
                              Iconsax.timer_1_copy,
                              color: Color.fromARGB(255, 231, 149, 91),
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${recipe['prepTime'] ?? 'N/A'} mins',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 13),
                            const Icon(
                              AkarIcons.fire,
                              color: Color.fromARGB(255, 231, 149, 91),
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${recipe['calories'] ?? 'N/A'} kcal',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
