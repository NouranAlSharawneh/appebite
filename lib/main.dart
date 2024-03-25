import 'package:appebite/pages/loadingScreen/loading_screen.dart';
import 'package:appebite/pages/MeSection/me_page.dart';
import 'package:flutter/material.dart';
import 'package:appebite/pages/DietaryPlan/diets_plans.dart' ;
import 'package:appebite/pages/MeSection/me_page.dart';
import 'package:appebite/pages/MeSection/BMI_status.dart';
import 'package:appebite/pages/MeSection/favorites.dart';
import 'package:appebite/modules/recipe.api.dart';
import 'package:appebite/pages/MeSection/home.dart';
import 'package:appebite/pages/DietaryPlan/recipe_card.dart';

//  import 'package:flutter/material.dart';
// import 'package:appebite/pages/MeSection/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Food recipe',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         primaryColor: Colors.white,
//         textTheme: const TextTheme(
//           bodyMedium: TextStyle(color: Colors.white),
//         ),
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// final String title;
//   final String rating;
//   final String cookTime;
//   final String thumbnailUrl;
//   final String calories;
//   final int? servings; 
void main() {
  runApp( MaterialApp(
    theme:ThemeData(scaffoldBackgroundColor: const Color.fromRGBO(38, 43, 52, 1)),
    home: const Scaffold(body:HomePage())
    //body:BMIProgressScreen( bmiValue:30.0)
  ),
  
  );
}
// void main() {
//   runApp(MaterialApp(
//     home: RecipeScreen(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         textTheme: const TextTheme(
//           titleLarge: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 40,
//             color: Colors.white,
//             fontWeight: FontWeight.w100,
//           ),
//         ),
//       ),
//       home: const LoadingScreen(),
      
//     );
//   }
// }