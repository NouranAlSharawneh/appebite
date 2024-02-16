import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpGender extends StatefulWidget {
  const SignUpGender({ super.key,
    required this.fem,
    required this.ffem,});

  final double fem;
  final double ffem;
  
  @override
  State<SignUpGender> createState() => _SignUpGenderState();
}

class _SignUpGenderState extends State<SignUpGender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              margin: EdgeInsets.fromLTRB(32*widget.fem, 0*widget.fem, 46*widget.fem, 9.5*widget.fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*widget.fem, 7*widget.fem, 104*widget.fem, 0*widget.fem),
                    width: 75*widget.fem,
                    height: 75*widget.fem,
                    child: InkWell(
                          onTap: () {
                          },
                          child: Image.asset(
                            'assets/images/male_icon.png',
                            width: 75 *widget.fem,
                            height: 75 *widget.fem,
                          ),
                        ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0*widget.fem, 0*widget.fem, 0*widget.fem, 7*widget.fem),
                    width: 75*widget.fem,
                    height: 75*widget.fem,
                    child: InkWell(
                          onTap: () {
                          },
                          child: Image.asset(
                            'assets/images/female_icon.png',
                            width: 75 *widget.fem,
                            height: 75 *widget.fem,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(56.5*widget.fem, 0*widget.fem, 62.5*widget.fem, 27*widget.fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*widget.fem, 0*widget.fem, 145*widget.fem, 0*widget.fem),
                    child: Text(
                      'Male',
                      style: GoogleFonts.poppins(
                        fontSize: 11*widget.ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5*widget.ffem/widget.fem,
                        color: const Color(0xff686f82),
                      ),
                    ),
                  ),
                  Text(
                    'Female',
                    style: GoogleFonts.poppins(
                      fontSize: 11*widget.ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*widget.ffem/widget.fem,
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