import 'package:appebite/config/theme/theme_colors.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class IngredientsTextField extends StatelessWidget {
  // Custom textfield for ingredients input
  final Function() onAddIngredientTap;
  final Function(String) onTextFieldSubmit;
  final TextEditingController ingredientTextController;

  const IngredientsTextField({
    super.key,
    required this.onAddIngredientTap,
    required this.ingredientTextController,
    required this.onTextFieldSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(
        lightSource: LightSource.bottom,
        depth: -3,
        shadowLightColorEmboss: Colors.black,
        color: ThemeColors.darkGray2,
      ),
      child: TextField(
        controller: ingredientTextController,
        onSubmitted: onTextFieldSubmit,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: ThemeColors.lightBlack2,
          focusColor: ThemeColors.lightBlack2,
          hintStyle: const TextStyle(color: ThemeColors.darkGray),
          hintText: "Enter ingredients",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(3),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ThemeColors.lightRed,
            ),
            child: IconButton(
              onPressed: onAddIngredientTap,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        cursorColor: ThemeColors.gray,
      ),
    );
  }
}
