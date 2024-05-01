import 'package:appebite/RecipeInfo.dart';
import 'package:appebite/Widgets/nav_bar.dart';
import 'package:appebite/home_main.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:atlas_icons/atlas_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class filteredrecipes extends StatefulWidget {
  final String inputValue;
    final String cuisine;
      final String mealType;
      final String sortType;
      final String sortDirection;
      final String allAdIngredients;
      final String  allExIngredients;
      final String dietType;
  filteredrecipes({
    Key? key,
    required this.inputValue,
    required this.cuisine,
    required this.mealType,
    required this.sortType,
    required this.sortDirection,
required this.allAdIngredients,
required this.allExIngredients,
required this.dietType,
  }) : super(key: key){
     print('In filteredrecipes - Sort Type: $sortType, Sort Direction: $sortDirection');
  }

  @override
  State<filteredrecipes> createState() => _filteredrecipesState();
}

class _filteredrecipesState extends State<filteredrecipes> {
  List<Map<String, dynamic>> _breakfastRecipes = [];
  Future<void>? _fetchDataFuture;
  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchBreakfastRecipes(widget.inputValue, widget.cuisine, widget.mealType, widget.sortType, widget.sortDirection, widget.allAdIngredients, widget.allExIngredients, widget.dietType);
  }
  Future<void> fetchBreakfastRecipes(String inputValue, String cuisine, String mealType, String sortType, String sortDirection, String allAdIngredients, String  allExIngredients, String dietType) async {
    final String apiKey ='25e156a57e0b43be98220d6f32fd8ff4'; 
    final String apiUrl =
    'https://api.spoonacular.com/recipes/complexSearch?query=$inputValue&type=$mealType&cuisine=$cuisine&sort=$sortType&sortDirection=$sortDirection&includeIngredients=$allAdIngredients&excludeIngredients=$allExIngredients&diet=$dietType&number=4&apiKey=$apiKey';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Map<String, dynamic>> recipes = jsonData['results'].cast<Map<String, dynamic>>();
        print('API URL: $apiUrl');
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
              recipe['id'].toString()); 
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
        throw Exception('Failed to load $inputValue recipes');
      }
    } catch (error) {
      print('Error fetching $inputValue recipes: $error');
    }
  }

  Future<double> fetchRecipeRating(String recipeId) async {
    final String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final double rating = responseData['spoonacularScore'] ?? 0.0;
      print('Rating for recipe $recipeId: $rating');
      return rating;
    } else {
      print('Failed to fetch rating for recipe $recipeId');
      return 0.0;
    }
  }

  Future<int> fetchRecipeServings(String recipeId) async {
    final String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
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

  Future<int> fetchRecipeCalories(String recipeId) async {
    final String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/nutritionWidget.json?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int calories = int.parse(responseData['calories'].toString());
      print('Calories for recipe $recipeId: $calories');
      return calories;
    } else {
      print('Failed to fetch calories for recipe $recipeId');
      return 0;
    }
  }

  Future<int> fetchRecipePrepTime(String recipeId) async {
    final String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; // Replace with your Spoonacular API key
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final int prepTime = responseData['readyInMinutes'] ?? 0;
      print('Prep time for recipe $recipeId: $prepTime');
      return prepTime;
    } else {
      print('Failed to fetch prep time for recipe $recipeId');
      return 0;
    }
  }

  Future<List<dynamic>> fetchRecipeIngredients(String recipeId) async {
    final String apiKey =
        '25e156a57e0b43be98220d6f32fd8ff4'; 
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/ingredientWidget.json?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      List<Map<String, dynamic>> ingredients = List<Map<String, dynamic>>.from(
          responseData['ingredients'] as Iterable<dynamic>);

      final ingredientNames =
          ingredients.map((ingredient) => ingredient['name']).toSet();
      ingredients.retainWhere(
          (ingredient) => ingredientNames.remove(ingredient['name']));

      print('Ingredients for recipe $recipeId: $ingredients');
      return ingredients;
    } else {
      print('Failed to fetch ingredients for recipe $recipeId');
      return [];
    }
  }

  Future<List<String>> fetchRecipeInstructions(String recipeId) async {
    final String apiKey ='25e156a57e0b43be98220d6f32fd8ff4'; 
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
              _splitSteps(step); 
          instructions.addAll(separatedSteps);
        });
        instructions = instructions.where((step) => step.trim().isNotEmpty).toList();
        print('Instructions for recipe $recipeId: $instructions');
        return instructions;
      } else {
        print('No instructions found for recipe $recipeId');
        return [];
      }
    } else {
      print('Failed to fetch instructions for recipe $recipeId');
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
              substitutes.addAll(
                  substitutesData.map((substitute) => substitute.toString()));
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

  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchedRecipes = [];
  bool _isLoading = false;
  int selectedTab = 0;
  Widget currentContent = const SizedBox.shrink();
  String? selectedMeal;
  String? selectedCuisine;
  String? selectedDiet;
  int selectedRating = 0;
  List<String> meals = ['Breakfast', 'Lunch', 'Dinner'];
  List<String> cuisine = ['Italian', 'Asian', 'American'];
  List<String> diet = [
    'Gluten Free',
    'Ketogenic',
    'Vegetarian',
    'Vegan',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian'
  ];
  String _sortOrder = '';
  String sortType = '';
  String sortDirection = '';
  String allExIngredients = '';
  String allAdIngredients = '';

  TextEditingController _Addcontroller = TextEditingController();
  TextEditingController _Removedcontroller = TextEditingController();
  List<String> addedingredients = [];
  List<String> Removedingredients = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 60,
              right: 32,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(IconlyLight.arrow_left_2),
                      color: Color(0xffff7269),
                      iconSize: 27,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    HomeMain(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0.0,
                                  end: 500.0,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves
                                        .easeInOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(250, 38, 40, 48),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.72),
                              inset: true,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 6),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                cursorColor: Color(0xffff7269),
                                onSubmitted: (String value) {
                                   String mealType = selectedMeal ?? 'all';
                    String cuisineType = selectedCuisine ?? 'all';
                    String dietType = selectedDiet ?? 'all';
                                  Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => filteredrecipes(
                              inputValue: value,
                              cuisine: cuisineType,
                              mealType: mealType,
                              sortType: sortType,
                              sortDirection: sortDirection,
                              allAdIngredients: allAdIngredients,
                              allExIngredients: allExIngredients,
                              dietType: dietType),
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
                                  curve: Curves
                                      .easeInOut, // Specify the desired easing curve
                                ),
                              ),
                              child: child,
                            );
                          },
                        ));
                                },
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search recipe",
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 104, 111, 130),
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color.fromARGB(255, 104, 111, 130),
                                  ),
                                  suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 13),
                                      child: IconButton(
                                          icon: Icon(IconlyLight.filter),
                                          color: Color(0xffff7269),
                                          onPressed: () {
                                           showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext bc) {
                                return StatefulBuilder(
                                    // added StatefulBuilder to update the state of the widget
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(250, 38, 40, 48),
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 35.0,
                                          bottom: 10,
                                          left: 26,
                                          right: 26),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Expanded(
                                                child: GestureDetector(
                                                  // Wrapped with GestureDetector
                                                  onTap: () {
                                                    setState(() {
                                                      // Update the state of selectedTab
                                                      selectedTab = 0;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: selectedTab == 0
                                                            ? const Color(
                                                                0xffff7269)
                                                            : null,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 13.0,
                                                              bottom: 13),
                                                      child: Center(
                                                        child: Text(
                                                          'Filter',
                                                          style: TextStyle(
                                                            color: selectedTab ==
                                                                    0
                                                                ? const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255)
                                                                : const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    104,
                                                                    111,
                                                                    130),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedTab = 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: selectedTab == 1
                                                            ? const Color(
                                                                0xffff7269)
                                                            : null,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 13.0,
                                                              bottom: 13),
                                                      child: Center(
                                                        child: Text(
                                                          'Sort',
                                                          style: TextStyle(
                                                            color: selectedTab ==
                                                                    1
                                                                ? const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255)
                                                                : const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    104,
                                                                    111,
                                                                    130),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          if (selectedTab == 0)
                                            SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  const Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 3.0),
                                                        child: Text(
                                                          'Categories',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 25,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          8.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: 55,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10), // This adds border radius
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                  ),
                                                                  child: Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      dividerColor:
                                                                          const Color(
                                                                              0xffff7269),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              14.0,
                                                                          right:
                                                                              14,
                                                                          bottom:
                                                                              4),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          iconEnabledColor:
                                                                              const Color(0xffff7269),
                                                                          iconDisabledColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              104,
                                                                              111,
                                                                              130),
                                                                          dropdownColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              53,
                                                                              56,
                                                                              66),
                                                                          menuMaxHeight:
                                                                              170,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              selectedMeal,
                                                                          hint: const Text(
                                                                              "Select Meal",
                                                                              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins')),
                                                                          onChanged:
                                                                              (String? newValue) {
                                                                            setState(() {
                                                                              selectedMeal = newValue;
                                                                            });
                                                                          },
                                                                          items:
                                                                              meals.map<DropdownMenuItem<String>>((String meal) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: meal,
                                                                              child: Text(meal, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Poppins')),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          8.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: 55,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10), // This adds border radius
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                  ),
                                                                  child: Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      dividerColor:
                                                                          const Color(
                                                                              0xffff7269),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              14.0,
                                                                          right:
                                                                              14,
                                                                          bottom:
                                                                              4),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          iconEnabledColor:
                                                                              const Color(0xffff7269),
                                                                          iconDisabledColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              104,
                                                                              111,
                                                                              130),
                                                                          dropdownColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              53,
                                                                              56,
                                                                              66),
                                                                          menuMaxHeight:
                                                                              170,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              selectedCuisine,
                                                                          hint: const Text(
                                                                              "Select Cuisine",
                                                                              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins')),
                                                                          onChanged:
                                                                              (String? newValue) {
                                                                            setState(() {
                                                                              selectedCuisine = newValue;
                                                                            });
                                                                          },
                                                                          items:
                                                                              cuisine.map<DropdownMenuItem<String>>((String cuisine) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: cuisine,
                                                                              child: Text(cuisine, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Poppins')),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      // Rest of your code
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: TextField(
                                                              controller:
                                                                  _Addcontroller,
                                                              onSubmitted:
                                                                  (String
                                                                      value) {
                                                                setState(() {
                                                                  addedingredients
                                                                      .add(
                                                                          value);
                                                                  _Addcontroller
                                                                      .clear();
                                                                  allAdIngredients =
                                                                      addedingredients
                                                                          .join(
                                                                              ', ');
                                                                  print(
                                                                      allAdIngredients);
                                                                });
                                                              },
                                                              cursorColor: Color(
                                                                  0xffff7269),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Include ingredients',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          104,
                                                                          111,
                                                                          130),
                                                                  fontFamily:
                                                                      'Poppins',
                                                                ),
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            17.0,
                                                                        horizontal:
                                                                            15.0),
                                                                isDense: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              color: Color(
                                                                  0xffff7269),
                                                              size: 30,
                                                            ),
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            setState) {
                                                                      return ClipRRect(
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(25.0),
                                                                          topRight:
                                                                              Radius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          // Change bottom sheet background color here
                                                                          color: Color.fromARGB(
                                                                              250,
                                                                              38,
                                                                              40,
                                                                              48),
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              20.0),
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  Text('Included Ingredients:',
                                                                                      style: TextStyle(
                                                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontSize: 20,
                                                                                      )),
                                                                                  IconButton(
                                                                                    icon: Icon(Icons.clear, color: Color.fromARGB(255, 255, 255, 255)),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                      _Addcontroller.clear(); // Clear the text field
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 16,
                                                                              ),
                                                                              if (addedingredients.isEmpty)
                                                                                const Padding(
                                                                                  padding: EdgeInsets.only(top: 2.0),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        'You have not included ingredients yet',
                                                                                        style: TextStyle(
                                                                                          color: Color.fromARGB(255, 104, 111, 130),
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.w400,
                                                                                          fontSize: 18,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(right: 12.0, left: 12),
                                                                                  child: ListView.builder(
                                                                                    itemCount: addedingredients.length,
                                                                                    itemBuilder: (BuildContext context, int index) {
                                                                                      return Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                          color: Color(0xffff7269),
                                                                                        ),
                                                                                        margin: EdgeInsets.only(bottom: 10.0),
                                                                                        child: ListTile(
                                                                                          title: Text(
                                                                                            addedingredients[index],
                                                                                            style: TextStyle(
                                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          trailing: IconButton(
                                                                                            icon: Icon(
                                                                                              Icons.close,
                                                                                              color: Color.fromARGB(250, 38, 40, 48),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                addedingredients.removeAt(index);
                                                                                                allAdIngredients = addedingredients.join(', ');
                                                                                                print(allAdIngredients);
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      // Rest of your code
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: TextField(
                                                              controller:
                                                                  _Removedcontroller,
                                                              onSubmitted:
                                                                  (String
                                                                      value) {
                                                                setState(() {
                                                                  Removedingredients
                                                                      .add(
                                                                          value);
                                                                  _Removedcontroller
                                                                      .clear();
                                                                  allExIngredients =
                                                                      Removedingredients
                                                                          .join(
                                                                              ', ');
                                                                  print(
                                                                      allExIngredients);
                                                                });
                                                              },
                                                              cursorColor: Color(
                                                                  0xffff7269),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Execlude ingredients',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          104,
                                                                          111,
                                                                          130),
                                                                  fontFamily:
                                                                      'Poppins',
                                                                ),
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            17.0,
                                                                        horizontal:
                                                                            15.0),
                                                                isDense: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: const Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              color: Color(
                                                                  0xffff7269),
                                                              size: 30,
                                                            ),
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            setState) {
                                                                      return ClipRRect(
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(25.0),
                                                                          topRight:
                                                                              Radius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          // Change bottom sheet background color here
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              250,
                                                                              38,
                                                                              40,
                                                                              48),
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              20.0),
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  const Text('Execluded Ingredients:',
                                                                                      style: TextStyle(
                                                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontSize: 20,
                                                                                      )),
                                                                                  IconButton(
                                                                                    icon: const Icon(Icons.clear, color: Color.fromARGB(255, 255, 255, 255)),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                      _Removedcontroller.clear(); // Clear the text field
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 16,
                                                                              ),
                                                                              if (Removedingredients.isEmpty)
                                                                                const Padding(
                                                                                  padding: const EdgeInsets.only(top: 2.0),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        'You have not execluded ingredients yet',
                                                                                        style: const TextStyle(
                                                                                          color: Color.fromARGB(255, 104, 111, 130),
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.w400,
                                                                                          fontSize: 18,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(right: 12.0, left: 12),
                                                                                  child: ListView.builder(
                                                                                    itemCount: Removedingredients.length,
                                                                                    itemBuilder: (BuildContext context, int index) {
                                                                                      return Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                          color: Color(0xffff7269),
                                                                                        ),
                                                                                        margin: EdgeInsets.only(bottom: 10.0),
                                                                                        child: ListTile(
                                                                                          title: Text(
                                                                                            Removedingredients[index],
                                                                                            style: const TextStyle(
                                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          trailing: IconButton(
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              color: Color.fromARGB(250, 38, 40, 48),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                Removedingredients.removeAt(index);
                                                                                                allExIngredients = Removedingredients.join(', ');
                                                                                                print(allExIngredients);
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 25,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          8.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: 55,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10), // This adds border radius
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                  ),
                                                                  child: Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      dividerColor:
                                                                          const Color(
                                                                              0xffff7269),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              14.0,
                                                                          right:
                                                                              14,
                                                                          bottom:
                                                                              4),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          iconEnabledColor:
                                                                              const Color(0xffff7269),
                                                                          iconDisabledColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              104,
                                                                              111,
                                                                              130),
                                                                          dropdownColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              53,
                                                                              56,
                                                                              66),
                                                                          menuMaxHeight:
                                                                              170,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              selectedDiet,
                                                                          hint: const Text(
                                                                              "Select Diet",
                                                                              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins')),
                                                                          onChanged:
                                                                              (String? newValue) {
                                                                            setState(() {
                                                                              selectedDiet = newValue;
                                                                            });
                                                                          },
                                                                          items:
                                                                              diet.map<DropdownMenuItem<String>>((String diet) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: diet,
                                                                              child: Text(diet, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Poppins')),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 62,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  Removedingredients
                                                                      .clear();
                                                                  addedingredients
                                                                      .clear();
                                                                  allAdIngredients =
                                                                      '';
                                                                  allExIngredients =
                                                                      '';
                                                                  selectedCuisine =
                                                                      null;
                                                                  selectedDiet =
                                                                      null;
                                                                  selectedMeal =
                                                                      null;
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffff7269),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                child: ListTile(
                                                                    title:
                                                                        const Text(
                                                                      'Reset',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17.5,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    leading:
                                                                        IconButton(
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .refresh,
                                                                          color:
                                                                              Colors.white),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          Removedingredients
                                                                              .clear();
                                                                          addedingredients
                                                                              .clear();
                                                                          allAdIngredients =
                                                                              '';
                                                                          allExIngredients =
                                                                              '';
                                                                          selectedCuisine =
                                                                              null;
                                                                          selectedDiet =
                                                                              null;
                                                                          selectedMeal =
                                                                              null;
                                                                        });
                                                                      },
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                print(
                                                                  'alladdingredients: $allAdIngredients - allremovedingredients: $allExIngredients - selectedMeal: $selectedMeal - ',
                                                                );
                                                                  Navigator.of(context).pop();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffff7269),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                child: ListTile(
                                                                    title:
                                                                        const Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17.5,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    leading:
                                                                        IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.white),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'alladdingredients: $allAdIngredients - allremovedingredients: $allExIngredients');
                                                                              Navigator.of(context).pop();
                                                                      },
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          else
                                            Column(
                                              children: [
                                                const Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 3.0),
                                                      child: Text(
                                                        'Cooking Time',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 18,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder =
                                                              'Longest';
                                                          sortType = 'time';
                                                          sortDirection =
                                                              'desc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Longest to Shortest Time',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'Longest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'time';
                                                                sortDirection =
                                                                    'desc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder =
                                                              'Shortest';
                                                          sortType = 'time';
                                                          sortDirection = 'asc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Shortest to Longest Time',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'Shortest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'time';
                                                                sortDirection =
                                                                    'asc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 16),
                                                    const Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 3.0),
                                                          child: Text(
                                                            'Calories',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder =
                                                              'highest';
                                                          sortType = 'calories';
                                                          sortDirection =
                                                              'desc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Highest to Lowest Calories',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'highest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'calories';
                                                                sortDirection =
                                                                    'desc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder = 'lowest';
                                                          sortType = 'calories';
                                                          sortDirection = 'asc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Lowest to Highest Calories',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'lowest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'calories';
                                                                sortDirection =
                                                                    'asc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder = 'null';
                                                          sortType = 'null';
                                                          sortDirection =
                                                              'null';
                                                        });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffff7269),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child: ListTile(
                                                                  title:
                                                                      const Text(
                                                                    'Reset',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            17.5,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  leading:
                                                                      IconButton(
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .refresh,
                                                                        color: Colors
                                                                            .white),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        _sortOrder =
                                                                            'null';
                                                                        sortType =
                                                                            'null';
                                                                        sortDirection =
                                                                            'null';
                                                                      });
                                                                    },
                                                                  )),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                print(
                                                                    'sortType: $sortType - sortdireaction: $sortDirection');
                                                                      Navigator.of(context).pop();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffff7269),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                child: ListTile(
                                                                    title:
                                                                        const Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17.5,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    leading:
                                                                        IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.white),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'sortType: $sortType - sortdireaction: $sortDirection');
                                                                              Navigator.of(context).pop();
                                                                      },
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                        
                                          })),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: FutureBuilder(
                  future: _fetchDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xffff7269)),
                      ));
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if
                        // Check if the recipes list is empty
                        (_breakfastRecipes.isEmpty) {
                      return const Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Atlas.block_file_thin,
                              color: Color.fromARGB(255, 104, 111, 130),
                              size: 100.0,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Results not found',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(255, 104, 111, 130),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Please try again',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 104, 111, 130),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, top: 100, bottom: 65),
                        child: ListView.builder(
                            itemCount: _breakfastRecipes.length,
                            itemBuilder: (context, index) {
                              final recipe = _breakfastRecipes[index];
                              return RecipeCard(recipe: recipe);
                            }),
                      );
                    }
                  }),
            ),
          ),
          const HomePage(
            index: 0,
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

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
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                recipe['image'] ?? '<https://via.placeholder.com/150>',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 190,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  // If there's an error (e.g., 404 not found), display a local asset
                  return const Image(
                    image: AssetImage(
                        '/Users/swtayx/Desktop/flutter_projects/recipes/assets/notavaliable.png'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 190,
                  );
                },
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
