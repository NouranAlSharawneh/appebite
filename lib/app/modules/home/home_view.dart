import 'package:appebite/app/components/create_recipe_button.dart';
import 'package:appebite/app/components/ingredients_text_field.dart';
import 'package:appebite/app/components/item_ingredient.dart';
import 'package:appebite/app/modules/home/home_controller.dart';
import 'package:appebite/config/images.dart';
import 'package:appebite/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Putting the controller object
    final logic = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.lightBlack,
        floatingActionButton: Visibility(
          // Visibility widget is used to hide the floating button when the keyboard is opened
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Obx(() => logic.ingredients.isNotEmpty // If the ingredients list is empty, we will hide the button
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: logic.clearIngredients,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColors.darkGray2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Icon(Icons.undo),
                      ),
                      const SizedBox(width: 10),
                      CreateRecipeButton(
                        onCreateRecipeTap: logic.createRecipe,
                      ),
                    ],
                  ),
                )
              : const SizedBox()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  // Setting logo
                  Images.logo,
                  scale: 0.65,
                  height: 300,
                ),
                Transform(
                  // Using transform to remove extra margin above this heading
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  child: Text(
                    "Appy is happy to serve!",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                IngredientsTextField(
                  onAddIngredientTap: logic.addIngredient,
                  ingredientTextController: logic.ingredientTextController,
                  onTextFieldSubmit: logic.addIngredientOnSubmit,
                ),
                const SizedBox(height: 20),
                Obx(() => Wrap(
                      // Obx will automatically wrap widget when we add new ingredients to the list
                      alignment: WrapAlignment.center,
                      runSpacing: 15,
                      spacing: 15,
                      children: List.generate(
                        logic.ingredients.length,
                        (index) => ItemIngredient(
                          text: logic.ingredients[index],
                          onRemoveIngredientTap: () {
                            logic.removeIngredient(index);
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
