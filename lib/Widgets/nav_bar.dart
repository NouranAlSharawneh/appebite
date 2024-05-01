// ignore_for_file: must_call_super
import 'package:appebite/app/modules/home/home_view.dart';
import 'package:appebite/pages/DietaryPlan/diets_plans.dart';
import 'package:appebite/pages/MeSection/me_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:appebite/home_main.dart';

class HomePage extends StatefulWidget {
  final int? index;
  const HomePage({Key? key, this.index}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int currentTab;
  late double orangeLineOffset;

  @override
  void initState() {
    super.initState();
    currentTab = widget.index ?? 0;
    orangeLineOffset = calculateOffset(currentTab);
  }

  double calculateOffset(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return 37;
      case 1:
        return 135;
      case 2:
        return 235;
      case 3:
        return 334;
      default:
        return 0;
    }
  }

  void updateOrangeLine(int tabIndex) {
    setState(() {
      currentTab = tabIndex;
      orangeLineOffset = calculateOffset(tabIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 25,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 82.61,
          width: 396,
          decoration: BoxDecoration(
            color: const Color.fromARGB(250, 38, 40, 48),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ThinOrangeLine(leftOffset: orangeLineOffset),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      updateOrangeLine(0);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const HomeMain(),
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
                                        .easeOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Icon(
                      Iconsax.home_2_copy,
                      color: currentTab == 0
                          ? const Color(0xffff7269)
                          : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateOrangeLine(1);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const HomeView(),
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
                                        .easeOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Icon(
                      SolarIconsOutline.chefHat,
                      color: currentTab == 1
                          ? const Color(0xffff7269)
                          : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateOrangeLine(2);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const DietsHomePage(),
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
                                        .easeOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Icon(
                      IconlyLight.bookmark,
                      color: currentTab == 2
                          ? const Color(0xffff7269)
                          : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateOrangeLine(3);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const UserBar(),
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
                                        .easeOut, // Specify the desired easing curve
                                  ),
                                ),
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Icon(
                      IconlyLight.profile,
                      color: currentTab == 3
                          ? const Color(0xffff7269)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThinOrangeLine extends StatelessWidget {
  final double leftOffset;

  const ThinOrangeLine({required this.leftOffset});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Positioned.fill(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: leftOffset),
            Container(
              width: 25,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.5),
                color: const Color(0xffff7269),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
