import 'package:appebite/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ItemIngredient extends StatelessWidget {
  // Widget for ingredients list item
  final String text;
  final Function() onRemoveIngredientTap;

  const ItemIngredient({
    super.key,
    required this.text,
    required this.onRemoveIngredientTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ThemeColors.darkGray2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            decoration: BoxDecoration(
              color: ThemeColors.lightBlack2,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 24,
            child: IconButton(
              onPressed: onRemoveIngredientTap,
              icon: const Icon(
                Icons.remove,
                color: ThemeColors.lightRed,
                size: 15,
              ),
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(color: ThemeColors.darkGray),
          ),
        ],
      ),
    );
  }
}
