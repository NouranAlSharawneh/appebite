import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MOCalories extends StatelessWidget {
  const MOCalories({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(45.5*fem, 0*fem, 59.5*fem, 120*fem),
      width: double.infinity,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(8*fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 13*fem),
            width: double.infinity,
            height: 78*fem,
            decoration: BoxDecoration (
              color: const Color(0xff252830),
              borderRadius: BorderRadius.circular(8*fem),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 20*ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.5*ffem/fem,
                    color: const Color(0xffffffff),
                  ),
                  children: [
                    TextSpan(
                      text: '60,000',
                      style: GoogleFonts.poppins(
                        fontSize: 25*ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: 'calories',
                      style: GoogleFonts.poppins(
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints (
              maxWidth: 170*fem,
            ),
            child: Text(
              'note: you can edit your goal based on your desire',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 11*ffem,
                fontWeight: FontWeight.w300,
                height: 1.0*ffem/fem,
                letterSpacing: 0.5*fem,
                color: const Color(0xff686f82),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
