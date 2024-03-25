// import 'dart:convert';
// import 'package:appebite/pages/DietaryPlan/recipe.dart';
// import 'package:http/http.dart' as http;

// class RecipeAPI{
// // const req = unirest('GET', 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/complexSearch');

// // req.query({
// // 	query: 'pasta',
// // 	cuisine: 'italian',
// // 	excludeCuisine: 'greek',
// // 	diet: 'vegetarian',
// // 	intolerances: 'gluten',
// // 	equipment: 'pan',
// // 	includeIngredients: 'tomato,cheese',
// // 	excludeIngredients: 'eggs',
// // 	type: 'main course',
// // 	instructionsRequired: 'true',
// // 	fillIngredients: 'false',
// // 	addRecipeInformation: 'false',
// // 	titleMatch: 'Crock Pot',
// // 	maxReadyTime: '20',
// // 	ignorePantry: 'true',
// // 	sort: 'calories',
// // 	sortDirection: 'asc',
// // 	minCarbs: '10',
// // 	maxCarbs: '100',
// // 	minProtein: '10',
// // 	maxProtein: '100',
// // 	minCalories: '50',
// // 	maxCalories: '800',
// // 	minFat: '10',
// // 	maxFat: '100',
// // 	minAlcohol: '0',
// // 	maxAlcohol: '100',
// // 	minCaffeine: '0',
// // 	maxCaffeine: '100',
// // 	minCopper: '0',
// // 	maxCopper: '100',
// // 	minCalcium: '0',
// // 	maxCalcium: '100',
// // 	minCholine: '0',
// // 	maxCholine: '100',
// // 	minCholesterol: '0',
// // 	maxCholesterol: '100',
// // 	minFluoride: '0',
// // 	maxFluoride: '100',
// // 	minSaturatedFat: '0',
// // 	maxSaturatedFat: '100',
// // 	minVitaminA: '0',
// // 	maxVitaminA: '100',
// // 	minVitaminC: '0',
// // 	maxVitaminC: '100',
// // 	minVitaminD: '0',
// // 	maxVitaminD: '100',
// // 	minVitaminE: '0',
// // 	maxVitaminE: '100',
// // 	minVitaminK: '0',
// // 	maxVitaminK: '100',
// // 	minVitaminB1: '0',
// // 	maxVitaminB1: '100',
// // 	minVitaminB2: '0',
// // 	maxVitaminB2: '100',
// // 	minVitaminB5: '0',
// // 	maxVitaminB5: '100',
// // 	minVitaminB3: '0',
// // 	maxVitaminB3: '100',
// // 	minVitaminB6: '0',
// // 	maxVitaminB6: '100',
// // 	minVitaminB12: '0',
// // 	maxVitaminB12: '100',
// // 	minFiber: '0',
// // 	maxFiber: '100',
// // 	minFolate: '0',
// // 	maxFolate: '100',
// // 	minFolicAcid: '0',
// // 	maxFolicAcid: '100',
// // 	minIodine: '0',
// // 	maxIodine: '100',
// // 	minIron: '0',
// // 	maxIron: '100',
// // 	minMagnesium: '0',
// // 	maxMagnesium: '100',
// // 	minManganese: '0',
// // 	maxManganese: '100',
// // 	minPhosphorus: '0',
// // 	maxPhosphorus: '100',
// // 	minPotassium: '0',
// // 	maxPotassium: '100',
// // 	minSelenium: '0',
// // 	maxSelenium: '100',
// // 	minSodium: '0',
// // 	maxSodium: '100',
// // 	minSugar: '0',
// // 	maxSugar: '100',
// // 	minZinc: '0',
// // 	maxZinc: '100',
// // 	offset: '0',
// // 	number: '10',
// // 	limitLicense: 'false',
// // 	ranking: '2'
// // });

