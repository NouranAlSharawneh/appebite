import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MOCalories extends StatefulWidget {
  const MOCalories({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.initialCaloriesValue,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final int initialCaloriesValue;

  @override
  State<MOCalories> createState() => _MOCaloriesState();
}

class _MOCaloriesState extends State<MOCalories> {
  late TextEditingController caloriesController;
  late String userId;

  @override
  void initState() {
    super.initState();
    caloriesController =
        TextEditingController(text: widget.initialCaloriesValue.toString());
    getUserId();
  }

  Future<void> getUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
    }
  }

  void updateCaloriesInFirestore(int newCalories) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .update({'caloriesPerMonth': newCalories});
    } catch (error) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update calories: $error'),
          duration: const Duration(seconds: 3),
        ),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13 * widget.fem),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8 * widget.fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15 * widget.fem),
            width: double.infinity,
            height: 78 * widget.fem,
            decoration: BoxDecoration(
              color: const Color(0xff252830),
              borderRadius: BorderRadius.circular(8 * widget.fem),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      controller: caloriesController,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                        fontSize: 25 * widget.ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * widget.ffem / widget.fem,
                        color: const Color(0xffffffff),
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(left: 40),
                        border: InputBorder.none,
                        hintText: 'calories',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 20 * widget.ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * widget.ffem / widget.fem,
                          color: const Color(0xff686f82),
                        ),
                      ),
                      onChanged: (newValue) {
                        // Update the calories in Firestore
                        int newCalories = int.tryParse(newValue) ?? 0;
                        updateCaloriesInFirestore(newCalories);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      ' calories',
                      style: GoogleFonts.poppins(
                        fontSize: 20 * widget.ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * widget.ffem / widget.fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 170 * widget.fem,
            ),
            child: Text(
              'note: you can edit your goal based on your desire',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 11 * widget.ffem,
                fontWeight: FontWeight.w300,
                height: 1.0 * widget.ffem / widget.fem,
                letterSpacing: 0.5 * widget.fem,
                color: const Color(0xff686f82),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
