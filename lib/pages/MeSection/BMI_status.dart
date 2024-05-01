 import 'package:flutter/material.dart';
 //import 'dart:math';
 import 'package:appebite/pages/MeSection/me_page.dart';
 //import 'package:firebase_database/firebase_database.dart';
 import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

 // ignore: must_be_immutable
  class BMIProgressScreen extends StatefulWidget {
  final String userId;
  const BMIProgressScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BMIProgressScreenState createState() => _BMIProgressScreenState();
}

class _BMIProgressScreenState extends State<BMIProgressScreen> {
    late double _userHeight = 0;
  late double _userWeight = 0;
  late double _bmiValue = 0;

  late TextEditingController _heightController;
  late TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userInfo = await FirebaseFirestore.instance
            .collection("Users")
            .doc(widget.userId)
            .get();

        setState(() {
          _userHeight = double.tryParse(userInfo['height']) ?? 0;
          _userWeight = double.tryParse(userInfo['weight']) ?? 0;
          _heightController.text = _userHeight.toStringAsFixed(1);
          _weightController.text = _userWeight.toStringAsFixed(1);
          _bmiValue = _calculateBMI(_userHeight, _userWeight);
        });
      } catch (e) {
        print('Error fetching user info: $e');
        
      }
    }
  }

  double _calculateBMI(double height, double weight) {
    if (height <= 0 || weight <= 0) {
      return 0; 
    }
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    Stack(
      children: [
        const Opacity(
          opacity: 0.1,
          child: UserBar()),
        Dialog(
          elevation: 0,
          backgroundColor:Colors.transparent,
        child: contentBox(context),
      ),
    ]);
  }

  contentBox(context) {
     String displayedText = '';
    Color textColor = Colors.white;
    if (_bmiValue < 18.5) {
      displayedText = 'Underweight';
      textColor = Colors.yellow;
    } else if (_bmiValue >= 18.5 && _bmiValue < 25) {
      displayedText = 'Normal';
      textColor = Colors.green;
    } else if (_bmiValue >= 25 && _bmiValue < 30) {
      displayedText = 'Overweight';
      textColor = Colors.orange;
    } else {
      displayedText = 'Obese';
      textColor = Colors.red;
    }

    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: 490,
            width: 420,

            decoration: BoxDecoration(
              color: const Color.fromRGBO(53, 56, 66, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: <Widget>[
              const Positioned(
                  top: 22,
                  left: 17,
                  child: Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      
                      ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 190),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Your weight is ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  displayedText,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                ,
                Positioned(
                    top: 10,
                    left: 270,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon:Image.asset('assets/images/ex.png'),
                    ),
                  ),

                const Positioned(
                  top: 80,
                  left: 14,
                  child: Text(
                    'The formula to calculate BMI is as follows:\nBMI = weight (in kilograms) / (height^2) (in meters)',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color.fromRGBO(104, 108, 119, 0.965),
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      
                      ),
                  ),
                ),
                const Positioned(
                  top: 140,
                  left: 103,
                  child: Text(
                    'Your BMI is',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      
                      ),
                  ),
                ),
                Positioned(
              top: 170,
              left: 109,
              child: SizedBox(
                child: Text(
                  _bmiValue.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
                
                  const Positioned(
                    top: 242,
                    left: 130,
                    child: Text(
                      'kg/m^2',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        
                        ),
                    ),
                  ),
              Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: Container(
                          margin: const EdgeInsets.only(top: 110),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center, // Centering the Row horizontally
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        _buildIntervalColor(0.29, Colors.yellow, "Underweight"),
                                        _buildIntervalColor(0.120, Colors.green, "Normal"),
                                        _buildIntervalColor(0.090, Colors.orange, "Overweight"),
                                        _buildIntervalColor(0.427, Colors.red, "Obese"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    ,
                    Positioned(
                      top: 285,
                    left: _calculateCursorPosition(),
                    child: Container(
                    width: 3,
                    height: 30,
                    color: Colors.white,
                      ),
                        ), 
                 const Positioned(
                    top: 387,
                    left: 13,
                    child: Text(
                      '- Underweight: BMI less than 18.5 Underwieght\n- BMI between 18.5 and 24.9 Normal\n- BMI between 25 and 29.9 Overwieght\n- BMI 30 or higher Obese',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        
                        ),
                    ),
                  ),
                  Positioned(
                    top: 370,
                    left: 30,
                    child: Image.asset('assets/images/Line.png')
                    )
         ] 
         ),
      ),
    
    ]
    )
    );
  }
  double _calculateCursorPosition() {
  double cursorPosition = 18; // Default position
  if (_bmiValue > 0) {
    double containerWidth = MediaQuery.of(context).size.width - 120; // Subtracting padding
    cursorPosition = ((_bmiValue / 50) * containerWidth).clamp(18.0, containerWidth - 18.0);
    // Clamp ensures the cursor stays within the container bounds
  }
  return cursorPosition;
}
  Widget _buildIntervalColor(double widthFraction, Color color, String text) {
  return Expanded(
    flex: (widthFraction * 100).toInt(),
    child: ClipRRect(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'poppins',
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color:Colors.transparent,
            ),
          ),
        ),
      ),
    ),
  );
 }
}
  
  