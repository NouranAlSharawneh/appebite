// noran: very much under process!

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // loginUuh (53:810)
        padding: EdgeInsets.fromLTRB(34 * fem, 14 * fem, 22.5 * fem, 8 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff353842)),
          color: Color(0xff272a32),
          borderRadius: BorderRadius.circular(45 * fem),
        ),
        child: Column(
          children: [
            Container(
              // titttleEZR (53:812)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 171.5 * fem, 50 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // helloAT5 (53:813)
                    'Hello,',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575 * ffem / fem,
                      letterSpacing: -0.1650000066 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                  Text(
                    // welcomebackhT1 (53:814)
                    'Welcome Back!',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2575 * ffem / fem,
                      letterSpacing: -0.1650000066 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // inputsEhq (53:815)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11.5 * fem, 17 * fem),
              width: 315 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // inputfieldkw5 (53:816)
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 45 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // labelVdm (I53:816;30:301)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 5 * fem),
                          child: Text(
                            'Email',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupfgnfQVq (JybWVgku7nX4VqpHiEfGNF)
                          padding: EdgeInsets.fromLTRB(20 * fem, 19 * fem, 20 * fem, 19 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff353842),
                            borderRadius: BorderRadius.circular(10 * fem),
                          ),
                          child: Text(
                            'Enter email',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff686f82),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // inputfieldtA7 (53:817)
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // labelRfq (I53:817;30:301)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 5 * fem),
                          child: Text(
                            'Enter password',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupjk2xLXu (JybWhGFwZa2wyED92sJk2X)
                          padding: EdgeInsets.fromLTRB(20 * fem, 19 * fem, 20 * fem, 19 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff353842),
                            borderRadius: BorderRadius.circular(10 * fem),
                          ),
                          child: Text(
                            'Enter password',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff686f82),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              // forgotpasswordRJT (53:819)
              child: Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 229.5 * fem, 28 * fem),
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontSize: 11 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * ffem / fem,
                    color: Color(0xffe7965b),
                  ),
                ),
              ),
            ),
            Container(
              // bigbuttonujR (53:820)
              margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 15.5 * fem, 48 * fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(120 * fem, 18 * fem, 120 * fem, 18 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffff7269),
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // labelyDV (I53:820;53:624)
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11 * fem, 0 * fem),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // icongeneralarrowrighttbM (I53:820;53:625)
                        width: 20 * fem,
                        height: 20 * fem,
                        child: Image.asset(
                          'assets/designs/images/icon-general-arrow-right-Roq.png',
                          width: 20 * fem,
                          height: 20 * fem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // line3Ddd (53:822)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 12.5 * fem, 40.5 * fem),
              width: 322 * fem,
              height: 0.5 * fem,
              decoration: BoxDecoration(
                color: Color(0xff686f82),
              ),
            ),
            Container(
              // donthaveanaccountsignupLy9 (53:821)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 24.5 * fem, 142 * fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 11 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Don’t have an account?',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 11 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5 * ffem / fem,
                          color: Color(0xff686f82),
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 11 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5 * ffem / fem,
                          color: Color(0xffe7965b),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
