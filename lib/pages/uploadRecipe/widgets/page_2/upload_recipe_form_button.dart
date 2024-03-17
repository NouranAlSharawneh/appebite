import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadFormButtons extends StatelessWidget {
  const UploadFormButtons({
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
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 21 * fem),
      width: double.infinity,
      height: 56 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 15 * fem, 0 * fem),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: SizedBox(
                width: 156 * fem,
                height: double.infinity,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff353842),
                    borderRadius: BorderRadius.circular(32 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Back',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2 * ffem / fem,
                        color: const Color(0xff686e81),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Access the values here as needed
              print('Food Name: $foodName');
              print('Description: $description');
              print('Servings: $servings');
              print('Calories: $calories');
              print('Cooking Duration: $cookingDuration');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Container(
              width: 156 * fem,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffff7269),
                borderRadius: BorderRadius.circular(32 * fem),
              ),
              child: Center(
                child: Text(
                  'Upload',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2125 * ffem / fem,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}