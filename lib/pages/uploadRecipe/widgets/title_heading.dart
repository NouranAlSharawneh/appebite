import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHeading extends StatelessWidget {
  const TitleHeading({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.dynamicValue,
  }) : super(key: key);

  final String dynamicValue;
  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10 * fem,),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              if (Platform.isIOS) {
                // iOS specific dialog
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text("Confirmation"),
                      content: const Text("Are you sure you want to cancel?"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text("No"),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            // Redirect to the home page
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Android and other platforms
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirmation"),
                      content: const Text("Are you sure you want to cancel?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                fontSize: 17 * ffem,
                fontWeight: FontWeight.w700,
                height: 2 * ffem / fem,
                letterSpacing: 0.5 * fem,
                color: const Color(0xffff6363),
              ),
            ),
          ),
          const Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 17 * ffem,
                fontWeight: FontWeight.w700,
                color: const Color(0xff3d5480),
              ),
              children: [
                TextSpan(
                  text: '$dynamicValue/',
                  style: GoogleFonts.poppins(
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5 * fem,
                    color: const Color(0xff686e81),
                  ),
                ),
                TextSpan(
                  text: '2',
                  style: GoogleFonts.poppins(
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
