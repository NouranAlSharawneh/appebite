import 'package:appebite/pages/sign_up/signup_monthly_overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpAccentButton extends StatelessWidget {
  const SignUpAccentButton({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.5*fem, 50*fem),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpMonthlyOverview()), 
            );
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
              color:const Color(0xffff7269),
              borderRadius: BorderRadius.circular(10*fem),
            ),
            child: 
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                  child: Text(
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16*ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5*ffem/fem,
                      color:const Color(0xffffffff),
                    ),
                  ),
                ),
                
          ),
        ),
      ),
    );
  }
}
