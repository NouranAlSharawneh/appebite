import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appebite/pages/settings/settings_edit_information.dart';

class LoginButton extends StatefulWidget {
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
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(
        0,
        screenHeight * 0.01,
        0,
        screenHeight * 0.04,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
                setState(() {
                  isLoading = true;
                });
                final isValid = widget.formKey.currentState!.validate();
                if (isValid) {
                  widget.formKey.currentState!.save();
                  try {
                    // Sign in user with email and password using FirebaseAuth
                    final userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    );
                    // If sign-in is successful, navigate to the desired page
                    if (userCredential.user != null) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration.zero,
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              FadeTransition(
                            opacity: animation,
                            child: const SettingsEditInformation(),
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    // If sign-in fails, show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Failed to Login. Please check your credentials.')),
                    );
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                } else {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.2,
              vertical: screenHeight * 0.02,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromARGB(255, 246, 134, 126); 
            }
            return const Color(0xffff7269);
          }),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login ',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: screenHeight * 0.020,
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
