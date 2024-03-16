import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appebite/pages/sign_up/signup_monthly_overview.dart';

class SignUpAccentButton extends StatefulWidget {
  const SignUpAccentButton({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.formKey,
    required this.selectedGender,
    required this.currentWeight,
    required this.currentHeight,
    required this.birthYear,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.profilePicture,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final double fem;
  final double ffem;
  final int birthYear;
  final String currentHeight;
  final String currentWeight;
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final File? profilePicture;
  final String selectedGender;

  @override
  State<SignUpAccentButton> createState() => _SignUpAccentButtonState();
}

class _SignUpAccentButtonState extends State<SignUpAccentButton> {
  bool _isLoading = false;
  bool _genderNotSelected = false;

  @override
  Widget build(BuildContext context) {
    double roundToNearestHundred(double value) {
      return (value / 100).round() * 100;
    }

    int calculateCalories() {
      try {
        int weight = int.parse(widget.currentWeight);
        int height = int.parse(widget.currentHeight);
        int age = DateTime.now().year - widget.birthYear;

        if (widget.selectedGender.toLowerCase() == 'male') {
          double rawCalories =
              (66.5 + (13.8 * weight) + (5 * height) - (6.8 * age)) * 32;
          return roundToNearestHundred(rawCalories).toInt();
        } else if (widget.selectedGender.toLowerCase() == 'female') {
          double rawCalories =
              (655 + (9.6 * weight) + (1.8 * height) - (4.7 * age)) * 32;
          return roundToNearestHundred(rawCalories).toInt();
        } else {
          return 0;
        }
      } catch (e) {
        print('Error calculating calories: $e');
        // Handle the error or provide a default value
        return 60000;
      }
    }

    int caloriesPerMonth = calculateCalories();

    void handleSignUp(BuildContext context) async {
      if (!widget.formKey.currentState!.validate()) {
        return;
      }
      
      if (widget.selectedGender.isEmpty) {
        setState(() {
          _genderNotSelected = true;
        });
        return;
      }

      setState(() {
        _isLoading = true;
      });


      try {
        // Create user using email and password
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.emailController.text,
          password: widget.passwordController.text,
        );

        // Upload profile picture to Firebase Storage
        String profilePictureUrl = '';
        if (widget.profilePicture != null) {
          Reference ref = FirebaseStorage.instance
              .ref()
              .child('profile_pictures')
              .child(userCredential.user!.uid);
          UploadTask uploadTask = ref.putFile(widget.profilePicture!);
          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
          profilePictureUrl = await taskSnapshot.ref.getDownloadURL();
        }

        // Store user data in Firestore
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({
          'email': widget.emailController.text,
          'firstName': widget.firstNameController.text,
          'lastName': widget.lastNameController.text,
          'profilePictureUrl': profilePictureUrl,
          'birthyear': widget.birthYear,
          'gender': widget.selectedGender,
          'height': widget.currentHeight,
          'weight': widget.currentWeight,
          'caloriesPerMonth': caloriesPerMonth,
        });

        // Navigate to the next page after successful sign-up
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SignUpMonthlyOverview(caloriesPerMonth: caloriesPerMonth),
          ),
        );
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

     return Container(
      margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 11.5 * widget.fem, 50 * widget.fem),
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff7269)),
              ),
            )
          : Column(
              children: [
                if (_genderNotSelected) // Display validation message
                  const Text(
                    'Please select a gender',
                    style: TextStyle(color: Colors.red),
                  ),
                TextButton(
                  onPressed: () => handleSignUp(context),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: SizedBox(
                    width: 315 * widget.fem,
                    height: 60 * widget.fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          102.5 * widget.fem, 18 * widget.fem, 104.5 * widget.fem, 18 * widget.fem),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffff7269),
                        borderRadius: BorderRadius.circular(10 * widget.fem),
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 9 * widget.fem, 0 * widget.fem),
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16 * widget.ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * widget.ffem / widget.fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}