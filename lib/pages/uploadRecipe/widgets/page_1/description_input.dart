import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({
    super.key,
    required this.fem,
    required this.ffem,
    required this.descriptionController,
  });

  final double fem;
  final double ffem;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16*fem),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10*fem),
            child: Text(
              'Description',
              style: GoogleFonts.poppins(
                fontSize: 17*ffem,
                fontWeight: FontWeight.w700,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 90 * fem,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13 * fem),
                color: const Color(0xff353842),
              ),
              child: TextField(
                controller: descriptionController,
                style: GoogleFonts.poppins(
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffffffff),
                ),
                decoration: InputDecoration(
                  hintText: 'Tell a little about your food',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff686f82),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 24 *fem, vertical: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}