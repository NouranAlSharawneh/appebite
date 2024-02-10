import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 24.5, 142),
      child: TextButton(
        onPressed: () {
          // Implement your sign-up logic here
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          'Don’t have an account? Sign up',
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: const Color(0xffe7965b),
          ),
        ),
      ),
    );
  }
}