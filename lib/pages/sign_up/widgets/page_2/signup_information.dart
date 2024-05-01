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
      margin: EdgeInsets.fromLTRB(0 * fem, 30 * fem, 0 * fem, 15 * fem),
      width: 270 * fem,
      // height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8 * fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Current weight',
                style: GoogleFonts.poppins(
                  fontSize: 11 * ffem,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffffffff),
                ),
              ),
              const SizedBox(width: 15,),
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    prefix: Text(
                      'kg  ',
                      style: TextStyle(
                        color: const Color(0xff686f82),
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    hintText: '55',
                    hintStyle: const TextStyle(color: Color(0xff686f82)),
                    filled: true,
                    fillColor: const Color.fromRGBO(55, 56, 66, 1),
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
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Current height',
                style: GoogleFonts.poppins(
                  fontSize: 11 * ffem,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffffffff),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    onHeightChanged(value);
                  },                  
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.justify,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),                    
                    prefix: Text(
                      'cm  ',
                      style: TextStyle(
                        color: const Color(0xff686f82),
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
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
            ],
          ),
        ],
      ),
    );
  }
}
