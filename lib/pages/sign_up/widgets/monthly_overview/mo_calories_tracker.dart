import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MOCalories extends StatefulWidget {
  const MOCalories({
    Key? key,
    required this.fem,
    required this.ffem,
  }) : super(key: key);

  final double fem;
  final double ffem;

  @override
  State<MOCalories> createState() => _MOCaloriesState();
}

class _MOCaloriesState extends State<MOCalories> {
  TextEditingController caloriesController = TextEditingController(text: '60000');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.5 * widget.fem, 0 * widget.fem, 59.5 * widget.fem, 120 * widget.fem),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8 * widget.fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 13 * widget.fem),
            width: double.infinity,
            height: 78 * widget.fem,
            decoration: BoxDecoration(
              color: const Color(0xff252830),
              borderRadius: BorderRadius.circular(8 * widget.fem),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      controller: caloriesController,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                        fontSize: 25 * widget.ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * widget.ffem / widget.fem,
                        color: const Color(0xffffffff),
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(left: 40),
                        border: InputBorder.none,
                        hintText: 'calories',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20 * widget.ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * widget.ffem / widget.fem,
                          color: const Color(0xff686f82),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      ' calories',
                      style: GoogleFonts.poppins(
                        fontSize: 20 * widget.ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * widget.ffem / widget.fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 170 * widget.fem,
            ),
            child: Text(
              'note: you can edit your goal based on your desire',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 11 * widget.ffem,
                fontWeight: FontWeight.w300,
                height: 1.0 * widget.ffem / widget.fem,
                letterSpacing: 0.5 * widget.fem,
                color: const Color(0xff686f82),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
