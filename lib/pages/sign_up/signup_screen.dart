import 'package:appebite/pages/sign_up/widgets/signup_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(body: SizedBox(
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
                              const SizedBox(height: 8.0), // Add some spacing between rows

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
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter your first name',
                                          contentPadding: EdgeInsets.all(12.0),
                                          border: InputBorder.none,
                                        ),
                                      ),
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
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter your last name',
                                          contentPadding: EdgeInsets.all(12.0),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0), // Add some spacing between rows

                              // Third row: Labels
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // "Email" label
                                  Text(
                                    'Email address',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5*ffem/fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0), 
                                  // Fourth row: Text Field
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your email',
                                        contentPadding: EdgeInsets.all(12.0),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0), 

                              // Fifth row: Labels
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // "Password" label
                                  Text(
                                    'Password',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5*ffem/fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0), 

                                  // Sixth row: Text Field
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your password',
                                        contentPadding: EdgeInsets.all(12.0),
                                        border: InputBorder.none,
                                      
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
              
                          Center(
                            child: SizedBox(
                              width: 315 * fem,
                              height: 70,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(39 * fem, 20 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                          'Add your profile picture  ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            color: const Color(0xffffffff), 
                                          ),
                                        ),
                                      ),
                          
                                      Container(
                                        margin: EdgeInsets.only(right: 10 * fem, top: 20),
                                        child: Icon(
                                          Icons.photo,
                                          color:const Color.fromRGBO(104, 111, 130, 100),
                                          size: 48 * ffem,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
          ],
          ),
                  
          
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
                          width: 20*fem,
                          height: 20*fem,
                          child:const Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color:Color(0xffffffff),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.5*fem, 50.5*fem),
              width: 322*fem,
              height: 0.5*fem,
              decoration: const BoxDecoration (
                color: Color(0xff686f82),
              ),
            ),
            Container(
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
    )
    );
  }
}