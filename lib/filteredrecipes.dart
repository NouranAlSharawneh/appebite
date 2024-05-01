import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:appebite/Widgets/nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:appebite/Widgets/RecipesList.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FilteredPage extends StatefulWidget {
  const FilteredPage({Key? key}) : super(key: key);

  @override
  State<FilteredPage> createState() => _FilteredState();
}

class _FilteredState extends State<FilteredPage> {
  int currentTab = 0;
  String _searchInput = 'all'; // Added a new state variable for search input
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 20, right: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(IconlyLight.arrow_left_2,
                            color: Color(0xffff7269), size: 30),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 0, bottom: 0),
                        child: Container(
                          height: 50.61,
                          width: 320,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(250, 38, 40, 48),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _controller,
                            onChanged: (String value) {
                              setState(() {
                                _searchInput = value;
                              });
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search recipe",
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 104, 111, 130),
                                fontFamily: 'Poppins',
                                fontSize: 13,
                              ),
                              prefixIcon: Icon(Iconsax.search_normal_1_copy,
                                  color: Color.fromARGB(255, 104, 111, 130)),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 13),
                                child: Icon(
                                  IconlyLight.filter,
                                  color: Color(0xffff7269),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: MealsPage(
              mealType: 'all',
              cuisineType: 'all',
              keywords: _searchInput,
            ),
          ), // Used the state variable here
          
          const HomePage(
            index: 0,
          ),
        ],
      ),
    );
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
