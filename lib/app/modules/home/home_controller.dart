import 'dart:convert';

import 'package:appebite/app/components/custom_dialog.dart';
import 'package:appebite/app/data/Model/response_model.dart';
import 'package:appebite/app/data/model/recipe.dart';
import 'package:appebite/app/data/repository/repo.dart';
import 'package:appebite/app/modules/recipe_details/recipe_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var ingredients = <String>[].obs; // This list will hold all the ingredients
  final ingredientTextController = TextEditingController(); // This controller will be used for textfield

  void addIngredient() {
    // This method will be used when clicking on arrow in the textfield
    // it will add the ingredient from the textfield the list, if it is not empty
    var ingredient = ingredientTextController.text.trim();
    if (ingredient.isEmpty) return;
    ingredients.add(ingredient);
    ingredientTextController.text = "";
  }

  void addIngredientOnSubmit(String value) {
    // this method will be called when pressing the enter key on keyboard
    addIngredient();
  }

  void removeIngredient(int index) {
    // this method will remove ingredients from the list
    ingredients.removeAt(index);
  }

  void clearIngredients() {
    // this method will remove all ingredients from the list
    ingredients.clear();
  }

  void createRecipe() async {
    // this method will perform the api call, get the returned data and  convert it to recipe model object
    CustomDialog.showProgressDialog();
    try {
      ResponseModel response = await AiRepository().askAI(ingredients.toString());
      var recipe = Recipe.fromJson(json.decode(response.resultJson));

      // if no error is thrown, we will close the progress dialog and navigate to next screen
      CustomDialog.closeProgressDialog();
      Get.to(() => const RecipeDetailsView(), arguments: {'recipe': recipe});
    } catch (e) {
      // if any error is thrown, we will close the progress dialog and show an error toast
      CustomDialog.closeProgressDialog();
      showErrorToast(message: "An error has occurred!");
    }
  }

  // This method will be used to show error toast if any error occurs
  void showErrorToast({String? title, required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      title: title,
      duration: duration ?? const Duration(seconds: 3),
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: color ?? Colors.redAccent,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      //overlayBlur: 0.8,
      message: message,
    );
  }
}
