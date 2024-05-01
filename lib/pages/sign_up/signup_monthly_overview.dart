import 'package:flutter/material.dart';
import 'package:appebite/pages/sign_up/widgets/monthly_overview/mo_title.dart';
import 'package:appebite/pages/sign_up/widgets/monthly_overview/mo_chart.dart';
import 'package:appebite/pages/sign_up/widgets/monthly_overview/mo_calories_tracker.dart';

class SignUpMonthlyOverview extends StatelessWidget {
  const SignUpMonthlyOverview({super.key, required this.caloriesPerMonth});

  final int caloriesPerMonth;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor:const Color(0xff272a32),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(36*fem, 90*fem, 36*fem, 0*fem),
              width: double.infinity,
              decoration: const BoxDecoration (
                color: Color(0xff272a32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MOTitle(fem: fem, ffem: ffem),
                  MOChart(fem: fem),
                  MOCalories(
                    fem: fem, 
                    ffem: ffem,
                    initialCaloriesValue: caloriesPerMonth,
                  ),
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}









