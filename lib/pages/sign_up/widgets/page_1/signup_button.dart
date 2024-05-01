import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appebite/pages/sign_up/signup_screen_page_two.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.profilePicture,
  }) : super(key: key);

  final TextEditingController emailController;
  final double fem;
  final double ffem;
  final TextEditingController firstNameController;
  final GlobalKey<FormState> formKey;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final File? profilePicture;

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff7269)),
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: 40 * widget.fem),
            child: TextButton(
              onPressed: () {
                // Validate the form
                if (!widget.formKey.currentState!.validate()) {
                  return;
                }

                if (widget.profilePicture == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please attach an image'),
                    ),
                  );
                  return;
                }

                // If the form is valid, navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPageTwo(
                      emailController: widget.emailController,
                      firstNameController: widget.firstNameController,
                      lastNameController: widget.lastNameController,
                      passwordController: widget.passwordController,
                      profilePicture: widget.profilePicture,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: SizedBox(
                width: 315 * widget.fem,
                height: 60 * widget.fem,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff353842),
                    borderRadius: BorderRadius.circular(10 * widget.fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * widget.fem, 0 * widget.fem, 9 * widget.fem, 0 * widget.fem),
                        child: Text(
                          'Continue ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16 * widget.ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * widget.ffem / widget.fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20 * widget.fem,
                        height: 20 * widget.fem,
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
