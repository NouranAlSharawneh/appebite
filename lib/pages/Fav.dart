import 'package:appebite/Widgets/nav_bar.dart';
import 'package:appebite/pages/MeSection/favorites.dart';
import 'package:appebite/pages/MeSection/me_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  int currentTab = 0;

  @override
  @mustCallSuper
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 27,
              top: 60,
              right: 32,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(IconlyLight.arrow_left_2),
                      color: const Color(0xffff7269),
                      iconSize: 27,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const UserBar(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 60.61,
                      width: 250,
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
                            'Favorites',
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
                  ],
                )
              ],
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: FavoritePage(),
            ),
          ),
          const HomePage(
            index: 3,
          ),
        ],
      ),
    );
  }
}
