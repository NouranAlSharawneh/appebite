// noran - loading page/ status: under progress
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(38, 42, 52, 1),
        ),
        child: Column(
          children: [
            Text('Login page',
            style: Theme.of(context).textTheme.titleLarge,
            )
          ]
        ),
      ),
    );
  }
}