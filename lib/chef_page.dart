// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:appebite/Widgets/nav_bar.dart';

class ChefPage extends StatefulWidget {
  const ChefPage({super.key});

  @override
  State<ChefPage> createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
    int currentTab = 1;

  @override
  @mustCallSuper

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: <Widget>[
           HomePage(index: 1,),
        ],)
    );
  }
}

