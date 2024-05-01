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
    required this.termsAndConditionsChecked,
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
  final bool termsAndConditionsChecked;

  @override
  State<SignUpAccentButton> createState() => _SignUpAccentButtonState();
}

class _SignUpAccentButtonState extends State<SignUpAccentButton> {
  bool _isLoading = false;

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
        return 60000;
      }
    }

    int caloriesPerMonth = calculateCalories();

  Future<void> handleSignUp(BuildContext context) async {
    if (!widget.formKey.currentState!.validate()) {
      return;
    }

    if (widget.birthYear == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your birth year.'),
        ),
      );
      return;
    }

    if (widget.selectedGender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a gender'),
        ),
      );
      return;
    }

    if (!widget.termsAndConditionsChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept terms and conditions.'),
        ),
      );
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
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(
            opacity: animation,
            child: SignUpMonthlyOverview(caloriesPerMonth: caloriesPerMonth),
          ),
        ),
      );
    } catch (error) {
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
      margin: EdgeInsets.only(bottom: 20 * widget.fem, top: 10 * widget.fem),
      child: TextButton(
        onPressed: _isLoading ? null : () => handleSignUp(context),
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: SizedBox(
          width: 315 * widget.fem,
          height: 60 * widget.fem,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isLoading ? const Color.fromARGB(255, 246, 134, 126) : const Color(0xffff7269),
              borderRadius: BorderRadius.circular(10 * widget.fem),
            ),
            child: Text(
              'Sign up',
              style: GoogleFonts.poppins(
                fontSize: 16 * widget.ffem,
                fontWeight: FontWeight.w600,
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
