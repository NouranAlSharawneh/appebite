import 'package:appebite/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

class LoginResetPassword extends StatefulWidget {
  const LoginResetPassword({Key? key}) : super(key: key);

  @override
  State<LoginResetPassword> createState() => _LoginResetPasswordState();
}

class _LoginResetPasswordState extends State<LoginResetPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    void showSuccessDialog(BuildContext context) {
       QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        backgroundColor: const Color(0xff272a32),
        title: 'Password Reset Successful!',
        titleColor: Colors.white,
        text: "\nA password reset link has been \nsent to your email. \n*check your spam*",
        textColor: const Color(0xff686f82),
        confirmBtnColor: const Color(0xffff7269),
        confirmBtnText: 'okay',
        onConfirmBtnTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FadeTransition(
                opacity: animation,
                child: const LoginPage(),
              ),
            ),
          );
        }
      );
    }

    void resetPassword() async {
      // Check if email is empty
      if (emailController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter your email address'),
          ),
        );
        return;
      }

      try {
        await _auth.sendPasswordResetEmail(email: emailController.text);
        // Show success dialog
        showSuccessDialog(context);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to reset password: $error'),
          ),
        );
      }
    }


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff272a32),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          FadeTransition(
                        opacity: animation,
                        child: const LoginPage(),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: screenWidth * 0.08,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    0.0, screenHeight * 0.05, 0.0, screenHeight * 0.02),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Reset\nPassword',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: screenWidth * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' ?',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.1,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffff7269),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: screenHeight * 0.03),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Enter the email address associated with your account.',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff686f82),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff353842),
                        labelText: 'email address',
                        hintStyle: const TextStyle(
                          color: Color(0xff686f82),
                          height: 1,
                        ),
                        labelStyle:
                        const TextStyle(color: Color(0xff686f82)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                            color: Color(0xff686f82),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(
                            color: Color(0xff686f82),
                          ),
                        ),
                        errorStyle: const TextStyle(
                          color: Color(0xffff7269),
                          fontSize: 12.0,
                          height: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    ElevatedButton(
                      onPressed: resetPassword,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                        backgroundColor: const Color(0xffff7269),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Reset password ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: screenHeight * 0.020,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
