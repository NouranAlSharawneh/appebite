import 'package:appebite/pages/loadingScreen/loading_screen.dart';
// import 'package:appebite/pages/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
