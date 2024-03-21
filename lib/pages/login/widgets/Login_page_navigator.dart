import 'package:appebite/pages/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 24.5, 100), 
      child: Transform.translate(
        offset: const Offset(0, -20), 
        child: TextButton(
          onPressed: () {
            Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FadeTransition(
                opacity: animation,
                child: const SignUpPage(),
              ),
            ),
          );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color:const Color(0xff000000),
            ),
            children: [
              TextSpan(
                text: 'Don\'t have an account?',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: const Color(0xff686f82),
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: 'Sign up',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: const Color(0xffe7965b),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
