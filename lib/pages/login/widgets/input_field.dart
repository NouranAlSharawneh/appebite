import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
  });

  final String hint;
  final bool isPassword;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 45),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff353842),
              borderRadius: BorderRadius.circular(10),
            ),
            child: isPassword
                ? SizedBox(
                  height: 45,
                  child: TextField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: const TextStyle(color: Color(0xff686f82)),                   
                        border: InputBorder.none,
                      ),
                    ),
                )
                : SizedBox(
                  height: 45,
                  child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: const TextStyle(color: Color(0xff686f82)),
                        border: InputBorder.none,
                      ),
                      
                    ),
                ),
          ),
        ],
      ),
    );
  }
}