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
  double femaleOpacity = 1.0;
  double maleOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240*widget.fem,
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      maleOpacity = 1.0;
                      femaleOpacity = 0.5;
                      widget.onGenderSelected('Male');
                    });
                  },
                  child: Opacity(
                    opacity: maleOpacity,
                    child: SizedBox(
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
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      maleOpacity = 0.5;
                      femaleOpacity = 1.0;
                      widget.onGenderSelected('Female');
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
          SizedBox(
            width: 195* widget.fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Male',
                  style: GoogleFonts.poppins(
                    fontSize: 11 * widget.ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * widget.ffem / widget.fem,
                    color: const Color(0xff686f82),
                  ),
                ),
                const Spacer(),
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
      ),
    );
  }
}
