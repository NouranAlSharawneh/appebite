import 'package:appebite/pages/login/widgets/login_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topLeft,
        child: TextButton(
          onPressed: () {
            Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FadeTransition(
                opacity: animation,
                child: const LoginResetPassword(),
              ),
            ),
          );
          },
          child: Text('Forgot Password?',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: const Color(0xffe7965b),
          ),
        ),
      ),
      ),
    );
  }
}