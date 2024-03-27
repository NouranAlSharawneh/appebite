import 'package:appebite/app/modules/recipe_details/recipe_details_controller.dart';
import 'package:appebite/config/images.dart';
import 'package:appebite/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(RecipeDetailsController()); // Putting recipe details controller's object
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ThemeColors.lightRed,
            ),
          ),
        ),
        backgroundColor: ThemeColors.lightBlack,
        body: Card(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          color: ThemeColors.darkGray2.withOpacity(0.2),
          surfaceTintColor: ThemeColors.darkGray2.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    Images.logo,
                    opacity: const AlwaysStoppedAnimation(.2),
                    height: 1000,
                    scale: 0.1,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      logic.recipe.name, // Setting the recipe name from the object initialised in the controller
                      style: const TextStyle(
                        color: ThemeColors.lightRed,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Instructions",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              logic.recipe
                                  .recipe, // Setting the recipe text from the object initialised in the controller
                              style: const TextStyle(color: Colors.white, height: 1.8),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 20),
                            const Text(
                              "Enjoy your meal!",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
