import 'package:flutter/material.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_divider.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_accent_button.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_birthyear.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_information.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_gender.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_navigator.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_personal_information.dart';
import 'package:appebite/pages/sign_up/widgets/page_2/signup_terms_and_conditions.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_title.dart';

class SignUpPageTwo extends StatefulWidget {
  SignUpPageTwo({Key? key}) : super(key: key);
  String selectedGender = '';

  @override
State<SignUpPageTwo> createState() => _SignUpPageTwoState();
}

class _SignUpPageTwoState extends State<SignUpPageTwo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.fromLTRB(34 * fem, 14 * fem, 22.5 * fem, 8 * fem),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff272a32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                          widget.selectedGender = gender;
                        });
                      },
                    ),
                    SignUpInformation(fem: fem, ffem: ffem),
                    SignUpBirthYear(fem: fem, ffem: ffem, ),
                    SignUpTermsAndConditions(fem: fem, ffem: ffem),
                    SignUpAccentButton(fem: fem, ffem: ffem, selectedGender: widget.selectedGender),
                  ],
                ),
              ),
              SignUpDivider(fem: fem),
              SignUpNavigator(fem: fem, ffem: ffem),
            ],
          ),
        ),
      ),
    );
  }
}
