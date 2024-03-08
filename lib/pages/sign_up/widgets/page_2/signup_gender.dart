import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpGender extends StatefulWidget {
  const SignUpGender({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.onGenderSelected,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final Function(String) onGenderSelected;

  @override
  State<SignUpGender> createState() => _SignUpGenderState();
}

class _SignUpGenderState extends State<SignUpGender> {
  double maleOpacity = 1.0;
  double femaleOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(32 * widget.fem, 0 * widget.fem, 46 * widget.fem, 9.5 * widget.fem),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    maleOpacity = 1.0;
                    femaleOpacity = 0.5;
                    widget.onGenderSelected('Male');
                    // Handle the male selection action here 
                  });
                },
                child: Opacity(
                  opacity: maleOpacity,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0 * widget.fem, 7 * widget.fem, 104 * widget.fem, 0 * widget.fem),
                    width: 75 * widget.fem,
                    height: 75 * widget.fem,
                    child: Image.asset(
                      'assets/images/male_icon.png',
                      width: 75 * widget.fem,
                      height: 75 * widget.fem,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    maleOpacity = 0.5;
                    femaleOpacity = 1.0;
                    widget.onGenderSelected('Female');
                    // Handle the female selection action here 
                  });
                },
                child: Opacity(
                  opacity: femaleOpacity,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 7 * widget.fem),
                    width: 75 * widget.fem,
                    height: 75 * widget.fem,
                    child: Image.asset(
                      'assets/images/female_icon.png',
                      width: 75 * widget.fem,
                      height: 75 * widget.fem,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(56.5 * widget.fem, 0 * widget.fem, 62.5 * widget.fem, 27 * widget.fem),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 145 * widget.fem, 0 * widget.fem),
                child: Text(
                  'Male',
                  style: GoogleFonts.poppins(
                    fontSize: 11 * widget.ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * widget.ffem / widget.fem,
                    color: const Color(0xff686f82),
                  ),
                ),
              ),
              Text(
                'Female',
                style: GoogleFonts.poppins(
                  fontSize: 11 * widget.ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5 * widget.ffem / widget.fem,
                  color: const Color(0xff686f82),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
