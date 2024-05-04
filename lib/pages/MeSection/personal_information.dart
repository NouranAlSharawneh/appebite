import 'package:flutter/material.dart';
//import 'package:appebite/pages/MeSection/me_page.dart';

class MeList extends StatefulWidget {
  const MeList({Key? key}) : super(key: key);

  @override
  _MeListState createState() => _MeListState();
}

class _MeListState extends State<MeList> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    _counter++; // Increment the counter every time the page is built

    return Scaffold(
      backgroundColor: Colors.black, // Setting background color to black for visibility
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Me Screen",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              "You've entered this page $_counter times",
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Pops the current page when the FAB is pressed
        },
        child: const Icon(Icons.arrow_back), // Icon for the FAB
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Positions the FAB in the center
    );
  }
}

