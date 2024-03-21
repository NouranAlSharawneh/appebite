import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(
        0,
        0,
        0,
        screenHeight * 0.05, 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello,',
            style: GoogleFonts.poppins(
              fontSize: screenHeight * 0.05, 
              fontWeight: FontWeight.w600,
              height: 1,
              color: const Color(0xffffffff),
            ),
          ),
          Text(
            'Welcome Back!',
            style: GoogleFonts.poppins(
              fontSize: screenHeight * 0.025, 
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: const Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }
}