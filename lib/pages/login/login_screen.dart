import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(34, 14, 22.5, 8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff272a32),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 171.5, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Hello,',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      height: 1.2575,
                      letterSpacing: -0.1650000066,
                      color: Color(0xffffffff),
                    ),
                  ),
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      height: 1.2575,
                      letterSpacing: -0.1650000066,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 11.5, 17),
              width: 315,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 45),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'Email',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 19, 20, 19),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff353842),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Enter email',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Color(0xff686f82),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'Enter password',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 19, 20, 19),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff353842),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Enter password',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
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
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 229.5, 28),
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Color(0xffe7965b),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4, 0, 15.5, 48),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(120, 18, 120, 18),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffff7269),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 11, 0),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 12.5, 40.5),
              width: 322,
              height: 0.5,
              decoration: BoxDecoration(
                color: Color(0xff686f82),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 24.5, 142),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Don’t have an account?',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
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
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
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
