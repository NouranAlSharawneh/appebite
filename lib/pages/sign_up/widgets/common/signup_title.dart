import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30*fem),
      width: double.infinity,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Text(
      'Create an account',
      style: GoogleFonts.poppins(
      fontSize: 25*ffem,
      fontWeight: FontWeight.w600,
      height: 1.5*ffem/fem,
      color: const Color(0xffffffff),
      ),
    ), Text(
      'Let’s help you set up your \naccount, it won’t take long.',
      style: GoogleFonts.poppins(
        fontSize: 13*ffem,
        fontWeight: FontWeight.w400,
        height: 1.5*ffem/fem,
        color: const Color(0xffffffff),
      ),
      ),
        ],
      ),
    );
  }
}