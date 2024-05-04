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
 import 'package:flutter/material.dart';
 //import 'package:iconly/iconly.dart';


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

//  
//
class RecipeScreen {
 
  Future<List<Recipe>> fetchRecipes(String selectedDiet, DateTime selectedDate) async {
  const String spoonacularAPIKey = '25e156a57e0b43be98220d6f32fd8ff4';
  String complexSearchUrl = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=$spoonacularAPIKey';
  
  if (selectedDiet.isNotEmpty) {
    complexSearchUrl += '&diet=$selectedDiet';
  }
  if (selectedDate != null) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    complexSearchUrl += '&date=$formattedDate';
  }
  complexSearchUrl += '&minCalories=50&maxCalories=1000&number=15'; // Adjust number of recipes fetched

  try {
    
    final complexSearchResponse = await http.get(Uri.parse(complexSearchUrl));

    if (complexSearchResponse.statusCode == 200) {
      final complexSearchData = json.decode(complexSearchResponse.body);
      if (complexSearchData.containsKey('results') && complexSearchData['results'] is List) {
        final List<dynamic> recipeDataList = complexSearchData['results'];

        final List<Recipe> fetchedRecipes = [];

        for (var recipeData in recipeDataList) {
          final Recipe recipe = Recipe.fromJson(recipeData);

          
          final calories = _extractCalories(recipeData);
          recipe.calories = calories;

         final sevings = await fetchRecipeServings(recipe.id.toString());
         recipe.servings = sevings;

         final cookingTime = await fetchRecipeCookingTime(recipe.id.toString());
         recipe.totalTime = cookingTime.toString();

          final rating = await fetchRecipeRating(recipe.id.toString());
          recipe.rating = rating;
          print(recipe.name);
          print(recipe.id);
          print(recipe.hostedLargeUrl);
          

          fetchedRecipes.add(recipe);
        }

       
        fetchedRecipes.shuffle();

        
        if (fetchedRecipes.length >= 2) {
         return fetchedRecipes.take(3).toList();
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

int? _extractCalories(Map<String, dynamic> recipeData) {
  final nutrition = recipeData['nutrition'] as Map<String, dynamic>?;

  if (nutrition != null) {
    final nutrients = nutrition['nutrients'] as List<dynamic>?;
    if (nutrients != null) {
      for (final nutrient in nutrients) {
        if (nutrient['name'] == 'Calories') {
          print('Calories for recipe : $nutrition');
          return nutrient['amount'].toInt();
        }
      }
    }
  }

  return null;
}

Future<int> fetchRecipeServings(String recipeId) async {
    const  String apiKey ='25e156a57e0b43be98220d6f32fd8ff4';
    final response = await http.get(Uri.parse(
    'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));
    if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final int servings = responseData['servings'] ?? 0;
        print('Servings for recipe $recipeId: $servings');
        return servings;
    } else {
    print('Failed to fetch servings for recipe $recipeId');
    return 0;
    }
}

Future<int> fetchRecipeCookingTime(String recipeId) async {
    const String apiKey ='25e156a57e0b43be98220d6f32fd8ff4';
    final response = await http.get(Uri.parse(
    'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));
    if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final int CookingTime = responseData['readyInMinutes'] ?? 0;
        print('Cooking time for recipe $recipeId: $CookingTime');
        return CookingTime;
    } else {
    print('Failed to fetch rating for recipe $recipeId');
    return 0;
    }
}

Future<double> fetchRecipeRating(String recipeId) async {
    const String apiKey ='25e156a57e0b43be98220d6f32fd8ff4';
    final response = await http.get(Uri.parse(
    'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));
    if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final double rating = responseData['spoonacularScore'] ?? 0.0;
        final double calculatedRating = (rating / 100.0) * 5.0;
        final double roundedRating = double.parse(calculatedRating.toStringAsFixed(1));
        print('Rating for recipe $recipeId: $roundedRating');
        print("===========\n");
        return roundedRating;
    } else {
    print('Failed to fetch rating for recipe $recipeId');
    return 0.0;
    }
    }
}







// class BreakfastMPage extends StatefulWidget {
// const BreakfastMPage({super.key});

// @override
// State<BreakfastMPage> createState() => _BreakfastMPageState();
// }

// class _BreakfastMPageState extends State<BreakfastMPage> {
// List<Map<String, dynamic>> _breakfastRecipes = [];

// @override
// void initState() {
// super.initState();
// fetchBreakfastRecipes();
// }

//  Future<void> fetchBreakfastRecipes() async {
// final String apiKey ='c0b18277a8d746989922862fe6a6d838'; // Replace with your Spoonacular API key
// final String apiUrl ='https://api.spoonacular.com/recipes/complexSearch?type=breakfast&number=6&offset=11&includeIngredients=eggs&apiKey=$apiKey';

// try {
// final response = await http.get(Uri.parse(apiUrl));
// if (response.statusCode == 200) {
// final jsonData = json.decode(response.body);
// List<Map<String, dynamic>> recipes =
// List<Map<String, dynamic>>.from(jsonData['results'] as Iterable<dynamic>);

// // Fetch and add rating and servings data for each recipe
// for (var recipe in recipes) {
// final double rating = await fetchRecipeRating(recipe['id'].toString());
// final int servings = await fetchRecipeServings(recipe['id'].toString());
// recipe['rating'] = rating;
// recipe['servings'] = servings;
// }

// setState(() {
// _breakfastRecipes = recipes;
// });
// } else {
// throw Exception('Failed to load breakfast recipes');
// }
// } catch (error) {
// print('Error fetching breakfast recipes: $error');
// // Handle error appropriately, e.g., show a snackbar
// }
// }

// Future<double> fetchRecipeRating(String recipeId) async {
// final String apiKey ='c0b18277a8d746989922862fe6a6d838'; // Replace with your Spoonacular API key
// final response = await http.get(Uri.parse('https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));
// if (response.statusCode == 200) {
// final Map<String, dynamic> responseData = json.decode(response.body);
// final double rating = responseData['spoonacularScore'] ?? 0.0;
// print('Rating for recipe $recipeId: $rating');
// return rating;
// } else {
// print('Failed to fetch rating for recipe $recipeId');
// return 0.0;
// }
// }

// Future<int> fetchRecipeServings(String recipeId) async {
// final String apiKey ='c0b18277a8d746989922862fe6a6d838'; // Replace with your Spoonacular API key
// final response = await http.get(Uri.parse('https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

// if (response.statusCode == 200) {
// final Map<String, dynamic> responseData = json.decode(response.body);
// final int servings = responseData['servings'] ?? 0;
// print('Servings for recipe $recipeId: $servings');
// return servings;} else {
// print('Failed to fetch servings for recipe $recipeId');
// return 0;
// }
// }

// @override
// Widget build(BuildContext context) {
// return Container(
// padding: EdgeInsets.only(top: 100, bottom: 100, right: 15, left: 15),
// child: ListView.builder(
// itemCount: _breakfastRecipes.length,
// itemBuilder: (context, index) {
// final recipe = _breakfastRecipes[index];
// //return RecipeCard(recipe: recipe);
// }),
// );
// }
//}

// class RecipeCard extends StatelessWidget {
// final Map<String, dynamic> recipe;

// const RecipeCard({Key? key, required this.recipe}) : super(key: key);

// @override
// Widget build(BuildContext context) {
// final double rating = ((recipe['rating']/100)*5)?? 0.0;
// return Card(
// margin: const EdgeInsets.all(15),
// elevation: 4,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: Stack(
// children: [
// Image.network(
// recipe['image'] ?? 'https://via.placeholder.com/150',
// fit: BoxFit.cover,
// width: double.infinity,
// height: 190,
// ),
// Positioned(
// top: 10,
// right: 10,
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Container(
// height: 20,
// width: 50,
// decoration: BoxDecoration(
// color: Color.fromARGB(255, 255, 225, 179),
// borderRadius: BorderRadius.circular(20),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//   const Icon(
// IconlyBold.star,
// color: Color.fromARGB(255, 255, 173, 48),
// size: 12,
// ),
// SizedBox(width: 4),
// Text(
// '${rating.toStringAsFixed(2)}',
// style: const TextStyle(
// fontFamily: 'Poppins',
// color: Color.fromARGB(255, 0, 0, 0),
// fontWeight: FontWeight.w400,
// fontSize: 10,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Positioned.fill(
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// gradient: LinearGradient(
// begin: Alignment.bottomCenter,
// end: Alignment.topCenter,
// colors: [
// const Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
// Color.fromARGB(0, 0, 0, 0),
// ],
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Padding(
// padding:
// const EdgeInsets.only(left: 10, bottom: 3, right: 10),
// child: Text(
// recipe['title'] ?? 'Untitled Recipe',
// style: const TextStyle(
// fontFamily: 'Poppins',
// color: Colors.white,
// fontSize: 15,
// fontWeight: FontWeight.w600,
// ),
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Container(
// padding: const EdgeInsets.only(right: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// const Icon(
// Icons.people_alt_outlined,
// color: Color.fromARGB(255, 231, 149, 91),
// size: 19,
// ),
// const SizedBox(width: 4),
// Text(
// '${recipe['servings'] ?? 'N/A'} serve',
// style: const TextStyle(
// fontFamily: 'Poppins',
// color: Colors.white,
// fontSize: 13,
// fontWeight: FontWeight.w400,
// ),
// ),
// const SizedBox(width: 13),
// const Icon(
// Iconsax.timer_1_copy,
// color: Color.fromARGB(255, 231, 149, 91),
// size: 18,
// ),
// const SizedBox(width: 4),
// Text(
// '${recipe['readyInMinutes'] ?? 'N/A'} min',
// style: const TextStyle(
// fontFamily: 'Poppins',
// color: Colors.white,
// fontSize: 13,
// fontWeight: FontWeight.w400,
// ),
// ),
// const SizedBox(width: 13),
// const Icon(
// AkarIcons.fire,
// color: Color.fromARGB(255, 231, 149, 91),
// size: 18,
// ),
// const SizedBox(width: 4),
// Text('${recipe['maxCalories'] ?? 'N/A'} kcal',
// style: const TextStyle(
// fontFamily: 'Poppins',
// color: Colors.white,
// fontSize: 13,
// fontWeight: FontWeight.w400,
// ),
// ),
// ],
// ),
// ),
// const SizedBox(height: 10),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// );
// }
// }
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