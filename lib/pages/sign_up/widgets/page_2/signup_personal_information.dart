import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPersonalInformation extends StatelessWidget {
  const SignUpPersonalInformation({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(36 * fem, 0 * fem, 0 * fem, 8 * fem),
      child: Text(
        'Personal information ',
        style: GoogleFonts.poppins(
          fontSize: 14*ffem,
          fontWeight: FontWeight.w400,
          height: 1.5*ffem/fem,
          color: const Color(0xffffffff),
        ),
      ),
    );
  }
}

