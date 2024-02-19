import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHeading extends StatelessWidget {
  const TitleHeading({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.dynamicValue,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final String dynamicValue; // Add this parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 30 * fem, 0 * fem, 0 * fem),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 240 * fem, 0 * fem),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: 17 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 2 * ffem / fem,
                  letterSpacing: 0.5 * fem,
                  color: const Color(0xffff6363),
                ),
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 17 * ffem,
                fontWeight: FontWeight.w700,
                height: 2 * ffem / fem,
                letterSpacing: 0.5 * fem,
                color: const Color(0xff3d5480),
              ),
              children: [
                TextSpan(
                  text: '$dynamicValue/', // Use the dynamic value here
                  style: GoogleFonts.poppins(
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 2 * ffem / fem,
                    letterSpacing: 0.5 * fem,
                    color: const Color(0xff686e81),
                  ),
                ),
                TextSpan(
                  text: '2',
                  style: GoogleFonts.poppins(
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.5 * ffem / fem,
                    letterSpacing: 0.5 * fem,
                    color: const Color(0xffd9d9d9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
