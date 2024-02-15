import 'package:appebite/pages/sign_up/widgets/signup_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
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
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 100, 13.5*fem, 23*fem),
              width: 313*fem,
              height: 75*fem,
              // for the title of the page
              child: SignUpTitle(fem: fem, ffem: ffem),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.5*fem, 18.83*fem),
              width: 316*fem,
              height: 318.17*fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 0*fem,
                    top: 0*fem,
                    child: SizedBox(
                      width: 316*fem,
                      height: 313*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // First row: Labels
                              Row(
                                children: [
                                  // "First name" label
                                  Expanded(
                                    child:Text(
                                        'First name',
                                        style: GoogleFonts.poppins(
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5*ffem/fem,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  // "Last name" label
                                  Expanded(
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
                                ],
                              ),
                              const SizedBox(height: 8.0), 

                              // Second row: Text Fields
                              Row(
                                children: [
                                  // "First name" text field
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      // child: TextField(
                                      //   decoration: InputDecoration(
                                      //     hintText: 'Enter your first name',
                                      //     contentPadding: EdgeInsets.all(12.0),
                                      //     border: InputBorder.none,
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0), // Add some spacing between text fields

                                  // "Last name" text field
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      // child: const TextField(
                                      //   decoration: InputDecoration(
                                      //     hintText: 'Enter your last name',
                                      //     contentPadding: EdgeInsets.all(12.0),
                                      //     border: InputBorder.none,
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
          ],
        ),
      ),
          );
  }
}