// // req.headers({
// 	// 'X-RapidAPI-Key': '930466fbedmshcf58277ae0cb9bfp1ec32djsnd413d2fcd778',
// 	// 'X-RapidAPI-Host': 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
// // });
// // static Future<List<Recipe>> getRecipe() async {
// //   var uri = Uri.https('spoonacular-recipe-food-nutrition-v1.p.rapidapi.com', '/recipes/complexSearch',
// //         {'query': 'pasta',
// // 	'cuisine': 'italian',
// // 	'excludeCuisine': 'greek',
// // 	'diet': 'vegetarian',
// // 	'intolerances': 'gluten',
// // '	equipment': 'pan',
// // 	'includeIngredients': 'tomato,cheese',
// // 	'excludeIngredients': 'eggs',
// // 	'type': 'main course',
// // 	'instructionsRequired': 'true',
// // 	'fillIngredients': 'false',
// // 	'addRecipeInformation': 'false',
// // 	'titleMatch': 'Crock Pot',
// // 	'maxReadyTime': '20',
// // 	'ignorePantry': 'true',
// // 	'sort': 'calories',
// // 	'sortDirection': 'asc',
// // 	'minCarbs': '10',
// // 	'maxCarbs': '100',
// // 	'minProtein': '10',
// // 	'maxProtein': '100',
// // 	'minCalories': '50',
// // 	'maxCalories': '800',
// // 	'minFat': '10',
// // 	'maxFat': '100',
// // 	'minAlcohol': '0',
// // 	'maxAlcohol': '100',
// // 	'minCaffeine': '0',
// // 	'maxCaffeine': '100',
// // 	'minCopper': '0',
// // 	'maxCopper': '100',
// // 	'minCalcium': '0',
// // 	'maxCalcium': '100',
// // 	'minCholine': '0',
// // 	'maxCholine': '100',
// // 	'minCholesterol': '0',
// // 	'maxCholesterol': '100',
// // 	'minFluoride': '0',
// // 	'maxFluoride': '100',
// // 	'minSaturatedFat': '0',
// // 	'maxSaturatedFat': '100',
// // 	'minVitaminA': '0',
// // 	'maxVitaminA': '100',
// // 	'minVitaminC': '0',
// // 	'maxVitaminC': '100',
// // 	'minVitaminD': '0',
// // 	'maxVitaminD': '100',
// // 	'minVitaminE': '0',
// // 	'maxVitaminE': '100',
// // 	'minVitaminK': '0',
// // 	'maxVitaminK': '100',
// // 	'minVitaminB1': '0',
// // 	'maxVitaminB1': '100',
// // 	'minVitaminB2': '0',
// // 	'maxVitaminB2': '100',
// // 	'minVitaminB5': '0',
// // 	'maxVitaminB5': '100',
// // 	'minVitaminB3': '0',
// // 	'maxVitaminB3': '100',
// // 	'minVitaminB6': '0',
// // '	maxVitaminB6': '100',
// // 	'minVitaminB12': '0',
// // 	'maxVitaminB12': '100',
// // 	'minFiber': '0',
// // 	'maxFiber': '100',
// // 	'minFolate': '0',
// // 	'maxFolate': '100',
// // 	'minFolicAcid': '0',
// // 	'maxFolicAcid': '100',
// // '	minIodine': '0',
// // 	'maxIodine': '100',
// // 	'minIron': '0',
// // 	'maxIron': '100',
// // 	'minMagnesium': '0',
// // 	'maxMagnesium': '100',
// // 	'minManganese': '0',
// // 	'maxManganese': '100',
// // 	'minPhosphorus': '0',
// // 	'maxPhosphorus': '100',
// // 	'minPotassium': '0',
// // 	'maxPotassium': '100',
// // 	'minSelenium': '0',
// // 	'maxSelenium': '100',
// // 	'minSodium': '0',
// // 	'maxSodium': '100',
// // 	'minSugar': '0',
// // 	'maxSugar': '100',
// // 	'minZinc': '0',
// // 	'maxZinc': '100',
// // 	'offset': '0',
// // 	'number': '10',
// // 	'limitLicense': 'false',
// // 	'ranking': '2'});


// //   final response = await http.get(uri, headers: {
// //       'X-RapidAPI-Key': '930466fbedmshcf58277ae0cb9bfp1ec32djsnd413d2fcd778',
// // 	    'X-RapidAPI-Host': 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
// //     });
// //     Map data = jsonDecode(response.body);
// //     List _temp = [];

// //      for (var i in data['results']) {
// //       _temp.add(i['title']['nutrients']);
// //     }

// //  return Recipe.recipesFromSnapshot(_temp);
// //}
// static Future<List<Recipe>> getRecipe() async {
//     var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
//         {'limit': '24','start': '0'
// });

//     final response = await http.get(uri, headers: {
// 	'X-RapidAPI-Key': '930466fbedmshcf58277ae0cb9bfp1ec32djsnd413d2fcd778',
// 	'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
// });

//     Map data = jsonDecode(response.body);
//     List temp = [];

//     for (var i in data['feed']) {
//       temp.add(i['content']['details']);
//     }

