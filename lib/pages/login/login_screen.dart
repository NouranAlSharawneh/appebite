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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff272a32),
        body: SingleChildScrollView(
          child: SizedBox(
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
                      hint: 'email address',
                      controller: _emailController,
                    ),
                    InputField(
                      hint: 'password',
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
      ),),),
    );
  }
}
