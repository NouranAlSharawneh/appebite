import 'package:flutter/material.dart';

class SignUpDivider extends StatelessWidget {
  const SignUpDivider({
    super.key,
    required this.fem,
  });

  final double fem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20*fem),
      width: 322*fem,
      height: 0.5*fem,
      decoration: const BoxDecoration (
        color: Color(0xff686f82),
      ),
    );
  }
}
