import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appebite/app/components/custom_dialog.dart';
import 'package:appebite/app/data/Model/response_model.dart';
import 'package:appebite/app/data/model/recipe.dart';
import 'package:appebite/app/data/repository/repo.dart';
import 'package:appebite/app/modules/recipe_details/recipe_details_view.dart';

class HomeController extends GetxController {
  var ingredients = <String>[].obs; 
  final ingredientTextController = TextEditingController(); 
  final BuildContext context;

  // Add a state variable to control the visibility of the loader
  var isLoading = false.obs;

  HomeController(this.context);

  void addIngredient() {
    var ingredient = ingredientTextController.text.trim();
    if (ingredient.isEmpty) return;
    ingredients.add(ingredient);
    ingredientTextController.text = "";
  }

  void addIngredientOnSubmit(String value) {
    addIngredient();
  }

  void removeIngredient(int index) {
    ingredients.removeAt(index);
  }

  void clearIngredients() {
    ingredients.clear();
  }

  void createRecipe() async {
  try {
    // Show loader overlay when API call is initiated
    showLoaderOverlay();

    ResponseModel response = await AiRepository().askAI(ingredients.toString());
    var recipe = Recipe.fromJson(json.decode(response.resultJson));

    // Hide loader overlay when API call is completed
    Navigator.of(context).pop(); // Dismiss the loader overlay

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipeDetailsView(recipe: recipe,)));
  } catch (e) {
    print(e);
    showErrorToast(message: "Error occurred while fetching recipe details.");
    Navigator.of(context).pop(); // Ensure loader overlay is dismissed in case of error
  }
}

  void showErrorToast({String? title, required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.redAccent,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      message: message,
    );
  }

  // Method to show the loader overlay
  void showLoaderOverlay() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Color(0xff272a32),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text("Appy is thinking...", style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),
            ],
          ),
        );
      },
    );
  }
}
