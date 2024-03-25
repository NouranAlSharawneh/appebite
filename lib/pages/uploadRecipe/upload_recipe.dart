import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/add_image.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/continue_button.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/cooking_duration.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/description_input.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/food_name_input.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/servings_and_calories_input.dart';
import 'package:appebite/pages/uploadRecipe/widgets/title_heading.dart';

class UploadRecipe extends StatefulWidget {
  const UploadRecipe({Key? key}) : super(key: key);

  @override
  State<UploadRecipe> createState() => _UploadRecipeState();
}

class _UploadRecipeState extends State<UploadRecipe> {
  TextEditingController foodNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController servingsController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  double cookingDuration = 30; // Default value for cooking duration
  File? selectedImage;

  @override
  void dispose() {
    // Dispose controllers when not needed anymore
    foodNameController.dispose();
    descriptionController.dispose();
    servingsController.dispose();
    caloriesController.dispose();
    super.dispose();
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
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitleHeading(fem: fem, ffem: ffem, dynamicValue: '1'),
                    AddImage(
                      fem: fem,
                      ffem: ffem,
                      onImageSelected: (File? image) {
                        setState(() {
                          selectedImage = image;
                        });
                      },
                    ),
                    FoodInput(fem: fem, ffem: ffem, foodNameController: foodNameController),
                    DescriptionInput(fem: fem, ffem: ffem, descriptionController: descriptionController),
                    CookingDuration(
                      fem: fem,
                      ffem: ffem,
                      value: cookingDuration,
                      onChanged: (value) {
                        setState(() {
                          cookingDuration = value;
                        });
                      },
                    ),
                    ServingsAndCaloriesInput(
                      text1: 'Serving',
                      text2: 'Calorie',
                      servingsController: servingsController,
                      caloriesController: caloriesController,
                    ),
                    ContinueButton(
                      fem: fem,
                      ffem: ffem,
                      foodName: foodNameController.text,
                      description: descriptionController.text,
                      servings: servingsController.text,
                      calories: caloriesController.text,
                      cookingDuration: cookingDuration,
                      selectedImage: selectedImage,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
