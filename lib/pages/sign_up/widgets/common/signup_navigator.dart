import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appebite/pages/login/login_screen.dart';

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
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              child: const LoginPage(),
            ),
          ),
        );
      },
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
                fontSize: 13*ffem,
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
                fontSize: 13*ffem,
                fontWeight: FontWeight.w500,
                height: 1.5*ffem/fem,
                color: const Color(0xffe7965b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
