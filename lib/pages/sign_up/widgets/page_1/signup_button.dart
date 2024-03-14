import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  bool _isLoading = false;

  Future<void> _handleSignUp(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      // Validate form
      if (widget.formKey.currentState!.validate()) {
        // Create user using email and password
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.emailController.text,
          password: widget.passwordController.text,
        );

        // Upload profile picture to Firebase Storage
        String profilePictureUrl = '';
        if (widget.profilePicture != null) {
          Reference ref = FirebaseStorage.instance.ref().child('profile_pictures').child(userCredential.user!.uid);
          UploadTask uploadTask = ref.putFile(widget.profilePicture!);
          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
          profilePictureUrl = await taskSnapshot.ref.getDownloadURL();
        }

        // Store user data in Firestore
        await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set({
          'email': widget.emailController.text,
          'firstName': widget.firstNameController.text,
          'lastName': widget.lastNameController.text,
          'profilePictureUrl': profilePictureUrl, // Store profile picture URL
        });

        // Navigate to the next page after successful sign-up
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPageTwo()),
        );
      }
    } catch (error) {
      print(error);
      // Display error message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign-up failed. ${error.toString()}'),
          duration: const Duration(seconds: 6),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff7269)),
            ), 
          )
        : Container(
            margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 11.5 * widget.fem, 50 * widget.fem),
            child: TextButton(
              onPressed: () => _handleSignUp(context),
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: SizedBox(
                width: 315 * widget.fem,
                height: 60 * widget.fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(102.5 * widget.fem, 18 * widget.fem, 104.5 * widget.fem, 18 * widget.fem),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff353842),
                    borderRadius: BorderRadius.circular(10 * widget.fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 9 * widget.fem, 0 * widget.fem),
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
