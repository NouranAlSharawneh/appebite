import 'package:appebite/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CreateRecipeButton extends StatelessWidget {
  // Custom button for create recipe
  final Function() onCreateRecipeTap;

  const CreateRecipeButton({
    super.key,
    required this.onCreateRecipeTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onCreateRecipeTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.lightRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      ),
      child: const Text(
        "Create a recipe!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
