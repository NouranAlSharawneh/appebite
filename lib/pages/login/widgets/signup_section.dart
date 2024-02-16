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
              MaterialPageRoute(builder: (context) => SignUpPage()), 
            );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: Color(0xff686F82), 
                  ),
                ),
                TextSpan(
                  text: ' Sign up',
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
