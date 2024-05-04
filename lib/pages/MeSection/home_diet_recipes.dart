import 'package:appebite/recipe_info.dart';
import 'package:flutter/material.dart';
import 'package:appebite/pages/DietaryPlan/recipe_card.dart';
import 'package:appebite/pages/DietaryPlan/recipe.dart';
import 'package:appebite/module/recipe.api.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:appebite/pages/DietaryPlan/diets_plans.dart';




class RecipeHomePage extends StatefulWidget {
  final String selectedDiet;
  final DateTime? selectedDate;

  const RecipeHomePage({Key? key, required this.selectedDiet, required this.selectedDate});

  @override
  _RecipeHomePageState createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  List<Recipe> _recipes = [];
  bool _isLoading = false;
  late DateTime _selectedDate;
  bool _recipesFetched = false; // Track whether recipes have been fetched
  String _previousSelectedDiet = ''; // Track previously selected diet
  DateTime? _previousSelectedDate; // Track previously selected date

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  void didUpdateWidget(covariant RecipeHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if both selectedDiet and selectedDate are provided and recipes haven't been fetched yet
    if (widget.selectedDiet.isNotEmpty &&
        widget.selectedDate != null &&
        (_previousSelectedDiet != widget.selectedDiet || _previousSelectedDate != widget.selectedDate || !_recipesFetched)) {
      getRecipes();
    }
  }

  Future<void> getRecipes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final recipeApi = RecipeScreen();
      final List<Recipe> fetchedRecipes = await recipeApi.fetchRecipes(widget.selectedDiet, _selectedDate);
      setState(() {
        _recipes = fetchedRecipes;
        _isLoading = false;
        _recipesFetched = true; // Update _recipesFetched to true after fetching recipes
        _previousSelectedDiet = widget.selectedDiet; // Update previous selected diet
        _previousSelectedDate = widget.selectedDate; // Update previous selected date
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: const Color(0xff272a32),
  body: Transform.translate(
    offset: const Offset(0, -50), 
    child: SizedBox(
      // height: 656,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color.fromRGBO(172, 68, 60, 1)))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
  
                  },
                  child: RecipeCard(
                    id: _recipes[index].id.toString(),
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime.toString(),
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].hostedLargeUrl.toString(),
                    calories: _recipes[index].calories.toString(),
                    servings: _recipes[index].servings,
                  ),
                );
              },
            ),
    ),
  ),
);
  }}







