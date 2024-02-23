import 'package:appebite/pages/uploadRecipe/upload_recipe_page_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return TextButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UploadRecipePage2()), 
                      );
              },
              style: TextButton.styleFrom (
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 327*fem,
                height: 56*fem,
                decoration: BoxDecoration (
                  color: const Color(0xffff7269),
                  borderRadius: BorderRadius.circular(32*fem),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15*ffem,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            );
  }
}