import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadFormButtons extends StatelessWidget {
  const UploadFormButtons({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21*fem),
            width: double.infinity,
            height: 56*fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
              context
             
            );
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: SizedBox(
                      width: 156*fem,
                      height: double.infinity,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration (
                          color: const Color(0xff353842),
                          borderRadius: BorderRadius.circular(32*fem),
                        ),
                        child: Center(
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2*ffem/fem,
                              color: const Color(0xff686e81),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 156*fem,
                    height: double.infinity,
                    decoration: BoxDecoration (
                      color: const Color(0xffff7269),
                      borderRadius: BorderRadius.circular(32*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Upload',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

