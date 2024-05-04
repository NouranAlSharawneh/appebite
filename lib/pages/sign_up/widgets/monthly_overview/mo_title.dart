import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appebite/home_main.dart';

class MOTitle extends StatelessWidget {
  const MOTitle({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100*fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                  child: Text(
                    'Monthly calories goal',
                    style: GoogleFonts.poppins(
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints (
                    maxWidth: 250*fem,
                  ),
                  child: Text(
                    'Taking into account your height, weight, age, and gender, our recommendation is that you consume a daily amount of food with your specific calorie target.',
                    style: GoogleFonts.poppins(
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      FadeTransition(
                    opacity: animation,
                    child: const HomeMain(),
                  ),
                ),
              );
            },
            style: TextButton.styleFrom (
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              width: 30*fem,
              height: 30*fem,
              child: const Icon(
                Icons.arrow_forward,
                color: Color(0xffff7269),
                size: 29,
              )
            ),
          ),
        ],
      ),
    );
  }
}