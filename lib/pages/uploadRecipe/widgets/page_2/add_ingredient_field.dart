import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddIngredientPage extends StatelessWidget {
  const AddIngredientPage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 15),
      width: double.infinity,
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            width: 24,
            height: 24,
            child: const Icon(
              Icons.drag_indicator_outlined,
              size: 24,
              color: Color(0xff686f82),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(21.65, 5, 21.65, 0),
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff353842)),
                color: const Color(0xff353842),
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextField(
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: const Color(0xffffffff),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xff353842),
                  hintText: 'Enter ingredient',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.2125,
                    color: const Color(0xff686f82),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
