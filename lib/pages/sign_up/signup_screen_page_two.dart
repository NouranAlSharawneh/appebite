import 'package:appebite/pages/sign_up/widgets/signup_accent_button.dart';
import 'package:appebite/pages/sign_up/widgets/signup_birthyear.dart';
import 'package:appebite/pages/sign_up/widgets/signup_divider.dart';
import 'package:appebite/pages/sign_up/widgets/signup_gender.dart';
import 'package:appebite/pages/sign_up/widgets/signup_information.dart';
import 'package:appebite/pages/sign_up/widgets/signup_navigator.dart';
import 'package:appebite/pages/sign_up/widgets/signup_personal_information.dart';
import 'package:appebite/pages/sign_up/widgets/signup_terms_and_conditions.dart';
import 'package:appebite/pages/sign_up/widgets/signup_title.dart';
import 'package:flutter/material.dart';

class SignUpPageTwo extends StatelessWidget {
  const SignUpPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(34*fem, 14*fem, 22.5*fem, 8*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xff272a32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignUpTitle(fem: fem, ffem: ffem),
            SignUpPersonalInformation(fem: fem, ffem: ffem),
            SignUpGender(fem: fem, ffem: ffem),
            SignUpInformation(fem: fem, ffem: ffem),
            SignUpBirthYear(fem: fem, ffem: ffem),
            SignUpTermsAndConditions(fem: fem, ffem: ffem),
            SignUpAccentButton(fem: fem, ffem: ffem),
            SignUpDivider(fem: fem),
            SignUpNavigator(fem: fem, ffem: ffem),
          ],
        ),
      ),
    )
    );
  }
}




