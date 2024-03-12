import 'dart:io';

import 'package:appebite/pages/loadingScreen/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAbHKBwBBfa_zKCGshx3PBVLYycNhu26Sk', 
      appId: '1:196553709875:android:63aed6d9166bfe6548c646', 
      messagingSenderId: '196553709875', 
      projectId: 'appebite-ad82b')
  ) : await Firebase.initializeApp();
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
