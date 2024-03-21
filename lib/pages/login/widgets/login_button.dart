import 'package:flutter/material.dart';
import 'package:appebite/pages/settings/settings_edit_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart'; 

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 45),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();
            try {
              // Sign in user with email and password using FirebaseAuth
              final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
              // If sign-in is successful, navigate to the desired page
              if (userCredential.user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsEditInformation()), 
                );
              }
            } catch (e) {
              // If sign-in fails, show an error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to sign in. Please check your credentials.')),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 126, vertical: 18),
          backgroundColor: const Color(0xffff7269),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login ',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: const Color(0xffffffff),
              ),
            ),
            const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
