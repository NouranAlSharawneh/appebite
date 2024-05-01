import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    // Load favorite items from local storage when the page initializes
    loadFavorites();
  }

  // Function to load favorite items from local storage
  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteItems = prefs.getStringList('favorites') ?? [];
    });
  }

  // Function to save favorite items to local storage
  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', favoriteItems);
  }

  // Function to toggle favorite status
  void toggleFavorite(String item) {
    setState(() {
      if (favoriteItems.contains(item)) {
        favoriteItems.remove(item);
      } else {
        favoriteItems.add(item);
      }
      // Save favorite status to local storage
      saveFavorites();
    });
  }
/*
style: TextStyle(
            fontFamily: 'poppins',
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,

*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      appBar: AppBar(
      toolbarHeight: 60,
      backgroundColor:const Color.fromRGBO(38, 43, 52, 1) ,
      title:Container(
        height: 30,
        margin: const EdgeInsets.fromLTRB(89, 60, 121, 10),
        //color: Colors.black,
        child: const  Text('Favorites',style: TextStyle(
                fontFamily: 'poppins',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                )
                ),
      ),
    leading: IconButton(
    icon: Image.asset('assets/images/arrow.png'),
    onPressed: () {
      // Navigate back to the previous screen
      Navigator.pop(context);
    },
  ),
       ),

      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Image.asset('assets/images/Heart.png'),
              color: favoriteItems.contains(item) ? const Color.fromRGBO(255, 114, 105, 1) : Colors.grey,
              onPressed: () => toggleFavorite(item),
            ),
          );
        },
      ),
    );
  }
}