//     return Recipe.recipesFromSnapshot(temp);
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appebite/pages/DietaryPlan/recipe.dart';
import 'package:intl/intl.dart';

//import 'package:appebite/pages/DietaryPlan/diets_plans.dart';

// class RecipeScreen {
//   Future<List<Recipe>> fetchRecipes(String selectedDiet) async {
//     const String spoonacularAPIKey = 'd9c5891597b048099a122b1d7b26cf5d';
//     String recipesUrl =
//         'https://api.spoonacular.com/recipes/complexSearch?apiKey=$spoonacularAPIKey';

//     // Include selectedDiet in the URL
//     if (selectedDiet.isNotEmpty) {
//       // Append the selectedDiet as a diet parameter
//       recipesUrl += '&diet=$selectedDiet';
//     }

//     try {
//       final response = await http.get(Uri.parse(recipesUrl));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         // Check if the JSON response contains the expected key and if it's a list
//         if (jsonData.containsKey('results') && jsonData['results'] is List) {
//           final List<dynamic> recipeDataList = jsonData['results'];

//           // Convert the fetched JSON data into Recipe objects
//           final List<Recipe> fetchedRecipes =
//               recipeDataList.map((recipeData) => Recipe.fromJson(recipeData)).toList();

//           return fetchedRecipes;
//         } else {
//           print('Invalid data format: results key not found or not a list');
//           return [];
//         }
//       } else {
//         print('Failed to fetch recipes: ${response.statusCode}');
//         return [];
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       return [];
//     }
//   }
// }
// class RecipeScreen {
//   Future<List<Recipe>> fetchRecipes(String selectedDiet, DateTime selectedDate) async {
//     const String spoonacularAPIKey = '0aef9a341db345a48d23e87a5b903466';
//     final String baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';
//     final String selectedDietLower = selectedDiet.toLowerCase();
//     final String selectedDateFormatted = selectedDate.toIso8601String();

//     final String complexSearchUrl =
//         '$baseUrl?apiKey=$spoonacularAPIKey&diet=$selectedDietLower';

//     try {
//       final response = await http.get(Uri.parse(complexSearchUrl));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         if (jsonData.containsKey('results') && jsonData['results'] is List) {
//           final List<dynamic> recipeDataList = jsonData['results'];

//           final List<Recipe> fetchedRecipes =
//               recipeDataList.map((recipeData) => Recipe.fromJson(recipeData)).toList();

//           return fetchedRecipes;
//         } else {
//           print('Invalid data format: results key not found or not a list');
//           return [];
//         }
//       } else {
//         print('Failed to fetch recipes: ${response.statusCode}');
//         return [];
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       return [];
//     }
//   }
// }

//CORRECT ONE WITHOUT DETAILS
// class RecipeScreen {
//   Future<List<Recipe>> fetchRecipes(String selectedDiet, DateTime selectedDate) async {
//     const String spoonacularAPIKey = '0aef9a341db345a48d23e87a5b903466';
//     String recipesUrl =
//         'https://api.spoonacular.com/recipes/complexSearch?apiKey=$spoonacularAPIKey';

//     // Include selectedDiet and selectedDate in the URL
//     if (selectedDiet.isNotEmpty) {
//       recipesUrl += '&diet=$selectedDiet';
//     }
//     if (selectedDate != null) {
//       // Format the selected date in the required format for the API
//       final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
//       recipesUrl += '&date=$formattedDate';
//     }

//     try {
//       final response = await http.get(Uri.parse(recipesUrl));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         if (jsonData.containsKey('results') && jsonData['results'] is List) {
//           final List<dynamic> recipeDataList = jsonData['results'];

//           final List<Recipe> fetchedRecipes =
//               recipeDataList.map((recipeData) => Recipe.fromJson(recipeData)).toList();

//           fetchedRecipes.shuffle();

