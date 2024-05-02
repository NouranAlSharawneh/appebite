import 'package:appebite/Widgets/nav_bar.dart';
import 'package:appebite/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:appebite/pages/MeSection/favorites.dart';
import 'package:appebite/pages/MeSection/BMI_status.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:appebite/pages/MeSection/personal_information.dart';
import 'package:appebite/pages/MeSection/cooked.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:appebite/pages/MeSection/BMI_status.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appebite/pages/settings/settings_edit_information.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class UserBar extends StatefulWidget {
  const UserBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserBarState createState() => _UserBarState();
}
class _UserBarState extends State<UserBar>{
FirebaseAuth auth = FirebaseAuth.instance;
String _userName = '';
@override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userInfo = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .get();

        setState(() {
          _userName = userInfo['firstName'];
        });
      } catch (e) {
        print('Error fetching user name: $e');
      }
    }
  }
  void _showDialog(BuildContext context) {
   QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      backgroundColor: const Color(0xff272a32),
      title: 'Are you sure',
      titleColor: Colors.white,
      text: "Are you sure you want to logout?",
      textColor: const Color(0xff686f82),
      confirmBtnColor: const Color(0xffff7269),
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      onConfirmBtnTap: () {
        // Perform logout
        FirebaseAuth.instance.signOut();
        // Navigate to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }

  void _logout() async {
    await auth.signOut();
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
          opacity: animation,
          child: const LoginPage(),
        ),
      ),
    );
  }

  void _navigateToSettings() {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: Duration.zero,
      pageBuilder: (context, animation, secondaryAnimation) =>
          FadeTransition(
            opacity: animation,
            child: const SettingsEditInformation(),
          ),
    ),
  );
}



  void showLogoutOptions() {
    showModalBottomSheet(
      backgroundColor: const Color(0xff272a32),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('Logout', style: TextStyle(color: Colors.white),),
              onTap: () {
                _showDialog(context);
              },
            ),
            ListTile(
              title:const Text('User Settings', style: TextStyle(color: Colors.white),),
              onTap: () {
                _navigateToSettings();
                //Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    const String userId = 'your_user_id';
    const  String recipeId = 'your_recipe_id';
    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: Stack(
        children:[ 
          GestureDetector(
          onTap: () {
              showLogoutOptions();
              },
        child: Stack(
          children: [
            Container(
            height: 70,
            margin: const EdgeInsets.fromLTRB(30, 92, 35, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello $_userName,',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "View your personal page",
                          style: TextStyle(
                            color: Color.fromRGBO(104, 108, 119, 0.965),
                            fontFamily: 'poppins',
                            fontSize: 13,
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
        const CaloriesTracker(
          // userId: userId,
          // recipeId: recipeId,
        ),
        const HomePage(index: 3,),
      ]),
    );
  }
  
}


class UserPicture extends StatefulWidget {
  const UserPicture({Key? key}) : super(key: key);

  @override
  _UserPictureState createState() => _UserPictureState();
}

class _UserPictureState extends State<UserPicture> {
  String? _profilePictureUrl;
  late String _userName = '';

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userInfo = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .get();

        setState(() {
          _profilePictureUrl = userInfo['profilePictureUrl'];
          _userName = userInfo['firstName'];
        });
      } catch (e) {
        print('Error fetching user profile: $e');
      }
    }
  }

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
        child: _profilePictureUrl != null
            ? Image.network(_profilePictureUrl!,
            fit: BoxFit.cover, // Fit the image inside the container
            ) // Use Image.network to load image from URL
            : const Placeholder(), // Placeholder widget until image is fetched
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
        
        GestureDetector(
          onTap: () {
           Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (context ,animation, secondaryAnimation) =>
                    FadeTransition(opacity: animation, 
                    child: const FavoritePage())),
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

        GestureDetector(
          onTap: () {
            Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (context ,animation, secondaryAnimation) =>
                    FadeTransition(opacity: animation, 
                    child: const CookedPage())),
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
  onTap: () async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid) // Use the UID of the current user
            .get();

        if (snapshot.exists) {
          String userId = user.uid; // You can directly use the UID
          Navigator.push(
            context,
            PageRouteBuilder
            (
              transitionDuration: Duration.zero,
              pageBuilder: (context, animation,secondaryAnimation) => 
              FadeTransition(opacity: animation,
              child: BMIProgressScreen(userId: userId))),
          );
        } else {
          print('User data does not exist');
          // Handle case where user data does not exist
        }
      } else {
        print('User not logged in');
        // Handle case where user is not logged in
      }
    } catch (error) {
      print('Error fetching user data: $error');
      // Handle error fetching user data
    }
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
]);
  }
}

class CaloriesTracker extends StatefulWidget {
  const CaloriesTracker({Key? key}) : super(key: key);

  @override
  _CaloriesTrackerState createState() => _CaloriesTrackerState();
}

class _CaloriesTrackerState extends State<CaloriesTracker> {
  String? calories = 'Fetching...';
  double percent = 0.0; // Initialize percent

