import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 5.5*fem, 16*fem),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
            child: Text(
              'Description',
              style: GoogleFonts.poppins(
                fontSize: 17*ffem,
                fontWeight: FontWeight.w700,
                height: 1.5*ffem/fem,
                letterSpacing: 0.5*fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 80 * fem,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 * fem),
                color: const Color(0xff353842),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16 * fem, 3 * fem, 16 * fem, 0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    fontSize: 12 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1 * ffem / fem,
                    letterSpacing: 0.5 * fem,
                    color: const Color(0xff686f82),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Tell a little about your food',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2125 * ffem / fem,
                      letterSpacing: 0.5 * fem,
                      color: const Color(0xff686f82),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}