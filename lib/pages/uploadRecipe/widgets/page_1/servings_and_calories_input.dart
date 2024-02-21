import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    Key? key,
    required this.fem,
    required this.ffem,
  }) : super(key: key);

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 8.5 * fem, 0 * fem),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Servings',
                  style: GoogleFonts.poppins(
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffffffff),
                  ),
                ),
                SizedBox(height: 2 * fem),
                Container(
                  padding: EdgeInsets.fromLTRB(9 * fem, 10 * fem, 20 * fem, 8 * fem),
                  decoration: BoxDecoration(
                    color: const Color(0xff353842),
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child: TextField(
                    style: GoogleFonts.poppins(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff686e81),
                    ),
                    decoration: InputDecoration(
                      hintText: '3',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.5 * ffem / fem,
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
              ],
            ),
            SizedBox(width: 15 * fem), // Add some spacing between the two sections
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories ',
                  style: GoogleFonts.poppins(
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.2125 * ffem / fem,
                    color: const Color(0xffffffff),
                  ),
                ),
                SizedBox(height: 2 * fem),
                Container(
                  padding: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 11 * fem, 8 * fem),
                  decoration: BoxDecoration(
                    color: const Color(0xff353842),
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 7 * fem, 2 * fem),
                        width: 10 * fem,
                        height: 15 * fem,
                      ),
                      Text(
                        '250',
                        style: GoogleFonts.poppins(
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xff686e81),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
      
      ),
    );
  }
}