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
      margin: EdgeInsets.fromLTRB(0*fem, 100, 13.5*fem, 23*fem),
      width: 313*fem,
      height: 75*fem,
      // for the title of the page
      child: Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 122*fem, 0*fem),
      width: 191*fem,
      height: double.infinity,
      child: SizedBox(
        width: double.infinity,
        height: 68*fem,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
      child: Text(
        'Create an account',
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
        maxWidth: 190*fem,
      ),
      child: Text(
        'Let’s help you set up your account, it won’t take long.',
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
    ),
    );
  }
}