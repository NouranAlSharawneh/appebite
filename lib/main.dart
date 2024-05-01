// import 'package:appebite/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:appebite/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appebite/pages/loadingScreen/loading_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize Firebase asynchronously
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Firebase initialization in progress, show loading indicator
          return const GetMaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // Firebase initialization failed, show error message
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text(
                  'Error initializing Firebase: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        } else {
          // Firebase initialized successfully, proceed with the app
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              textTheme: GoogleFonts.poppinsTextTheme(),
              useMaterial3: true,
            ),
            home: const LoadingScreen(),
          );
        }
      },
    );
  }
}
