import 'package:flutter/material.dart';


class MOChart extends StatefulWidget {
  const MOChart({super.key, required this.fem,});
  final double fem;
  @override
  State<MOChart> createState() => _MOChartState();
}

class _MOChartState extends State<MOChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*widget.fem, 0*widget.fem, 15*widget.fem, 37*widget.fem),
      child:Image.asset(
                'assets/images/monthly_overview.png',
                width: 264*widget.fem,
                height: 350*widget.fem,
              ),             
    );
  }
}