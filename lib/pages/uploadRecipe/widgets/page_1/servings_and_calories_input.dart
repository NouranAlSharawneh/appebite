import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServingsAndCaloriesInput extends StatelessWidget {
  const ServingsAndCaloriesInput({
    Key? key,
    required this.text1,
    required this.text2,
    required this.servingsController,
    required this.caloriesController,
    this.gapWidth = 10.0,
  }) : super(key: key);

  final double gapWidth;
  final String text1;
  final String text2;
  final TextEditingController servingsController;
  final TextEditingController caloriesController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 0, 5.5, 31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  text1,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    height: 1,
                    letterSpacing: 0.5,
                    color: const Color(0xffffffff),
                  ),
                ),
                SizedBox(width: gapWidth),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff353842),
                      ),
                      child: TextField(
                        controller: servingsController,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          color: const Color(0xff686f82),
                        ),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 13,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            color: const Color(0xff686f82),
                          ),
                          prefixIcon: const Icon(Icons.people_sharp, color: Color(0xff686f82)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: gapWidth),
          Expanded(
            child: Row(
              children: [
                Text(
                  text2,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: const Color(0xffffffff),
                  ),
                ),
                SizedBox(width: gapWidth),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff353842),
                      ),
                      child: TextField(
                        controller: caloriesController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          color: const Color(0xff686f82),
                        ),
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            letterSpacing: 0.5,
                            color: const Color(0xff686f82),
                          ),
                          prefixIcon: const Icon(Icons.sports_gymnastics, color: Color(0xff686f82)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}