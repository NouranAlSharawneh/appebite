import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:appebite/breakfast_page.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.only(
                  top: 70, bottom: 70, left: 70, right: 70),
              decoration: BoxDecoration(
                color: const  Color(0xff272a32),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 4),
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.72),
                inset: true,

              ),
                BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 4),
              ),
             
            ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>  const BreakfastPage(),
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
                    child: Transform.scale(
                       scale: 2.4, 
                      child: const Icon(
                        OctIcons.plus_16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    
           
          ],
        ));
  }
}
