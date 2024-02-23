import 'package:appebite/pages/uploadRecipe/widgets/page_1/add_image.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/continue_button.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/cooking_duration.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/description_input.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/food_name_input.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_1/servings_and_calories_input.dart';
import 'package:appebite/pages/uploadRecipe/widgets/title_heading.dart';
import 'package:flutter/material.dart';

class UploadRecipe extends StatelessWidget {
  const UploadRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor:const Color(0xff272a32) ,
      body: SingleChildScrollView(
      child: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(34*fem, 34*fem, 22.5*fem, 8*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xff272a32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleHeading(fem: fem, ffem: ffem, dynamicValue: '1',),
            AddImage(fem: fem, ffem: ffem),
            FoodInput(fem: fem, ffem: ffem),
            DescriptionInput(fem: fem, ffem: ffem),
            CookingDuration(fem: fem, ffem: ffem),
            const ServingsAndCaloriesInput(text1: 'Servings', text2: 'Calories'),
            ContinueButton(fem: fem, ffem: ffem),
          ],
    )
      ))
    ));
  }
}

