import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          const SizedBox(width: 16.0),
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
                                color: const Color(0xff353842),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'first name',
                                  hintStyle: TextStyle(color: Color(0xff686f82)),
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
                                color: const Color(0xff353842),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'last name',
                                  hintStyle: TextStyle(color: Color(0xff686f82)),
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
                              color: const Color(0xff353842),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(color: Color(0xff686f82)),
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
                              color: const Color(0xff353842),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            
                            child: const TextField(
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(color: Color(0xff686f82)),
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
    );
  }
}
