import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpTermsAndConditions extends StatefulWidget {
  const SignUpTermsAndConditions({
    super.key,
    required this.fem,
    required this.ffem,
    required this.isChecked,
    required this.updateIsChecked,
  });

  final double fem;
  final double ffem;
  final bool isChecked;
  final Function(bool) updateIsChecked;

  @override
  State<SignUpTermsAndConditions> createState() => _SignUpTermsAndConditionsState();
}

class _SignUpTermsAndConditionsState extends State<SignUpTermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:15*widget.fem),
      child: Row(
        children: [
          SizedBox(
            width: 35,
            child: Checkbox.adaptive(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.updateIsChecked(value ?? false);
                });
              },
              activeColor: const Color(0xffe7965b),
            ),
          ),
          Text(
            'Accept terms & Condition',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12 * widget.ffem,
              fontWeight: FontWeight.w400,
              color: const Color(0xffe7965b),
            ),
          ),
        ],
      ),
    );
  }
}
