import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appebite/pages/uploadRecipe/upload_recipe_page_2.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.foodName,
    required this.description,
    required this.servings,
    required this.calories,
    required this.cookingDuration,
    required this.selectedImage, 
  }) : super(key: key);

  final double fem;
  final double ffem;
  final String foodName;
  final String description;
  final String servings;
  final String calories;
  final double cookingDuration;
  final File? selectedImage; 
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              child: UploadRecipePage2(
              foodName: foodName,
              description: description,
              servings: servings,
              calories: calories,
              cookingDuration: cookingDuration,
              selectedImage: selectedImage,
            ),
            ),
          ),
        );
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: 327 * fem,
        height: 56 * fem,
        decoration: BoxDecoration(
          color: const Color(0xffff7269),
          borderRadius: BorderRadius.circular(32 * fem),
        ),
        child: Center(
          child: Text(
            'Next',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15 * ffem,
              fontWeight: FontWeight.w700,
              color: const Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}
