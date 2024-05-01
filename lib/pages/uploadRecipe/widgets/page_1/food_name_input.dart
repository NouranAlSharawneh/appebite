import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodInput extends StatelessWidget {
  const FoodInput({
    super.key,
    required this.fem,
    required this.ffem,
    required this.foodNameController,
  });

  final double fem;
  final double ffem;
  final TextEditingController foodNameController;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10*fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6*fem),
                  child: Text(
                    'Food Name',
                    style: GoogleFonts.poppins(
                      fontSize: 17*ffem,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                TextField(
                  controller: foodNameController,
                  style: GoogleFonts.poppins(
                    fontSize: 13 * ffem,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffffffff),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 24 *fem, vertical: 20),
                    hintText: 'Enter food name',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff686e81),
                    ),
                    filled: true,
                    fillColor: const Color(0xff353841),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13 * fem),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )
              ],
            ),
          );
        }
}
