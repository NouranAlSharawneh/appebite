import 'package:appebite/Widgets/Upload.dart';
import 'package:appebite/Widgets/cuisines.dart';
import 'package:appebite/Widgets/nav_bar.dart';
import 'package:appebite/Widgets/search_bar.dart';
import 'package:appebite/breakfast_page.dart';
import 'package:appebite/dinner_page.dart';
import 'package:appebite/launch_page.dart';
import 'package:flutter/material.dart';


class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff272a32),
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Color(0xff272a32),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 36, top: 33, right: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Positioned(
                            child: Image(
                              image: AssetImage(
                                  'assets/Avatar.png'),
                              fit: BoxFit.fitWidth,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'What are you craving today?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 142, 148, 164),
                              height: 0.3,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      SearchBar1(),
                     SizedBox(height: 15),
                       Row(
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Categories(),
                       SizedBox(height: 15),
                       Row(
                        children: [
                          Text(
                            'Cuisines',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 8),
                       Cuisines(),
                      SizedBox(height: 15),
                       Row(
                        children: [
                          Text(
                            'Upload your recipe',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                       Upload(),
                     
                    ],
                  ),
                ),
              ),
            ),
          ),
          HomePage(
            index: 0,
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          
          child: GestureDetector(
          onTap: () {
               Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const BreakfastPage(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              return FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0.0,
                                  end: 500.0,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves
                                        .easeInOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ));
          },     
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 56, 66),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🥐 ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 142, 148, 164),
                      height: 1,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Breakfast',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 142, 148, 164),
                      height: 2.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
       const SizedBox(width: 3),
        Expanded(
          child: GestureDetector(
          onTap: () {
               Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const LaunchPage(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              return FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0.0,
                                  end: 500.0,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves
                                        .easeInOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ));
          },     
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 56, 66),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🥘 ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 142, 148, 164),
                      height: 1,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Launch',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 142, 148, 164),
                      height: 2.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 3),
        Expanded(
          child: GestureDetector(
          onTap: () {
               Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const DinnerPage(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              return FadeTransition(
                                opacity: Tween<double>(
                                  begin: 0.0,
                                  end: 500.0,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves
                                        .easeInOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ));
          },     
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 56, 66),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🍝 ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 142, 148, 164),
                      height: 1,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Dinner',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 142, 148, 164),
                      height: 2.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
