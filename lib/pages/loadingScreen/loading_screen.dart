import 'package:appebite/app/modules/home/home_view.dart';
import 'package:appebite/home_main.dart';
import 'package:appebite/pages/DietaryPlan/diets_plans.dart';
import 'package:appebite/pages/MeSection/BMI_status.dart';
import 'package:appebite/pages/MeSection/me_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase authentication
import 'package:appebite/pages/login/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      checkAuthState();
    });
  }

  Future<void> checkAuthState() async {
    // Check if user is already authenticated
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // If user is authenticated, navigate to home screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const UserBar (),
      ));
    } else {
      // If user is not authenticated, navigate to login screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ));
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 153, 0, 0),
              child: Image.asset(
                'assets/images/logo.png', 
                width: 441, 
                height: 419,
              ),
            ),
            Text(
              'Appebite',
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
