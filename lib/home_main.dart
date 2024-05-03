import 'package:appebite/Widgets/Upload.dart';
import 'package:appebite/Widgets/cuisines.dart';
import 'package:appebite/Widgets/nav_bar.dart';
import 'package:appebite/Widgets/search_bar.dart';
import 'package:appebite/breakfast_page.dart';
import 'package:appebite/dinner_page.dart';
import 'package:appebite/launch_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int currentTab = 0;
  late String _profilePictureUrl = '';
  late String _firstName = '';
  late String _lastName = '';

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get();

      setState(() {
        _firstName = userInfo['firstName'];
        _lastName = userInfo['lastName'];
        _profilePictureUrl = userInfo['profilePictureUrl'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff272a32),
      body: Stack(
        children: <Widget>[
          SafeArea(
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
                          _firstName.isEmpty || _lastName.isEmpty
                              ? 'Username'
                              : '$_firstName $_lastName,',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Positioned(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _profilePictureUrl,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  // Image has finished loading
                                  return child;
                                } else {
                                  // Image is still loading, show a grey box as a placeholder
                                  return Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.grey,
                                  );
                                }
                              },
                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                // Error occurred while loading image, show a placeholder with an error icon
                                return Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.grey,
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
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
                    const SizedBox(height: 15),
                    const Row(
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
                    const SizedBox(height: 10),
                    const Categories(),
                    const SizedBox(height: 15),
                    const Row(
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
                    const SizedBox(height: 8),
                    const Cuisines(),
                    const SizedBox(height: 15),
                    const Row(
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
                    const SizedBox(height: 10),
                    const Upload(),
                    Container(margin: const EdgeInsets.only(bottom: 130),)
                  ],
                ),
              ),
            ),
          ),
          const HomePage(
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
