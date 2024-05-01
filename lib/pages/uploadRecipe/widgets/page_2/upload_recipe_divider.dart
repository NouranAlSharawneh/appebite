import 'package:flutter/material.dart';

class UploadRecipeDivider extends StatelessWidget {
  const UploadRecipeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 5,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff353841),
        ),
      ),
    );
  }
}
