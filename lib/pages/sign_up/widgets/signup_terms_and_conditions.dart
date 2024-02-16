import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpTermsAndConditions extends StatefulWidget {
  const SignUpTermsAndConditions({
    Key? key,
    required this.fem,
    required this.ffem,
  }) : super(key: key);

  final double fem;
  final double ffem;

  @override
  // ignore: library_private_types_in_public_api
  _SignUpTermsAndConditionsState createState() => _SignUpTermsAndConditionsState();
}

class _SignUpTermsAndConditionsState extends State<SignUpTermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 0 * widget.fem, 16.5 * widget.fem, 25 * widget.fem),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15 * widget.fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 5 * widget.fem, 0 * widget.fem),
            child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
              activeColor: const Color(0xffe7965b),
            ),
          ),
          Center(
            child: Text(
              'Accept terms & Condition',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 11 * widget.ffem,
                fontWeight: FontWeight.w400,
                height: 1.5 * widget.ffem / widget.fem,
                color: const Color(0xffe7965b),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
