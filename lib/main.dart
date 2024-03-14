// import 'dart:io';
import 'package:appebite/firebase_options.dart';
import 'package:appebite/pages/loadingScreen/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    // Platform.isAndroid
    //     ? await Firebase.initializeApp(
    //       name: 'appebite-ad82b',
    //         options: const FirebaseOptions(
    //           apiKey: 'AIzaSyAbHKBwBBfa_zKCGshx3PBVLYycNhu26Sk', 
    //           appId: '1:196553709875:android:63aed6d9166bfe6548c646', 
    //           messagingSenderId: '196553709875', 
    //           projectId: 'appebite-ad82b',
    //           // storageBucket: 'gs://appebite-ad82b.appspot.com',
    //         ),
    //       )
    //     : await Firebase.initializeApp();

    runApp(const MyApp());
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle initialization error
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
