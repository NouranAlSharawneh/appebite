import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:appebite/Widgets/nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:appebite/Widgets/RecipesList.dart';

class ItalianPage extends StatefulWidget {
  const ItalianPage({Key? key}) : super(key: key);

  @override
  State<ItalianPage> createState() => _ItalianPageState();
}

class _ItalianPageState extends State<ItalianPage> {
  int currentTab = 0;

  @override
  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Positioned(
              top: 87,
              left: 40,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(IconlyLight.arrow_left_2,
                            color: Color(0xffff7269), size: 30),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 107, top: 70),
            child: Container(
              height: 60.61,
              width: 220,
              decoration: BoxDecoration(
                color: const Color.fromARGB(250, 38, 40, 48),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Italian',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 255, 255),
                      height: 2.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const MealsPage(mealType: 'all', cuisineType: 'italian',keywords: 'all'),
          const HomePage(
            index: 0,
          ),
        ],
      ),
    );
  }
}
