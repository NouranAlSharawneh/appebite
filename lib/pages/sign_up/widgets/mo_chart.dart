import 'package:flutter/material.dart';

class MOChart extends StatelessWidget {
  const MOChart({
    super.key,
    required this.fem,
  });

  final double fem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 37*fem),
      // width: 264*fem,
      // height: 250*fem,
      child: const Icon(Icons.circle, size: 350, color: Color(0xffff7269),)             
    );
  }
}