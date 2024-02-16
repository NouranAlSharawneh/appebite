import 'package:appebite/pages/sign_up/widgets/signup_button.dart';
import 'package:appebite/pages/sign_up/widgets/signup_divider.dart';
import 'package:appebite/pages/sign_up/widgets/signup_navigator.dart';
import 'package:appebite/pages/sign_up/widgets/signup_terms_and_conditions.dart';
import 'package:appebite/pages/sign_up/widgets/signup_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPageTwo extends StatelessWidget {
  const SignUpPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(34*fem, 14*fem, 22.5*fem, 8*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xff272a32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignUpTitle(fem: fem, ffem: ffem),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 180*fem, 44.5*fem),
              child: Text(
                'Personal information ',
                style: GoogleFonts.poppins(
                  fontSize: 14*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5*ffem/fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(32*fem, 0*fem, 46*fem, 9.5*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 7*fem, 104*fem, 0*fem),
                    width: 75*fem,
                    height: 75*fem,
                    child: InkWell(
                          onTap: () {
                          },
                          child: Image.asset(
                            'assets/images/male_icon.png',
                            width: 75 * fem,
                            height: 75 * fem,
                          ),
                        ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                    width: 75*fem,
                    height: 75*fem,
                    child: InkWell(
                          onTap: () {
                          },
                          child: Image.asset(
                            'assets/images/female_icon.png',
                            width: 75 * fem,
                            height: 75 * fem,
                          ),
                        ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(56.5*fem, 0*fem, 62.5*fem, 27*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 145*fem, 0*fem),
                    child: Text(
                      'Male',
                      style: GoogleFonts.poppins(
                        fontSize: 11*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5*ffem/fem,
                        color: const Color(0xff686f82),
                      ),
                    ),
                  ),
                  Text(
                    'Female',
                    style: GoogleFonts.poppins(
                      fontSize: 11*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff686f82),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 83*fem, 28*fem),
              width: 260*fem,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(8*fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 27*fem),
                    width: double.infinity,
                    height: 28*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 2*fem),
                          child: Text(
                            'Current weight',
                            style: GoogleFonts.poppins(
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5*ffem/fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(7*fem, 4*fem, 73*fem, 3*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: const Color(0xff353842),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 2*fem),
                                child: Text(
                                  'kg',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff686f82),
                                  ),
                                ),
                              ),
                              Text(
                                '55',
                                style: GoogleFonts.poppins(
                                  fontSize: 14*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 28*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 39*fem, 0*fem),
                          child: Text(
                            'Current height',
                            style: GoogleFonts.poppins(
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(7*fem, 5*fem, 68*fem, 2*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xff353842),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // cm6BD (54:1405)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 4*fem),
                                child: Text(
                                  'cm',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xff686f82),
                                  ),
                                ),
                              ),
                              Text(
                                // pN7 (54:1407)
                                '168',
                                style: GoogleFonts.poppins(
                                  fontSize: 14*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1.5*fem, 0*fem, 84.5*fem, 34*fem),
              width: double.infinity,
              height: 28*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // birthyearVUF (70:1268)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 63*fem, 3*fem),
                    child: Text(
                      'Birth year ',
                      style: GoogleFonts.poppins(
                        fontSize: 11*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5*ffem/fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5*fem, 0*fem, 43*fem, 0*fem),
                    height: double.infinity,
                    decoration: BoxDecoration (
                      color: Color(0xff353841),
                      borderRadius: BorderRadius.circular(5*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 5*fem, 0*fem),
                          width: 21*fem,
                          height: 21.21*fem,
                          child: Image.asset(
                            'assets/designs/images/vuesax-linear-arrow-down-19D.png',
                            width: 21*fem,
                            height: 21.21*fem,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
                          width: 0*fem,
                          height: 1*fem,
                          decoration: BoxDecoration (
                            color: Color(0xff252830),
                          ),
                        ),
                        Container(
                          // ZMd (70:1257)
                          margin: EdgeInsets.fromLTRB(0*fem, 6.59*fem, 0*fem, 0*fem),
                          child: Text(
                            '2002',
                            style: GoogleFonts.poppins(
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SignUpTermsAndConditions(fem: fem, ffem: ffem),

            SignUpButton(fem: fem, ffem: ffem),
            SignUpDivider(fem: fem),
            SignUpNavigator(fem: fem, ffem: ffem),
          ],
        ),
      ),
    )
    );
  }
}

