import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBirthYear extends StatelessWidget {
  const SignUpBirthYear({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(1.5*fem, 0*fem, 84.5*fem, 34*fem),
      width: double.infinity,
      height: 28*fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 63*fem, 3*fem),
            child: Text(
              'Birth year ',
              style: GoogleFonts.poppins(
                fontSize: 11*ffem,
                fontWeight: FontWeight.w400,
                height: 1.5*ffem/fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5*fem, 0*fem, 43*fem, 0*fem),
            height: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xff353841),
              borderRadius: BorderRadius.circular(5*fem),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 5*fem, 0*fem),
                  width: 21*fem,
                  height: 21.21*fem,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
                  width: 0*fem,
                  height: 1*fem,
                  decoration: const BoxDecoration (
                    color: Color(0xff252830),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 6.59*fem, 0*fem, 0*fem),
                  child: Text(
                    '2002',
                    style: GoogleFonts.poppins(
                      fontSize: 11*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: const Color(0xffffffff),
                    ),
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