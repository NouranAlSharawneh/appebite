import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appebite/pages/uploadRecipe/upload_recipe.dart';

class SignUpAccountConfirmation extends StatelessWidget {
  const SignUpAccountConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor:const Color(0xff272a32),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(36*fem, 70*fem, 36*fem, 0*fem),
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Color(0xff272a32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 20*fem, 0*fem, 30*fem),                 
                  child: Icon(
                    Icons.check_circle_outlined,
                    size: 300*fem,
                    color: const Color(0xffffffff),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18*fem),
                  child: Text(
                    'Account Created  ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22*ffem,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40*fem),
                  constraints: BoxConstraints (
                    maxWidth: 270*fem,
                  ),
                  child: Text(
                    'Your account has been created successfully, you can now start using the application   ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15*ffem,
                      fontWeight: FontWeight.w500,
                      height: 2*ffem/fem,
                      letterSpacing: 0.5*fem,
                      color: const Color(0xff686e81),
                    ),
                  ),
                ),
                SizedBox(
                  width: 315 * fem,
                  height: 60 * fem,
                  child: Container(
                    width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffff7269),
                    borderRadius: BorderRadius.circular(10 *fem),
                  ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                FadeTransition(
                              opacity: animation,
                              child: const UploadRecipe(),
                            ),
                          ),
                        );
                      },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                              child: Text(
                                'Get Started',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffffffff),
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
              ],
            ),
          ),
        ),
      )
    );
  }
}