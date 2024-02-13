// Noran, Progress: UI DONE, FUNCTIONALITY TO BE ADDED 
import 'package:appebite/pages/login/widgets/divider_section.dart';
import 'package:appebite/pages/login/widgets/forget_password.dart';
import 'package:appebite/pages/login/widgets/input_field.dart';
import 'package:appebite/pages/login/widgets/login_button.dart';
import 'package:appebite/pages/login/widgets/signup_section.dart';
import 'package:appebite/pages/login/widgets/title_section.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _buildLoginScreen(context),
      ),
    );
  }

  Widget _buildLoginScreen(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.fromLTRB(36, 14, 36, 8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff272a32),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            TitleSection(),
            InputField(label: 'Email', hint: 'Enter email'),
            InputField(label: 'Enter password', hint: 'Enter password', isPassword: true),
            ForgetPassword(),
            LoginButton(),
            DividerSection(),
            Center(child: SignUpSection()),
          ],
        ),
      ),
    );
  }
}
