import 'package:appebite/pages/sign_up/signup_screen_page_two.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.fem,
    required this.ffem,
    required this.formKey,
  });

  final double fem;
  final double ffem;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.5*fem, 50*fem),
      child: TextButton(
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          if(isValid) {
            formKey.currentState!.save();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPageTwo()), 
            );
          }
        },
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
    );
  }
}
