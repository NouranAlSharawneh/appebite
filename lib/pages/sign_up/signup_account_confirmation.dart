import 'package:appebite/pages/uploadRecipe/upload_recipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpAccountConfirmation extends StatelessWidget {
  const SignUpAccountConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor:const Color(0xff272a32),
      body: SingleChildScrollView(
        child:SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(34*fem, 120*fem, 22.5*fem, 0*fem),
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Color(0xff272a32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 20*fem, 14.33*fem, 47.33*fem),
                  
                  child: Icon(
                    Icons.check_circle_outlined,
                    size: 300*fem,
                    color: const Color(0xffffffff),
                    ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 18*fem),
                  child: Text(
                    'Account Created  ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.5*ffem/fem,
                      letterSpacing: 0.5*fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 55*fem),
                  constraints: BoxConstraints (
                    maxWidth: 270*fem,
                  ),
                  child: Text(
                    'Your account has been created successfully, you can now start using the application   ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.6666666667*ffem/fem,
                      letterSpacing: 0.5*fem,
                      color: const Color(0xff686e81),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(1.5*fem, 0*fem, 15.5*fem, 117*fem),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UploadRecipe()), 
                      );
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(95.5*fem, 18*fem, 95.5*fem, 18*fem),
                      width: double.infinity,
                      decoration: BoxDecoration (
                        color: const Color(0xffff7269),
                        borderRadius: BorderRadius.circular(10*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                            child: Text(
                              'Get Started',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5*ffem/fem,
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
    ))
    );
  }
}