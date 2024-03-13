import 'package:appebite/pages/sign_up/signup_screen_page_two.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final double fem;
  final double ffem;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;

  Future<void> _handleSignUp(BuildContext context) async {
    try {
      // Validate form
      if (formKey.currentState!.validate()) {
        // Create user using email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Navigate to the next page after successful sign-up
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPageTwo()),
        );
      }
    } catch (error) {
      // Display error message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign-up failed. ${error.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11.5 * fem, 50 * fem),
      child: TextButton(
        onPressed: () => _handleSignUp(context), 
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: SizedBox(
          width: 315 * fem,
          height: 60 * fem,
          child: Container(
            padding: EdgeInsets.fromLTRB(102.5 * fem, 18 * fem, 104.5 * fem, 18 * fem),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff353842),
              borderRadius: BorderRadius.circular(10 * fem),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 0 * fem),
                  child: Text(
                    'Continue ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20 * fem,
                  height: 20 * fem,
                  child: const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
