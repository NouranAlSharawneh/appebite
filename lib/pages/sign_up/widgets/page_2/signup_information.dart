import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpInformation extends StatelessWidget {
  const SignUpInformation({
    super.key,
    required this.fem,
    required this.ffem,
    required this.onWeightChanged,
    required this.onHeightChanged,
  });

  final double fem;
  final double ffem;
  final Function(String) onHeightChanged;
  final Function(String) onWeightChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 83*fem, 28*fem),
      width: 300*fem,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(8*fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 27*fem),
            width: double.infinity,
            height: 28*fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37*fem, 2*fem),
                  child: Text(
                    'Current weight',
                    style: GoogleFonts.poppins(
                      fontSize: 11*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                  decoration: BoxDecoration (
                    color: const Color(0xff353842),
                    borderRadius: BorderRadius.circular(8*fem),
                  ),
                    child: TextField(
                      onChanged: (value) {
                          onWeightChanged(value);
                        },
                        style: const TextStyle(color: Colors.white),      
                        textAlign: TextAlign.justify, 
                        keyboardType: TextInputType.number,                         
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10*fem, 0*fem, 12*fem, 10*fem),
                          prefix: Text('kg  ',
                            style: TextStyle(
                              color: const Color(0xff686f82),
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                            ),
                          ),                 
                          hintText:'55',                             
                          hintStyle: const TextStyle(color: Color(0xff686f82)),
                          border: InputBorder.none,
                          
                        ),
                      ),
                  ),
                ),
                
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 28*fem,
            decoration: BoxDecoration (
              borderRadius: BorderRadius.circular(8*fem),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 39*fem, 0*fem),
                  child: Text(
                    'Current height',
                    style: GoogleFonts.poppins(
                      fontSize: 11*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                  decoration: BoxDecoration (
                    color: const Color(0xff353842),
                    borderRadius: BorderRadius.circular(8*fem),
                  ),
                    child: TextField(
                      onChanged: (value) {
                        onHeightChanged(value);
                        },
                        style: const TextStyle(color: Colors.white),  
                        textAlign: TextAlign.justify,
                        keyboardType: TextInputType.number,                               
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10*fem, 0*fem, 12*fem, 10*fem),                                 
                          prefix: Text('cm  ',
                            style: TextStyle(
                              color: const Color(0xff686f82),
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                            ),
                          ),  
                          hintText:'173',                        
                          hintStyle: const TextStyle(color: Color(0xff686f82)),
                          border: InputBorder.none,
                        ),
                      ),
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
