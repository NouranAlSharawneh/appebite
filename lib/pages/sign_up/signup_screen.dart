import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_divider.dart';
import 'package:appebite/pages/sign_up/widgets/page_1/signup_button.dart';
import 'package:appebite/pages/sign_up/widgets/page_1/signup_form.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_navigator.dart';
import 'package:appebite/pages/sign_up/widgets/common/signup_title.dart';
import 'package:appebite/pages/sign_up/widgets/page_1/signup_profile_picture.dart';



class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  File? _image;

   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
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
        child: Container(
          margin: EdgeInsets.fromLTRB(36*fem,50*fem,36*fem,0*fem),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignUpTitle(fem: fem, ffem: ffem),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      SignUpForm(
                        fem: fem,
                        ffem: ffem,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        firstNameController: _firstnameController,
                        lastNameController: _lastnameController,
                      ),
                      SignUpProfilePicture(
                        fem: fem, 
                        ffem: ffem,
                        onImageSelected: (File? image) {
                          setState(() {
                            _image = image;
                          });
                        },                  
                        ),
                      SignUpButton(
                        fem: fem,
                        ffem: ffem,
                        formKey: formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        firstNameController: _firstnameController,
                        lastNameController: _lastnameController,
                        profilePicture: _image,
                      ),
                    ],
                  ),
                ),
                SignUpDivider(fem: fem),
                SignUpNavigator(fem: fem, ffem: ffem),
              ],
            ),
          ),
        ),
      ),
    );
  }
}