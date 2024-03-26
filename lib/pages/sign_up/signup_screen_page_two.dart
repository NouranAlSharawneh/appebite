import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_title.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_gender.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_divider.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_navigator.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_birthyear.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_information.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_accent_button.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_personal_information.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_terms_and_conditions.dart';

class SignUpPageTwo extends StatefulWidget {
  const SignUpPageTwo({
    Key? key,
    required this.emailController,
    required this.firstNameController,
    required this.lastNameController,
    required this.profilePicture, 
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final File? profilePicture;

  @override
  State<StatefulWidget> createState() => _SignUpPageTwoState();
}

class _SignUpPageTwoState extends State<SignUpPageTwo> {
  int birthYear = 0;
  String currentHeight = '';
  String currentWeight = ''; 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String selectedGender = '';
  bool isChecked = false; 


  void updateIsChecked(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
Widget build(BuildContext context) {
  double baseWidth = 391;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;

  return Scaffold(
    backgroundColor: const Color(0xff272a32),
    resizeToAvoidBottomInset: false,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
                    margin: EdgeInsets.fromLTRB(36*fem,50*fem,36*fem,0*fem),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignUpTitle(fem: fem, ffem: ffem),
              SignUpPersonalInformation(fem: fem, ffem: ffem),
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    SignUpGender(
                      fem: fem,
                      ffem: ffem,
                      onGenderSelected: (String gender) {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    ),
                    SignUpInformation(
                      fem: fem,
                      ffem: ffem,
                      onWeightChanged: (value) {
                        setState(() {
                          currentWeight = value;
                        });
                      },
                      onHeightChanged: (value) {
                        setState(() {
                          currentHeight = value;
                        });
                      },
                    ),
                    SignUpBirthYear(
                      fem: fem,
                      ffem: ffem,
                      onBirthYearChanged: (value) {
                        setState(() {
                          birthYear = value;
                        });
                      },
                    ),
                    const SizedBox(height: 15,),
                    SignUpTermsAndConditions(
                      fem: fem, 
                      ffem: ffem,
                      isChecked: isChecked,
                      updateIsChecked: updateIsChecked,
                      ),
                    SignUpAccentButton(
                      fem: fem,
                      ffem: ffem,
                      formKey: formKey,
                      selectedGender: selectedGender,
                      currentWeight: currentWeight,
                      currentHeight: currentHeight,
                      birthYear: birthYear,
                      termsAndConditionsChecked: isChecked,
                      emailController: widget.emailController,
                      firstNameController: widget.firstNameController,
                      lastNameController: widget.lastNameController,
                      passwordController: widget.passwordController,
                      profilePicture: widget.profilePicture,
                    ),
                  ],
                ),
              ),
              Center(child: SignUpDivider(fem: fem)),
              Center(child: SignUpNavigator(fem: fem, ffem: ffem)),
            ],
          ),
        ),
      ),
    ),
  );
}
}