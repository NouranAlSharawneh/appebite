import 'package:flutter/material.dart';
import 'package:appebite/indian_page.dart';
import 'dart:ui';

import 'package:appebite/italian_page.dart';

class Cuisines extends StatefulWidget {
  const Cuisines({super.key});

  @override
  State<Cuisines> createState() => _CuisinesState();
}

Widget _buildCuisineBox(String cuisineType, String backgroundImage) {
  return Stack(
    children: [
      Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.only(left: 50, right: 50, top: 106),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: 100,
          height: 100, // Set height for the container
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),

          alignment: Alignment.bottomCenter, // Align content to the bottom
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: 140,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black12, Colors.black12]),
                  // Transparent color
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1, color: Colors.black12, style: BorderStyle.none),
                ),
                child: Transform.scale(
                  scale: 1.1,
                  child: Text(
                    cuisineType,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 255, 255),
                      height: 2.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class _CuisinesState extends State<Cuisines> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
             onTap: () {
          Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const ItalianPage(),
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
            child: _buildCuisineBox(
                'Italian', 'assets/italian.JPG'),
          ), // Adjust the image path
          const SizedBox(width: 10),
          GestureDetector(
                onTap: () {
          Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const IndianPage(),
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
            child: _buildCuisineBox(
                'Indian', 'assets/indian.JPG'),
          ), // Adjust the image path
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
