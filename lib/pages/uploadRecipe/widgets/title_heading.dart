import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

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

  void _showDialog(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      backgroundColor: const Color(0xff272a32),
      title: 'Are you sure',
      titleColor: Colors.white,
      text: "Are you sure you want to cancel\n, changes will not be saved? \n",
      textColor: const Color(0xff686f82),
      confirmBtnColor: const Color(0xffff7269),
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      onCancelBtnTap: () => Navigator.pop(context),
      onConfirmBtnTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              //TODO: FIX THE NAVIGATION
              // child: const LoginPage(),
            ),
          ),
        );
      }
    );
  }

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
              _showDialog(context);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                fontSize: 17 * ffem,
                fontWeight: FontWeight.w700,
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
