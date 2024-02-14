import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';


class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // signupRTR (52:594)
        padding: EdgeInsets.fromLTRB(34*fem, 14*fem, 22.5*fem, 8*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          border: Border.all(color: Color(0xff353842)),
          color: const Color(0xff272a32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // statusbarudV (52:606)
              margin: EdgeInsets.fromLTRB(2.5*fem, 0*fem, 0*fem, 72*fem),
              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
              width: double.infinity,
              height: 19*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // time1gX (I52:606;128:320)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 231*fem, 0*fem),
                    child: Text(
                      '19:27',
                      style: GoogleFonts.poppins(
                        fontSize: 15*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2575*ffem/fem,
                        letterSpacing: -0.1650000066*fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    // symbolsJQj (I52:606;128:302)
                    margin: EdgeInsets.fromLTRB(0*fem, 3.16*fem, 0*fem, 4.34*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // combinedshapeS19 (I52:606;128:310)
                          margin: EdgeInsets.fromLTRB(0*fem, 0.08*fem, 5*fem, 0*fem),
                          width: 17.1*fem,
                          height: 10.7*fem,
                          child: Image.asset(
                            'assets/designs/images/combined-shape-pcK.png',
                            width: 17.1*fem,
                            height: 10.7*fem,
                          ),
                        ),
                        Container(
                          // wifiYK5 (I52:606;128:315)
                          margin: EdgeInsets.fromLTRB(0*fem, 0.04*fem, 5*fem, 0*fem),
                          width: 15.4*fem,
                          height: 11.06*fem,
                          child: Image.asset(
                            'assets/designs/images/wi-fi-7MV.png',
                            width: 15.4*fem,
                            height: 11.06*fem,
                          ),
                        ),
                        SizedBox(
                          width: 24.5*fem,
                          height: 11.5*fem,
                          child: Image.asset(
                            'assets/designs/images/battery-zYs.png',
                            width: 24.5*fem,
                            height: 11.5*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13.5*fem, 23*fem),
              width: 313*fem,
              height: 75*fem,
              child: Container(
                // autogroupoa9yh5V (JybXJ5bGBPCHyoLWvJoa9y)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 122*fem, 0*fem),
                width: 191*fem,
                height: double.infinity,
                child: SizedBox(
                  width: double.infinity,
                  height: 68*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                        child: Text(
                          'Create an account',
                          style: GoogleFonts.poppins(
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5*ffem/fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints (
                          maxWidth: 190*fem,
                        ),
                        child: Text(
                          'Let’s help you set up your account, it won’t take long.',
                          style: GoogleFonts.poppins(
                            fontSize: 11*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5*ffem/fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // autogroupgcx3A7V (JybXZeyeFCEww172Z4GCx3)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.5*fem, 18.83*fem),
              width: 316*fem,
              height: 318.17*fem,
              child: Stack(
                children: [
                  Positioned(
                    // inputsTsH (53:809)
                    left: 0*fem,
                    top: 0*fem,
                    child: SizedBox(
                      width: 316*fem,
                      height: 313*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroupmivpPF9 (JybXhV5vvL57hoxhLCmivP)
                            margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 21*fem),
                            width: double.infinity,
                            height: 61*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 0*fem),
                                  width: 145*fem,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0*fem,
                                        top: 19.5803222656*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 145*fem,
                                            height: 41.42*fem,
                                            child: Container(
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(10*fem),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0*fem,
                                        top: 0*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 74*fem,
                                            height: 21*fem,
                                            child: Text(
                                              'First name',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 30*fem,
                                        top: 32*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 17*fem,
                                            child: Text(
                                              'First name',
                                              style: GoogleFonts.poppins(
                                                fontSize: 11*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: const Color(0xff686f82),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 8*fem,
                                        top: 33*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 15*fem,
                                            height: 15*fem,
                                            child: Image.asset(
                                              'assets/designs/images/vuesax-bold-frame.png',
                                              width: 15*fem,
                                              height: 15*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 145*fem,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0*fem,
                                        top: 19.5803222656*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 145*fem,
                                            height: 41.42*fem,
                                            child: Container(
                                              decoration: BoxDecoration (
                                                borderRadius: BorderRadius.circular(10*fem),
                                                color: const Color(0xff353842),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0*fem,
                                        top: 0*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 74*fem,
                                            height: 21*fem,
                                            child: Text(
                                              'Last name',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 37*fem,
                                        top: 32*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 58*fem,
                                            height: 17*fem,
                                            child: Text(
                                              'Last name',
                                              style: GoogleFonts.poppins(
                                                fontSize: 11*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: const Color(0xff686f82),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 12*fem,
                                        top: 33*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 15*fem,
                                            height: 15*fem,
                                            child: Image.asset(
                                              'assets/designs/images/vuesax-bold-frame-Zz3.png',
                                              width: 15*fem,
                                              height: 15*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 26*fem),
                            width: 315*fem,
                            height: 65*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0*fem,
                                  top: 4*fem,
                                  child: SizedBox(
                                    width: 315*fem,
                                    height: 61*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0*fem,
                                          top: 19.5803222656*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 315*fem,
                                              height: 41.42*fem,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(10*fem),
                                                  color: const Color(0xff353842),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 11.25*fem,
                                          top: 37.5*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 12.5*fem,
                                              height: 10*fem,
                                              child: Image.asset(
                                                'assets/designs/images/ic-round-email.png',
                                                width: 12.5*fem,
                                                height: 10*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 31*fem,
                                          top: 34*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 62*fem,
                                              height: 17*fem,
                                              child: Text(
                                                'Enter email',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5*ffem/fem,
                                                  color: const Color(0xff686f82),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 3*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 99*fem,
                                      height: 21*fem,
                                      child: Text(
                                        'Email address',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5*ffem/fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 315*fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 54*fem),
                                  width: double.infinity,
                                  height: 65*fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0*fem,
                                        top: 4*fem,
                                        child: SizedBox(
                                          width: 315*fem,
                                          height: 61*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0*fem,
                                                top: 19.5802001953*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 315*fem,
                                                    height: 41.42*fem,
                                                    child: Container(
                                                      decoration: BoxDecoration (
                                                        borderRadius: BorderRadius.circular(10*fem),
                                                        color: const Color(0xff353842),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 13.5*fem,
                                                top: 32*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 12*fem,
                                                    height: 15*fem,
                                                    child: Image.asset(
                                                      'assets/designs/images/ooui-link-secure.png',
                                                      width: 12*fem,
                                                      height: 15*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 31*fem,
                                                top: 32*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 85*fem,
                                                    height: 17*fem,
                                                    child: Text(
                                                      'Enter password',
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 11*ffem,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.5*ffem/fem,
                                                        color: const Color(0xff686f82),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 283.625*fem,
                                                top: 34.8125*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 13.75*fem,
                                                    height: 9.38*fem,
                                                    child: Image.asset(
                                                      'assets/designs/images/mdi-eye.png',
                                                      width: 13.75*fem,
                                                      height: 9.38*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // passwordVCw (53:1255)
                                        left: 3*fem,
                                        top: 0*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 68*fem,
                                            height: 21*fem,
                                            child: Text(
                                              'Password',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5*ffem/fem,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // addyourprofilepicturePJK (53:1269)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 47*fem, 0*fem),
                                  child: Text(
                                    'Add your profile picture  ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5*ffem/fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 228.9166870117*fem,
                    top: 279.8333740234*fem,
                    child: Align(
                      child: SizedBox(
                        width: 39.17*fem,
                        height: 38.33*fem,
                        child: Image.asset(
                          'assets/designs/images/iconly-bold-image.png',
                          width: 39.17*fem,
                          height: 38.33*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // frame48095704D2T (79:1312)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.5*fem, 50*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: SizedBox(
                  width: 315*fem,
                  height: 60*fem,
                  child: Container(
                    // bigbutton7tX (53:753)
                    padding: EdgeInsets.fromLTRB(102.5*fem, 18*fem, 104.5*fem, 18*fem),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration (
                      color:const Color(0xff353842),
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // labeld6B (I53:753;53:624)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                          child: Text(
                            'Continue ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5*ffem/fem,
                              color:const Color(0xffffffff),
                            ),
                          ),
                        ),
                        SizedBox(
                          // icongeneralarrowrightLWP (I53:753;53:625)
                          width: 20*fem,
                          height: 20*fem,
                          child: Image.asset(
                            'assets/designs/images/icon-general-arrow-right-jmV.png',
                            width: 20*fem,
                            height: 20*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // line3GQ3 (53:808)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.5*fem, 50.5*fem),
              width: 322*fem,
              height: 0.5*fem,
              decoration: const BoxDecoration (
                color: Color(0xff686f82),
              ),
            ),
            Container(
              // alreadyamemberloginntB (53:745)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14.5*fem, 89*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 11*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5*ffem/fem,
                      color:const Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Already a member?',
                        style: GoogleFonts.poppins(
                          fontSize: 11*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: const Color(0xff686f82),
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: 'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 11*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: const Color(0xffe7965b),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // homeindicatormtX (52:595)
              margin: EdgeInsets.fromLTRB(94*fem, 0*fem, 105.5*fem, 0*fem),
              width: double.infinity,
              child: Center(
                // line8DH (I52:595;42:603)
                child: SizedBox(
                  width: double.infinity,
                  height: 5*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(100*fem),
                      color: const Color(0xffffffff),
                    ),
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