 @override
  void initState() {
    super.initState();
    // Call fetchUserData in initState to fetch data when the widget is first initialized
    fetchUserData();
    startNotificationTimer();
  }
void startNotificationTimer() {
    const duration = Duration(minutes: 1); // Trigger notification every minute
    Timer.periodic(duration, (Timer timer) {
      // Trigger the notification here
      // You can use any notification package like flutter_local_notifications
      // Example:
     // showNotification();
    });
  }

  void fetchUserData() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Fetch the user document from Firestore
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();

        if (documentSnapshot.exists) {
          Map<String, dynamic> userData = documentSnapshot.data()!;
          // Retrieve the collection reference of the user's posted recipes
          CollectionReference recipesCollection = FirebaseFirestore.instance
              .collection('Users')
              .doc(user.uid)
              .collection('recipes_posted');

          // Fetch all documents from the recipes collection
          QuerySnapshot<Map<String, dynamic>> recipesSnapshot =
              await recipesCollection.get() as QuerySnapshot<Map<String, dynamic>>;

          // Extract recipe IDs from the fetched documents
          List<String> recipeIds = recipesSnapshot.docs.map((doc) => doc.id).toList();

          // Initialize total consumed calories
          int totalConsumedCalories = 0;

          // Iterate through each recipe ID and fetch recipe data
          for (String recipeId in recipeIds) {
            // Fetch recipe data
            Map<String, dynamic> recipeData = await fetchRecipeData(user.uid, recipeId);

            // Extract and sum up the calories from the recipe data
            int calories = int.parse(recipeData['calories'] ?? '0');
            totalConsumedCalories += calories;
          }

          // Retrieve user's calorie goal
          int caloriesPerMonth = userData['caloriesPerMonth'] ?? 0;

          // Calculate percentage
          double calculatedPercent = totalConsumedCalories / caloriesPerMonth;
          setState(() {
            percent = calculatedPercent;
            calories = totalConsumedCalories.toString();
          });
            // Check if it's around the middle of the month
          
        } else {
          setState(() {
            calories = 'User data not found';
          });
        }
      } else {
        setState(() {
          calories = 'User not logged in';
        });
      }
    } catch (error) {
      setState(() {
        calories = 'Error: $error';
      });
    }
  }

  Future<Map<String, dynamic>> fetchRecipeData(String userId, String recipeId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> recipeSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('recipes_posted')
          .doc(recipeId)
          .get();

      if (recipeSnapshot.exists) {
        return recipeSnapshot.data()!;
      } else {
        print('Recipe document not found');
        return {};
      }
    } catch (error) {
      print('Error fetching recipe data: $error');
      return {};
    }
  }
  
// void showNotification() async {
//   // Initialize the plugin
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
//   // Initialize settings for Android and iOS
//   const  initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//   const  initializationSettingsIOS = IOSInitializationSettings();
//   const  initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  
//   // Initialize the plugin with the settings
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   // Define the notification details
//   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//     'channel_id',
//     'Channel Name',
//     importance: Importance.high,
//     priority: Priority.high,
//     ticker: 'ticker',
//   );
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

//   // Create the notification
//   await flutterLocalNotificationsPlugin.periodicallyShow(
//     0,
//     'Calorie Reminder',
//     'Don\'t forget to track your calorie intake!',
//     RepeatInterval.everyMinute, // Repeat interval
//     platformChannelSpecifics,
//     androidAllowWhileIdle: true, // Allow the notification to be shown even if the device is in low-power idle mode
//   );
// }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 450,
            left: 336,
            child: Image.asset('assets/images/Vector.png'),
          ),
        Positioned(
          top: 415,
          left: 75,
          child: Image.asset('assets/images/Line.png'),
        ),
        const Positioned(
          top: 446,
          left: 49,
          child: Text(
            "Calorie Goal",
            style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 480,
          left: 49,
          child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 11,
                  color: Colors.white,
                ),
                children: [
                const  TextSpan(
                    text: "You have reached ",
                  ),
                  TextSpan(
                    text: "${(percent * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(
                      color:  Color.fromRGBO(255, 114, 105, 1), 
                    ),
                  ),
                  const TextSpan(
                    text: " of your monthly goal",
                  ),
                ],
              ),
             )
           ),
        Center(
          child: Positioned(
            child: Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.fromLTRB(0, 380, 0, 0),
              child: CircularPercentIndicator(
                animation: true,
                animateFromLastPercent: true,
                animationDuration: 1000,
                radius: 100,
                lineWidth: 13,
                percent: percent,
                progressColor: const Color.fromRGBO(255, 114, 105, 1),
                backgroundColor: const Color.fromRGBO(255, 114, 105, 180),
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "${(percent * 100).toStringAsFixed(1)}%",
                  style: const TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 39,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Positioned(
            top: 300,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 190, 0, 0),
              child: Image.asset('assets/images/dot.png'),),
          ),
        ),
      Center(
         child: Positioned(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 460, 0, 0),
              child: const Text(
                "Complete",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
       ),
      ],
    );
  }
}