//           return fetchedRecipes.take(2).toList();
//         } else {
//           print('Invalid data format: results key not found or not a list');
//           return [];
//         }
//       } else {
//         print('Failed to fetch recipes: ${response.statusCode}');
//         return [];
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       return [];
//     }
//   }
// }

 class RecipeScreen {
  Future<List<Recipe>> fetchRecipes(String selectedDiet, DateTime selectedDate) async {
    const String spoonacularAPIKey = '0aef9a341db345a48d23e87a5b903466';
    String complexSearchUrl = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=$spoonacularAPIKey';
    String randomRecipeUrl = 'https://api.spoonacular.com/recipes/random?apiKey=$spoonacularAPIKey&number=2';

    // Include selectedDiet and selectedDate in the complex search URL
    if (selectedDiet.isNotEmpty) {
      complexSearchUrl += '&diet=$selectedDiet';
    }
    if (selectedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      complexSearchUrl += '&date=$formattedDate';
    }
    complexSearchUrl += '&minCalories=50&maxCalories=1000&number=200'; // Adjust number of recipes fetched

    try {
      // Fetch recipes from the complex search endpoint
      final complexSearchResponse = await http.get(Uri.parse(complexSearchUrl));

      if (complexSearchResponse.statusCode == 200) {
        final complexSearchData = json.decode(complexSearchResponse.body);
        if (complexSearchData.containsKey('results') && complexSearchData['results'] is List) {
          final List<dynamic> recipeDataList = complexSearchData['results'];

          final List<Recipe> fetchedRecipes = [];

          for (var recipeData in recipeDataList) {
            final Recipe recipe = Recipe.fromJson(recipeData);
            

            // Extract servings from the recipe data
            final servings = _extractServings(recipeData);
            recipe.servings = servings ?? 1;

            fetchedRecipes.add(recipe);
          }

          // Shuffle the fetched recipes
          fetchedRecipes.shuffle();

          // Fetch additional details like calories, time, and rating for each recipe from the random recipe endpoint
          final randomRecipeResponse = await http.get(Uri.parse(randomRecipeUrl));
          if (randomRecipeResponse.statusCode == 200) {
            final randomRecipeData = json.decode(randomRecipeResponse.body);
            if (randomRecipeData.containsKey('recipes') && randomRecipeData['recipes'] is List) {
              final List<dynamic> randomRecipeList = randomRecipeData['recipes'];

              for (int i = 0; i < fetchedRecipes.length && i < randomRecipeList.length; i++) {
                final recipeId = randomRecipeList[i]['id'];
                final recipeDetailsResponse = await http.get(Uri.parse(
                    'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$spoonacularAPIKey'));
                if (recipeDetailsResponse.statusCode == 200) {
                  final recipeDetailsData = json.decode(recipeDetailsResponse.body);
                  print('Recipe details data: $recipeDetailsData'); // Add this line for debugging

                  // Extract calories from the 'nutrition' object
                  final calories = _extractCalories(recipeDetailsData);

                  // Apply default values if servings is null in the API response
                  fetchedRecipes[i].servings = fetchedRecipes[i].servings ?? 1;

                  // Assign extracted calories only if available
                  if (calories != null) {
                    fetchedRecipes[i].calories = calories;
                  }

                  fetchedRecipes[i].totalTime = recipeDetailsData['readyInMinutes'].toString();

                  // Calculate the rating based on a 0.0 to 5.0 scale
                  final rawRating = recipeDetailsData['spoonacularScore'] != null
                      ? double.tryParse(recipeDetailsData['spoonacularScore'].toString())
                      : null;
                  if (rawRating != null) {
                    final calculatedRating = ((rawRating / 50.0) * 5.0);
                    fetchedRecipes[i].rating = double.tryParse(calculatedRating.toStringAsFixed(1));
                  }
                } else {
                  print('Failed to fetch details for recipe $recipeId: ${recipeDetailsResponse.statusCode}');
                }
              }
            }
          }

          // Return only the first 2 recipes
          if (fetchedRecipes.length >= 2) {
            return fetchedRecipes.take(2).toList();
          } else {
            print('Insufficient recipes fetched: ${fetchedRecipes.length}');
            return fetchedRecipes;
          }
        } else {
          print('Invalid data format: results key not found or not a list');
          return [];
        }
      } else {
        print('Failed to fetch recipes: ${complexSearchResponse.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }

  int _extractServings(dynamic recipeData) {
  if (recipeData is Map<String, dynamic>) {
    final servings = recipeData['servings'];
    if (servings != null) {
      if (servings is int) {
        return servings;
      } else if (servings is String) {
        // Try parsing the servings as an integer
        try {
          return int.parse(servings);
        } catch (e) {
          print('Error parsing servings: $e');
        }
      }
    }
  }
  // If servings are not available or cannot be parsed, return a default value
  return 1;
}


  int? _extractCalories(Map<String, dynamic> recipeDetailsData) {
    final nutrition = recipeDetailsData['nutrition'] as Map<String, dynamic>?;

    if (nutrition != null) {
      final nutrients = nutrition['nutrients'] as List<dynamic>?;
      if (nutrients != null) {
        for (final nutrient in nutrients) {
          if (nutrient['name'] == 'Calories') {
            return nutrient['amount'].toInt();
          }
        }
      }
    }

    return null;
  }
}

//Check this code tommorow!!!!!!!!!!!!!!!
/*class RecipeScreen {
  Future<List<Recipe>> fetchRecipes(String selectedDiet, DateTime selectedDate) async {
    const String spoonacularAPIKey = '0aef9a341db345a48d23e87a5b903466';
    String complexSearchUrl = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=$spoonacularAPIKey';
    String randomRecipeUrl = 'https://api.spoonacular.com/recipes/random?apiKey=$spoonacularAPIKey&number=2';
    String analyzeRecipeUrl = 'https://api.spoonacular.com/recipes/analyze?apiKey=$spoonacularAPIKey';

    // Include selectedDiet and selectedDate in the complex search URL
    if (selectedDiet.isNotEmpty) {
      complexSearchUrl += '&diet=$selectedDiet';
    }
    if (selectedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      complexSearchUrl += '&date=$formattedDate';
    }
    complexSearchUrl += '&minCalories=50&maxCalories=1000';
    
    try {
      // Fetch recipes from the complex search endpoint
      final complexSearchResponse = await http.get(Uri.parse(complexSearchUrl));

      if (complexSearchResponse.statusCode == 200) {
        final complexSearchData = json.decode(complexSearchResponse.body);
        if (complexSearchData.containsKey('results') && complexSearchData['results'] is List) {
          final List<dynamic> recipeDataList = complexSearchData['results'];

          final List<Recipe> fetchedRecipes =
              recipeDataList.map((recipeData) => Recipe.fromJson(recipeData)).toList();

          // Shuffle the fetched recipes
          fetchedRecipes.shuffle();

          // Fetch additional details like servings, calories, time, and rating for each recipe from the random recipe endpoint
          final randomRecipeResponse = await http.get(Uri.parse(randomRecipeUrl));
          if (randomRecipeResponse.statusCode == 200) {
            final randomRecipeData = json.decode(randomRecipeResponse.body);
            if (randomRecipeData.containsKey('recipes') && randomRecipeData['recipes'] is List) {
              final List<dynamic> randomRecipeList = randomRecipeData['recipes'];

              for (int i = 0; i < fetchedRecipes.length && i < randomRecipeList.length; i++) {
                final recipeDetailsResponse = await http.get(Uri.parse(
                    'https://api.spoonacular.com/recipes/${randomRecipeList[i]['id']}/information?apiKey=$spoonacularAPIKey'));
                if (recipeDetailsResponse.statusCode == 200) {
                  final recipeDetailsData = json.decode(recipeDetailsResponse.body);
                  print('Recipe details data: $recipeDetailsData'); // Add this line for debugging

                  // Extract servings from the 'measures' field
                  final servings = _extractServings(recipeDetailsData);

                  // Extract calories from the 'nutrition' object
                  final calories = _extractCalories(recipeDetailsData);

                  // Apply default values if servings is null in the API response
                  fetchedRecipes[i].servings = servings ?? 1;

                  // Assign extracted calories only if available
                  if (calories != null) {
                    fetchedRecipes[i].calories = calories;
                  }

                  fetchedRecipes[i].totalTime = recipeDetailsData['readyInMinutes'].toString();

                  // Calculate the rating based on a 0.0 to 5.0 scale
                  final rawRating = recipeDetailsData['spoonacularScore'] != null
                      ? double.tryParse(recipeDetailsData['spoonacularScore'].toString())
                      : null;
                  if (rawRating != null) {
                    final calculatedRating = ((rawRating / 5.0) * 5.0);
                    fetchedRecipes[i].rating = double.tryParse(calculatedRating.toStringAsFixed(1));
                  }
                }
              }
            }
          }

          // Fetch servings from the analyze recipe endpoint
          final analyzeRecipeResponse = await http.post(Uri.parse(analyzeRecipeUrl), body: {
            'title': fetchedRecipes.first.title, // Example recipe title
            'ingredients': json.encode(fetchedRecipes.first.ingredients),
          });

          if (analyzeRecipeResponse.statusCode == 200) {
            final analyzedRecipeData = json.decode(analyzeRecipeResponse.body);
            final servingsFromAnalysis = analyzedRecipeData['servings'] as int?;
            if (servingsFromAnalysis != null) {
              fetchedRecipes.first.servings = servingsFromAnalysis;
            } else {
              print('Servings information not found in the analyzed recipe data');
            }
          } else {
            print('Failed to fetch servings information from the analyzed recipe endpoint');
          }

          // Return only the first 2 recipes
          if (fetchedRecipes.length >= 2) {
            return fetchedRecipes.take(2).toList();
          } else {
            print('Insufficient recipes fetched: ${fetchedRecipes.length}');
            return fetchedRecipes;
          }
        } else {
          print('Invalid data format: results key not found or not a list');
          return [];
        }
      } else {
        print('Failed to fetch recipes: ${complexSearchResponse.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      return [];
    }
  }

  // Function to extract servings from the 'measures' field
  int? _extractServings(Map<String, dynamic> recipeDetailsData) {
    final measures = recipeDetailsData['measures'] as Map<String, dynamic>?;

    if (measures != null) {
      final usMeasure = measures['us'] as Map<String, dynamic>?;
      final metricMeasure = measures['metric'] as Map<String, dynamic>?;

      // Check if 'amount' is present under 'us' or 'metric'
      final usAmount = usMeasure != null? usMeasure['amount'] as double? : null;
      final metricAmount = metricMeasure != null ? metricMeasure['amount'] as double? : null;

      // Return the servings value if found, otherwise return null
      return usAmount != null ? usAmount.toInt() : metricAmount?.toInt();
    }

    return null;
  }

  // Function to extract calories from the 'nutrition' object
  int? _extractCalories(Map<String, dynamic> recipeDetailsData) {
    final nutrition = recipeDetailsData['nutrition'] as Map<String, dynamic>?;

    if (nutrition != null) {
      final nutrients = nutrition['nutrients'] as List<dynamic>?;
      if (nutrients != null) {
        for (final nutrient in nutrients) {
          if (nutrient['name'] == 'Calories') {
            return nutrient['amount'].toInt();
          }
        }
      }
    }

    return null;
  }
} */





// class RecipeScreen {
//   Future<List<Recipe>> fetchRecipes(String selectedDiet, DateTime selectedDate) async {
//     const String spoonacularAPIKey = '0aef9a341db345a48d23e87a5b903466';
//     final String randomRecipesUrl = 'https://api.spoonacular.com/recipes/random?apiKey=$spoonacularAPIKey';

//     try {
//       final response = await http.get(Uri.parse(randomRecipesUrl));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         if (jsonData.containsKey('recipes') && jsonData['recipes'] is List) {
//           final List<dynamic> recipeDataList = jsonData['recipes'];

//           final List<Recipe> fetchedRecipes =
//               recipeDataList.map((recipeData) => Recipe.fromJson(recipeData)).toList();

//           return fetchedRecipes;
//         } else {
//           print('Invalid data format: recipes key not found or not a list');
//           return [];
//         }
//       } else {
//         print('Failed to fetch recipes: ${response.statusCode}');
//         return [];
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       return [];
//     }
//   }
// }




// class RecipeScreen {
//   Future<List<Recipe>> fetchRecipes(String selectedDiet, DateTime selectedDate) async {
//     const String spoonacularAPIKey = '0aef9a341db345a48d23e87a5b903466';
//     final String randomRecipesUrl = 'https://api.spoonacular.com/recipes/random?apiKey=$spoonacularAPIKey&number=5';

//     try {
//       // Add selected diet as a tag in the API request
//       final String urlWithTags = '$randomRecipesUrl&includeTags=$selectedDiet';

//       final response = await http.get(Uri.parse(urlWithTags));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         if (jsonData.containsKey('recipes') && jsonData['recipes'] is List) {
//           final List<dynamic> recipeDataList = jsonData['recipes'];

//           final List<Recipe> fetchedRecipes =
//               recipeDataList.map((recipeData) => Recipe.fromJson(recipeData)).toList();

//           // Ensure exactly two recipes are returned
//           if (fetchedRecipes.length >= 2) {
//             return fetchedRecipes.sublist(0, 2);
//           } else {
//             print('Insufficient recipes fetched: ${fetchedRecipes.length}');
//             return [];
//           }
//         } else {
//           print('Invalid data format: recipes key not found or not a list');
//           return [];
//         }
//       } else {
//         print('Failed to fetch recipes: ${response.statusCode}');
//         return [];
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//       return [];
//     }
//   }
//   }








// void main() {
//   runApp(MaterialApp(
//     home: RecipeScreen(),
//   ));
// }


// void main() {
//   runApp(MaterialApp(
//     home: RecipeAPI(),
//   ));}