import 'package:appebite/pages/sign_up/widgets/common/signup_divider.dart';
import 'package:appebite/pages/sign_up/widgets/page_1/signup_button.dart';
import 'package:appebite/pages/sign_up/widgets/page_1/signup_form.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_navigator.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_title.dart';
import 'package:flutter/material.dart';

// TOD0: CHANGE TO A STATEFUL 
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 391;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor:const Color(0xff272a32) ,
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
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  SignUpForm(fem: fem, ffem: ffem),
                  SignUpButton(fem: fem, ffem: ffem, formKey: _formKey),
                ],
              ),
            ),
            SignUpDivider(fem: fem),
            SignUpNavigator(fem: fem, ffem: ffem),
          ],
        ),
      ),
    )
    );
  }
}

