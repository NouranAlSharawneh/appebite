import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodInput extends StatelessWidget {
  const FoodInput({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
            child: Text(
              'Food Name',
              style: GoogleFonts.poppins(
                fontSize: 17*ffem,
                fontWeight: FontWeight.w700,
                height: 1.5882352941*ffem/fem,
                letterSpacing: 0.5*fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          TextField(
            style: GoogleFonts.poppins(
              fontSize: 15 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.5 * ffem / fem,
              letterSpacing: 1 * fem,
              color: const Color(0xff686e81),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(24 * fem, 19 * fem, 24 * fem, 18 * fem),
              hintText: 'Enter food name',
              hintStyle: GoogleFonts.poppins(
                fontSize: 15 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2125 * ffem / fem,
                color: const Color(0xff686e81),
              ),
              filled: true,
              fillColor: const Color(0xff353841),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32 * fem),
                borderSide: BorderSide.none,
              ),
            ),
          )

        ],
      ),
    );
  }
}
