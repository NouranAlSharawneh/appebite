import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookingDuration extends StatefulWidget {
  const CookingDuration({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<CookingDuration> createState() => _CookingDurationState();
}

class _CookingDurationState extends State<CookingDuration> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8 * widget.fem, 0 * widget.fem, 5.5 * widget.fem, 31 * widget.fem),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32 * widget.fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 22 * widget.fem),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 17 * widget.ffem,
                  fontWeight: FontWeight.w700,
                  height: 1 * widget.ffem / widget.fem,
                  color: const Color(0xff3d5480),
                ),
                children: [
                  TextSpan(
                    text: 'Cooking ',
                    style: GoogleFonts.poppins(
                      fontSize: 17 * widget.ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * widget.ffem / widget.fem,
                      letterSpacing: 0.5 * widget.fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                  TextSpan(
                    text: 'Duration',
                    style: GoogleFonts.poppins(
                      fontSize: 17 * widget.ffem,
                      fontWeight: FontWeight.w700,
                      height: 1 * widget.ffem / widget.fem,
                      letterSpacing: 0.5 * widget.fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                    text: '(in minutes)',
                    style: GoogleFonts.poppins(
                      fontSize: 12 * widget.ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2125 * widget.ffem / widget.fem,
                      letterSpacing: 0.5 * widget.fem,
                      color: const Color(0xff686f82),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32 * widget.fem),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '<10',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        letterSpacing: 0.5,
                        color: const Color(0xffff7269),
                      ),
                    ),
                    Text(
                      '30',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        letterSpacing: 0.5,
                        color: const Color(0xffff7269),
                      ),
                    ),
                    Text(
                      '60>',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        letterSpacing: 0.5,
                        color: const Color(0xff686e81),
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 60,
                  divisions: null,
                  inactiveColor: const Color(0xff686e81),
                  activeColor: const Color(0xffff7269),
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double val) {
                    setState(() {
                      _currentSliderValue = val;
                      widget.onChanged(val);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
