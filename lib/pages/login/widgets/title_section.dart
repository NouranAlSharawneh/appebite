import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 171.5, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello,',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              height: 1.2575,
              letterSpacing: -0.1650000066,
              color: const Color(0xffffffff),
            ),
          ),
          Text(
            'Welcome Back!',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: -0.2,
              color: const Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }
}