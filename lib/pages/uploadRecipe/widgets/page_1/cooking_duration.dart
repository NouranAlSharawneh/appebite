import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookingDuration extends StatelessWidget {
  const CookingDuration({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
              
              margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 5.5*fem, 31*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(32*fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // cookingdurationinminutesyLF (36:633)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 22*fem),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts. poppins(                                  
                          fontSize: 17*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          letterSpacing: 0.118999998*fem,
                          color: Color(0xff3d5480),
                        ),
                        children: [
                          TextSpan(
                            text: 'Cooking ',
                            style: GoogleFonts. poppins(                                      
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.5*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                          TextSpan(
                            text: 'Duration',
                            style: GoogleFonts. poppins(                                       
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.5*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                          ),
                          TextSpan(
                            text: '(in minutes)',
                            style: GoogleFonts. poppins(                                      
                              fontSize: 12*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.5*fem,
                              color: Color(0xff686f82),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // group15384eX (36:634)
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(32*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupjkebPwh (JybzdTiHXmFjKyoacyJKEB)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // L6F (36:635)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 128.5*fem, 0*fem),
                                child: Text(
                                  '<10',
                                  style: GoogleFonts. poppins(                                            
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.6666666667*ffem/fem,
                                    letterSpacing: 0.5*fem,
                                    color: Color(0xffff7269),
                                  ),
                                ),
                              ),
                              Container(
                                // ecj (36:637)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 114.5*fem, 0*fem),
                                child: Text(
                                  '30',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts. poppins(
                                     
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.6666666667*ffem/fem,
                                    letterSpacing: 0.5*fem,
                                    color: Color(0xffff7269),
                                  ),
                                ),
                              ),
                              Text(
                                '>60',
                                textAlign: TextAlign.right,
                                style: GoogleFonts. poppins(
                                   
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.6666666667*ffem/fem,
                                  letterSpacing: 0.5*fem,
                                  color: const Color(0xff686e81),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 24*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle36dzT (36:638)
                                left: 0*fem,
                                top: 8*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 327*fem,
                                    height: 8*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(32*fem),
                                        color: Color(0xfff4f5f7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle213xG3 (36:639)
                                left: 0*fem,
                                top: 8*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 167*fem,
                                    height: 8*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(32*fem),
                                        color: Color(0xffff7269),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle212fRM (36:640)
                                left: 158*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 24*fem,
                                    height: 24*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(32*fem),
                                        color: Color(0xffff7269),
                                      ),
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
                ],
              ),
            );
  }
}
