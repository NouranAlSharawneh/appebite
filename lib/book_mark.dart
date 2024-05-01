import 'package:flutter/material.dart';
import 'package:appebite/Widgets/nav_bar.dart';

class BookMPage extends StatefulWidget {
  const BookMPage({super.key});

  @override
  State<BookMPage> createState() => _BookMPageState();
}

class _BookMPageState extends State<BookMPage> {
 

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Stack(
        children: <Widget>[
           HomePage(index: 2,),
        ],
       ),
  );
  }
}

        