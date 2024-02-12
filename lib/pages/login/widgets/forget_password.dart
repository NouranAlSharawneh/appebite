import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topLeft,
        child: TextButton(
          onPressed: () {},
          child: Text('Forgot Password?',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: const Color(0xffe7965b),
          ),
        ),
      ),
      ),
    );
  }
}