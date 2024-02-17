import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MOTitle extends StatelessWidget {
  const MOTitle({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(1.5*fem, 0*fem, 15*fem, 35*fem),
      width: double.infinity,
      height: 95*fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 0*fem),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                  child: Text(
                    'Monthly calories goal',
                    style: GoogleFonts.poppins(
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5*ffem/fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints (
                    maxWidth: 222*fem,
                  ),
                  child: Text(
                    'Taking into account your height, weight, age, and gender, our recommendation is that you consume a daily amount of food with your specific calorie target.',
                    style: GoogleFonts.poppins(
                      fontSize: 11*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.4*ffem/fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom (
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              width: 30*fem,
              height: 30*fem,
              child: const Icon(
                Icons.arrow_forward,
                color: Color(0xffff7269),
                size: 29,
              )
            ),
          ),
        ],
      ),
    );
  }
}