import 'package:appebite/pages/login/widgets/divider_section.dart';
import 'package:appebite/pages/login/widgets/forget_password.dart';
import 'package:appebite/pages/login/widgets/input_field.dart';
import 'package:appebite/pages/login/widgets/login_button.dart';
import 'package:appebite/pages/login/widgets/signup_section.dart';
import 'package:appebite/pages/login/widgets/title_section.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _buildLoginScreen(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.fromLTRB(36, 14, 36, 8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff272a32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 150,
            ),
            const TitleSection(),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  InputField(
                    label: 'Email',
                    hint: 'Enter email',
                    controller: _emailController,
                  ),
                  InputField(
                    label: 'Enter password',
                    hint: 'Enter password',
                    controller: _passwordController,
                    isPassword: true,                   
                  ),
                  const ForgetPassword(),
                  LoginButton(formKey: _formKey, emailController: _emailController, passwordController: _passwordController,),
                ],
              ),
            ),
            const DividerSection(),
            const Center(child: SignUpSection()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: SingleChildScrollView(
        child: _buildLoginScreen(context),
      ),
    );
  }
}
