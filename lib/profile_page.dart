import 'package:flutter/material.dart';
import 'package:appebite/Widgets/nav_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Stack(
        children: <Widget>[
         HomePage(index: 3,),
        ],
       ),
  );
  }
}

        