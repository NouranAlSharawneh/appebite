import 'package:flutter/material.dart';
import 'package:appebite/pages/MeSection/favorites.dart';
import 'package:appebite/pages/MeSection/BMI_status.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:appebite/pages/MeSection/personal_information.dart';
import 'package:appebite/pages/MeSection/cooked.dart';

class UserBar extends StatelessWidget {
  const UserBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ 
          InkWell(
          onTap: () {
                // Navigate to personal screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MeList()),
                );
              },
        child: Stack(
          children: [
            Container(
            height: 70,
            
            margin: const EdgeInsets.fromLTRB(30, 62, 35, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:const  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "View your personal page",
                          style: TextStyle(
                            color: Color.fromRGBO(104, 108, 119, 0.965),
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const UserPicture(),
                //const SizedBox(width: 19),
               // const InformationBar()
               //const CaloriesTracker()
              ],
              
            ),
          ),
          
          
        
        ])
        ,),
        const InformationBar(),
         const SizedBox(height: 0,),
        const CaloriesTracker()
      ]),
    );
  }
}

class UserPicture extends StatelessWidget {
  const UserPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('assets/images/Avatar.png'), // Adjust asset path
      ),
    );
  }
}


class InformationBar extends StatelessWidget {
  const InformationBar({super.key});

  @override
 Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Add a SizedBox for the initial margin, so that no overlaps b/w conatiners
        const SizedBox(height: 160),
        
        InkWell(
          onTap: () {
            // Navigate to Favorites screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritePage()),
            );
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 35, 10), // Adjust top margin here
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 64,
                  width: 317,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(53, 56, 66, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Favorites",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 140,),
                    Image.asset('assets/images/Heart.png'),
                  ],
                ),
              ],
            ),
          ),
        ),

        InkWell(
          onTap: () {
            // Navigate to Cooked screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CookedPage()),
            );
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 35, 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 64,
                  width: 317,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(53, 56, 66, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Cooked",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 155,),
                    Image.asset('assets/images/cook.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to BMI screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const BMIProgressScreen(userHeight: 170,userWeight: 50,)),
            );
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 35, 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 64,
                  width: 317,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(53, 56, 66, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "BMI",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 197,),
                    Image.asset('assets/images/Group.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CaloriesTracker extends StatefulWidget{
const CaloriesTracker ({super.key});

@override
// ignore: library_private_types_in_public_api
_CaloriesTrackerState createState()=> _CaloriesTrackerState();
}

class _CaloriesTrackerState extends State<CaloriesTracker>{
 @override
  Widget build(context){
    return Stack(
      children:[
       
      Positioned(
        top:415, 
        left: 75,
        child: Image.asset('assets/images/Line.png')
        ),
       const  Positioned(
          top: 446,
          left: 49,
          child: Text("Calorie Goal",
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 18,
            color: Colors.white,
          ),
          ),
        ),
        //I added stack again here to make the image override the content
        Stack(
          children:[ Positioned(
            top: 450,
            left: 336,
            child: Image.asset('assets/images/Vector.png'),
          ),
          
      ]),
        const  Positioned(
          top: 480,
          left: 49,
          child: Text("You reached 50% of your monthly goal",
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 11,
            color: Colors.white,
          ),
          ),
        ),
        Positioned(
          top: 55,
          child: Container(
          height: 200,
          width: 200,
          margin: const EdgeInsets.fromLTRB(97, 480, 0,0),
          //color: Colors.black,
          child:CircularPercentIndicator(
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 1000,
          radius: 100,
          lineWidth: 13,
          percent: 0.5,
          progressColor: const Color.fromRGBO(255, 114, 105, 1),
          backgroundColor: const Color.fromRGBO(255, 114, 105, 180),
          circularStrokeCap: CircularStrokeCap.round,
          center: const Text("50.5%",
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 39,
            color: Colors.white,
            fontWeight: FontWeight.w600
              ), 
          ),
          
          ),
          ),
      ),
      Positioned(
        top:529.5, 
        left: 185,
        child: Image.asset('assets/images/dot.png')
        ),
      const Positioned(
        top: 660,
        left: 155,
        child: Text("Complete", style: TextStyle(
          fontFamily: 'poppins',
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),),
      ),
   ] )
    ;
  }
}