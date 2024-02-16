import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpNavigator extends StatelessWidget {
  const SignUpNavigator({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14.5*fem, 0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 11*ffem,
              fontWeight: FontWeight.w500,
              height: 1.5*ffem/fem,
              color:const Color(0xff000000),
            ),
            children: [
              TextSpan(
                text: 'Already a member?',
                style: GoogleFonts.poppins(
                  fontSize: 11*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff686f82),
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: 'Login',
                style: GoogleFonts.poppins(
                  fontSize: 11*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xffe7965b),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
