import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpInformation extends StatelessWidget {
  const SignUpInformation({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.onWeightChanged,
    required this.onHeightChanged,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final Function(String) onHeightChanged;
  final Function(String) onWeightChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 30 * fem, 0 * fem, 30 * fem),
      width: 300 * fem,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8 * fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 27 * fem),
            width: double.infinity,
            height: 38 * fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 37 * fem, 12 * fem),
                  child: Text(
                    'Current weight',
                    style: GoogleFonts.poppins(
                      fontSize: 11 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter weight';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      onWeightChanged(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.justify,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 12 * fem, 10 * fem),
                      prefix: Text(
                        'kg  ',
                        style: TextStyle(
                          color: const Color(0xff686f82),
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1 * ffem / fem,
                        ),
                      ),
                      hintText: '55',
                      hintStyle: const TextStyle(color: Color(0xff686f82)),
                      filled: true,
                      fillColor: const Color(0xff353842),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color:Color(0xff686f82),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color:  Color(0xffff7269) 
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color:Color(0xff686f82),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color(0xffff7269) 
                        ),
                      ),
                      errorStyle: const TextStyle(
                        color: Color(0xffff7269),
                        fontSize: 12.0,
                        height: 1, 
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 38 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * fem),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 3 * fem, 39 * fem, 0 * fem),
                  child: Text(
                    'Current height',
                    style: GoogleFonts.poppins(
                      fontSize: 11 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      onHeightChanged(value);
                    },                  
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.justify,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 12 * fem, 5 * fem),
                      prefix: Text(
                        'cm  ',
                        style: TextStyle(
                          color: const Color(0xff686f82),
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                        ),
                      ),
                      hintText: '173',
                      hintStyle: const TextStyle(color: Color(0xff686f82)),
                      filled: true,
                      fillColor: const Color(0xff353842),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color:Color(0xff686f82),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color:  Color(0xffff7269) 
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color:Color(0xff686f82),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: const BorderSide(
                          color: Color(0xffff7269) 
                        ),
                      ),
                      errorStyle: const TextStyle(
                        color: Color(0xffff7269),
                        fontSize: 12.0,
                        height: 1, 
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter height';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
