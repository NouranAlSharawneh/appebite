import 'package:flutter/material.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 12.5, 40.5),
      width: 322,
      height: 0.5,
      decoration: const BoxDecoration(
        color: Color(0xff686f82),
      ),
    );
  }
}