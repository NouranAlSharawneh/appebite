// the API keys will be here
//import ‘package: http/http.dart’; 
//GET https://api.spoonacular.com/recipes/complexSearch;
//Content-Type: application/json
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MyApiPage extends StatefulWidget {
//   @override
//   MyApiPageState createState() => MyApiPageState();
// }

// class MyApiPageState extends State<MyApiPage> {
//   List<dynamic> _data = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('GET https://api.spoonacular.com/recipes/complexSearch'));
//     if (response.statusCode == 200) {
//       setState(() {
//         _data = json.decode(response.body);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Example'),
//       ),
//       body: ListView.builder(
//         itemCount: _data.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_data[index]['title']),
//             subtitle: Text(_data[index]['description']),
//           );
//         },
//       ),
//     );
//   }
// }