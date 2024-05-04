import 'package:appebite/Widgets/cardDisplay.dart';
import 'package:appebite/pages/uploadRecipe/upload_recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  late User? _user;
  late CollectionReference _recipesCollection;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _recipesCollection = FirebaseFirestore.instance
        .collection('Users')
        .doc(_user?.uid)
        .collection('recipes_posted');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(2),
            padding:
                const EdgeInsets.only(top: 70, bottom: 70, left: 70, right: 70),
            decoration: BoxDecoration(
              color: const Color(0xff272a32),
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
                        pageBuilder: (_, __, ___) => const UploadRecipe(),
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
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Transform.scale(
                    scale: 2.4,
                    child: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _recipesCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return Row(
                  children: snapshot.data!.docs.map((doc) {
                    final recipeData = doc.data() as Map<String, dynamic>;
                    return CardDisplay(
                      recipe: recipeData,
                      onDelete: () {
                        doc.reference.delete();
                      },
                    );
                  }).toList(),
                );
              } else {
                return const Text('');
              }
            },
          ),
        ],
      ),
    );
  }
}
