 import 'package:flutter/material.dart';
 import 'dart:math';
 import 'package:appebite/pages/MeSection/me_page.dart';


// class BMI extends StatefulWidget {
//   const BMI({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const BMIProgressScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return const BMIProgressScreen();
//               },
//             );
//           },
//           child: const Text('Show BMI Progress'),
//         ),
//       ),
//     );
//   }
// }

// class BMIProgressScreen extends StatefulWidget {
//   const BMIProgressScreen({super.key});
  
//   @override
//   // ignore: library_private_types_in_public_api
//   _BMIProgressScreenState createState() => _BMIProgressScreenState();
// }
  // @override
  // Widget build(context){
  //   return Center(
  //     child: IconButton(
  //         icon: Image.asset('assets/images/ex.png'),
  //         onPressed: () {
  //         // Navigate back to the previous screen
  //         showDialog(
  //           context: context,
           
  //           builder: (context)=>
  //           AlertDialog(
  //             actions: [
                
  //             ],

  //           ), );
  //         Navigator.pop(context);
  //   },
  // ),
  //   );
  // }
  // ignore: must_be_immutable
  class BMIProgressScreen extends StatefulWidget {
  final double userHeight;
  final double userWeight;

  const BMIProgressScreen({
    Key? key,
    required this.userHeight,
    required this.userWeight,
  }) : super(key: key);

  @override
  _BMIProgressScreenState createState() => _BMIProgressScreenState();
}
 class _BMIProgressScreenState extends State<BMIProgressScreen> {
  late double bmiValue=0;
   @override
  void initState() {
    super.initState();
    calculateBMI(); // Calculate BMI when the widget initializes
  }

  void calculateBMI() {
    setState(() {
      bmiValue = widget.userWeight / ((widget.userHeight / 100) * (widget.userHeight / 100));
    });
  }
  

  // @override
  // void initState() {
  //   super.initState();
  //  // _bmiValue = widget.initialValue; // Initialize BMI value from the database
  // }
   
  @override
  Widget build(BuildContext context) {
    return 
    
    Stack(//to see the
      children: [
        const Opacity(
          opacity: 0.1,
          child: UserBar()),
        Dialog(
       // shape: RoundedRectangleBorder(
        //  borderRadius: BorderRadius.circular(60),
       // ),
       elevation: 0,
       backgroundColor:Colors.transparent,
      // backgroundColor:Color.fromARGB(255, 64, 64, 66),
        
        child: contentBox(context),
      ),
    ]);
  }

  contentBox(context) {
     String displayedText = '';
    Color textColor = Colors.white;

    if (bmiValue < 18.5) {
      displayedText = 'Underweight';
      textColor = Colors.yellow;
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      displayedText = 'Normal';
      textColor = Colors.green;
    } else if (bmiValue >= 25 && bmiValue < 30) {
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
            //color: Colors.black,
           // padding: const EdgeInsets.all(130),
            decoration: BoxDecoration(
              //shape: BoxShape.rectangle,
              color: const Color.fromRGBO(53, 56, 66, 1),
              //color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              //mainAxisSize: MainAxisSize.min,
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
                const Positioned(
                  top: 330,
                  left: 64,
                  child: Text(
                    'Your wieght is ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      
                      ),
                  ),
                ),
               
                 Positioned(
                  top: 330,
                  left: 180,
                   child: Container(
                          height: 200,
                          width: 200,
                          child: Stack(
                            children: [
                              Text(
                                displayedText,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                 ),
                
                Positioned(
                    top: 17,
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
                  bmiValue.toStringAsFixed(1),
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
              Positioned(
                  top:290,
                  left: 18,
                  child: Stack(
                    children: [
                      
                      Center(
                        child: Container(
                          height: 20,
                          width: 300,
                          child: Row(
                            children: [
            _buildIntervalColor(0.29, Colors.yellow,"Underwieght"), // Good BMI range
            _buildIntervalColor(0.120, Colors.green,"Normal"), // Normal BMI range
            _buildIntervalColor(0.090, Colors.orange,"Overwieght"), // Overweight BMI range
            _buildIntervalColor(0.427, Colors.red,"Obes"), // Obese BMI range
                                     ],
                               ),
                    ),
                  ),
                  
              ]),
               ),
               
                  
                  // Cursor line
                    Positioned(
                      top: 285,
                    left:  bmiValue == 0 ? 18 : (bmiValue >= 50 ? 300 : (bmiValue / 50) * 300), // Calculate position based on BMI value
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
  
  // void  calculateBMI(double height, double weight) {
  //   double My_BMI= weight / (height * height);
  //   if (My_BMI <18.5 ){
  //     return print("Your wieght is Underweight");
  //   }
  //   else if( My_BMI >=18.5 && My_BMI <=24.9){
  //     return print("Your wiegth is Normal");
  //   }
  //   else if( My_BMI >=25 && My_BMI <=29.9){
  //     return print("Your wiegth is Overweight");
  //   }
  //   else{
  //     return print("Your wieght is Obese");
  //   }
  //   String  ShowBMI(double bmiValue){
  //     Text textValue=const Text("Your Wieght is");
  //     String innerText = textValue.data?? ' ';
  //     String text="";
  //       if(bmiValue< 18.6){
  //         String text = innerText + "Underwieght";
  //       }
  //       else if( bmiValue >=18.5 && bmiValue <=24.9){
  //         String text = innerText + "Normal";
  //   }
  //   else if( bmiValue >=25 && bmiValue <=29.9){
  //     String text = innerText + "Overwieght";
  //   }
  //   else{
  //     String text = innerText + "Obes";
  //   }
  //   return innerText; 
  //   }
  // }
  
  Widget _buildIntervalColor(double widthFraction, Color color, String text) {
  return Expanded(
    flex: (widthFraction * 100).toInt(),
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
  );
}

   
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('BMI Scale'),
//         ),
//         body: BMIScale(),
//       ),
//     );
//   }
// }

// class BMIScale extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 20,
//         width: 300,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [
//               Colors.yellow, // Normal BMI
//               Colors.green, // Good BMI
//               Colors.orange, // Overweight BMI
//               Colors.red, // Obese BMI
//             ],
//             stops: [
//               0.2, // Good BMI range
//               0.4, // Normal BMI range
//               0.6, // Overweight BMI range
//               0.8, // Obese BMI range
//             ],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//         // child: Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //   children: [
//         //     Text('Underweight'),
//         //     Text('Normal'),
//         //     Text('Overweight'),
//         //     Text('Obese'),
//         //   ],
//         // ),
//       ),
//     );
//   }
  }
  
  