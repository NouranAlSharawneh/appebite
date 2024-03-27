import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appebite/pages/uploadRecipe/widgets/title_heading.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_steps.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_rating.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/add_ingredient_field.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_divider.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_categories.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_form_button.dart';

class UploadRecipePage2 extends StatefulWidget {
  final String foodName;
  final String description;
  final String servings;
  final String calories;
  final double cookingDuration;
  final File? selectedImage;

  const UploadRecipePage2({
    Key? key,
    required this.foodName,
    required this.description,
    required this.servings,
    required this.calories,
    required this.cookingDuration,
    required this.selectedImage,
  }) : super(key: key);

  @override
  State<UploadRecipePage2> createState() => _UploadRecipePage2State();
}

class _UploadRecipePage2State extends State<UploadRecipePage2> {
  double ratingValue = 2.5;
  String selectedMeal = 'Breakfast';
  TextEditingController cuisineTypeController = TextEditingController();
  List<AddIngredientPage> ingredientFields = [];
  List<TextEditingController> ingredientControllers = [];
  List<TextEditingController> stepsControllers = [TextEditingController()];
  List<int> stepNumbers = [1];

  // Function to add a new step field
  void _addStep() {
    setState(() {
      int newStep = stepNumbers.length + 1;
      stepNumbers.add(newStep);
      stepsControllers.add(TextEditingController());
    });
  }

  // Function to delete a step field
  void _deleteStep(int index) {
    setState(() {
      stepNumbers.removeAt(index);
      stepsControllers.removeAt(index);
    });
    ingredientFields.removeAt(index);
  }

  @override
  void initState() {
    super.initState();
    // Add two initial TextFields
    addIngredientField();
    addIngredientField();
  }

  void addIngredientField() {
    TextEditingController controller = TextEditingController(); 
    ingredientControllers.add(controller);
    setState(() {
      ingredientFields.add(
        AddIngredientPage(controller: controller), 
      );
    });
  }

  // Function to update the rating value
  void updateRating(double newRating) {
    setState(() {
      ratingValue = newRating;
    });
  }

   // Function to update the rating value
  void updateMeal(String value) {
    setState(() {
      selectedMeal = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 36 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff272a32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleHeading(fem: fem, ffem: ffem, dynamicValue: '2'),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10*fem),
                                child: Text(
                                  'Ingredients',
                                  style: GoogleFonts.poppins(
                                    fontSize: 17 * ffem,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: addIngredientField,
                                child: SizedBox(
                                  width: 24 * fem,
                                  height: 24 * fem,
                                  child: Icon(
                                    Icons.add,
                                    size: 24 * fem,
                                    color: const Color(0xffff7269),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...ingredientFields,
                      ],
                    ),
                  ),
                  UploadRecipeCategories(
                    fem: fem, 
                    ffem: ffem,
                    cuisineTypeController: cuisineTypeController,
                    category: updateMeal,
                    ),
                  const UploadRecipeDivider(),
                  UploadRecipeRating(
                    fem: fem, 
                    ffem: ffem,
                    onRatingUpdate: updateRating,
                    ),
                  UploadRecipeSteps(
                    fem: fem, 
                    ffem: ffem,
                    stepsControllers: stepsControllers,
                    addStepCallback: _addStep,
                    deleteStepCallback: _deleteStep,
                    ),
                  UploadFormButtons(
                    fem: fem, 
                    ffem: ffem,
                    foodName: widget.foodName,
                    description: widget.description,
                    servings: widget.servings,
                    calories: widget.calories,
                    cookingDuration: widget.cookingDuration,
                    selectedImage: widget.selectedImage,
                    // page two
                    ratingValue: ratingValue,
                    cuisineType: cuisineTypeController.text, 
                    category: selectedMeal,
                    ingredientFields: ingredientFields,
                    stepControllers: stepsControllers,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

