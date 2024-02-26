import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadRecipeSteps extends StatelessWidget {
  const UploadRecipeSteps({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 16 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18 * fem),
                  child: Text(
                    'Steps ',
                    style: GoogleFonts.poppins(
                      fontSize: 17 * ffem,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 112 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 0 * fem),
                        width: 24 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                              width: double.infinity,
                              height: 24 * fem,
                              decoration: BoxDecoration(
                                color: const Color(0xffe6955b),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125 * ffem / fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox (
                              width: 24,
                              height: 24,
                              child: Icon(
                                Icons.drag_indicator_outlined,
                                size: 24,
                                color: Color(0xff686f82),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16 * fem, 5 * fem, 0* fem, 16 * fem),
                        width: 300 * fem,
                        height: 100 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff353842)),
                          color: const Color(0xff353842),
                          borderRadius: BorderRadius.circular(8 * fem),
                        ),
                        child: TextField(
                          style: GoogleFonts.poppins(
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1 * ffem / fem,
                            letterSpacing: 0.5 * fem,
                            color: const Color(0xff686f82),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Tell a little about your food',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2125 * ffem / fem,
                              letterSpacing: 0.5 * fem,
                              color: const Color(0xff686f82),
                            ),
                            border: InputBorder.none,
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
