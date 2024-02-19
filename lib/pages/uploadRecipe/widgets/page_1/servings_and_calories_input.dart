import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServingsAndCaloriesInput extends StatelessWidget {
  const ServingsAndCaloriesInput({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
              // fooddetailsN4s (40:627)
              margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 8.5*fem, 107*fem),
              width: double.infinity,
              height: 37*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 2*fem),
                          child: Text(
                            'Servings',
                            style: GoogleFonts.poppins(
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.118999998*fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(9 * fem, 10 * fem, 20 * fem, 8 * fem),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff353842),
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child: TextField(
                            style: GoogleFonts.poppins(
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              letterSpacing: 0.1049999982 * fem,
                              color: const Color(0xff686e81),
                            ),
                            decoration: InputDecoration(
                              hintText: '3',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2125 * ffem / fem,
                                letterSpacing: 0.1049999982 * fem,
                                color: const Color(0xff686e81),
                              ),
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8 * fem, right: 10 * fem),
                                child: const Icon(Icons.fastfood),
                              ),
                            ),
                          ),
                        ),

                  SizedBox(
                    // caloriesboxPXh (41:597)
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // caloriesLxj (40:614)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 2*fem),
                          child: Text(
                            'Calories ',
                            style: GoogleFonts.poppins(
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.118999998*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupg33h4Nw (Jyc15hTZvK3mE2ZrRNG33h)
                          padding: EdgeInsets.fromLTRB(10*fem, 10*fem, 11*fem, 8*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xff353842),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // vectoryko (40:626)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 2*fem),
                                width: 10*fem,
                                height: 15*fem,
                                child: Image.asset(
                                  'assets/designs/images/vector-EJF.png',
                                  width: 10*fem,
                                  height: 15*fem,
                                ),
                              ),
                              Text(
                                '250',
                                style: GoogleFonts.poppins(
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125*ffem/fem,
                                  letterSpacing: 0.1049999982*fem,
                                  color: Color(0xff686e81),
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
            ),
              
          ],
        ),
      );
  }
}