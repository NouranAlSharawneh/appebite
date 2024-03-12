import 'package:appebite/pages/sign_up/signup_monthly_overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpAccentButton extends StatelessWidget {
  const SignUpAccentButton({
    super.key,
    required this.fem,
    required this.ffem,
    required this.selectedGender,
    required this.currentWeight,
    required this.currentHeight,
    required this.birthYear,
  });

  final double fem;
  final double ffem;
  final String selectedGender;
  final String currentWeight;
  final String currentHeight;
  final int birthYear;



  @override
  Widget build(BuildContext context) {
    double _roundToNearestHundred(double value) {
  return (value / 100).round() * 100;
}
    int calculateCalories() {
  try {
    int weight = int.parse(currentWeight);
    int height = int.parse(currentHeight);
    int age = DateTime.now().year - birthYear;

    if (selectedGender.toLowerCase() == 'male') {
      double rawCalories = (66.5 + (13.8 * weight) + (5 * height) - (6.8 * age)) * 32;
      return _roundToNearestHundred(rawCalories).toInt();
    } else if (selectedGender.toLowerCase() == 'female') {
      double rawCalories = (655 + (9.6 * weight) + (1.8 * height) - (4.7 * age)) * 32;
      return _roundToNearestHundred(rawCalories).toInt();
    } else {
      return 0;
    }
  } catch (e) {
    print('Error calculating calories: $e');
    // Handle the error or provide a default value
    return 60000;
  }
}


      int caloriesPerMonth = calculateCalories();
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.5*fem, 50*fem),
      child: TextButton(
        onPressed: () {
          print('Selected Gender: $selectedGender');
          print('Current Weight: $currentWeight kg');
          print('Current Height: $currentHeight cm');
          print('Birthyear: $birthYear old');
          print('Calories per month: $caloriesPerMonth');
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpMonthlyOverview(caloriesPerMonth: caloriesPerMonth)), 
            );
        },
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: SizedBox(
          width: 315*fem,
          height: 60*fem,
          child: Container(
            padding: EdgeInsets.fromLTRB(102.5*fem, 18*fem, 104.5*fem, 18*fem),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration (
              color:const Color(0xffff7269),
              borderRadius: BorderRadius.circular(10*fem),
            ),
            child: 
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                  child: Text(
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16*ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5*ffem/fem,
                      color:const Color(0xffffffff),
                    ),
                  ),
                ),
                
          ),
        ),
      ),
    );
  }
}
