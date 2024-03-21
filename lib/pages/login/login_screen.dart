import 'package:flutter/material.dart';
import 'package:appebite/pages/login/widgets/login_button.dart';
import 'package:appebite/pages/login/widgets/login_input_fields.dart';
import 'package:appebite/pages/login/widgets/login_title_section.dart';
import 'package:appebite/pages/login/widgets/Login_page_navigator.dart';
import 'package:appebite/pages/login/widgets/login_section_divider.dart';
import 'package:appebite/pages/login/widgets/login_forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff272a32),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.08, 
                screenHeight * 0.05, 
                screenWidth * 0.08, 
                screenHeight * 0.02, 
              ),
              decoration: const BoxDecoration(
                color: Color(0xff272a32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.15, 
                  ),
                  const TitleSection(),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        InputField(
                          hint: 'email address',
                          controller: _emailController,
                        ),
                        InputField(
                          hint: 'password',
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        const ForgetPassword(),
                        LoginButton(
                          formKey: _formKey,
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  const DividerSection(),
                  const Center(child: SignUpSection()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
