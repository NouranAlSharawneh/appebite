import 'package:appebite/filteredrecipes.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:iconly/iconly.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SearchBar1 extends StatefulWidget {
  SearchBar1({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBar1State createState() => _SearchBar1State();
}

class _SearchBar1State extends State<SearchBar1>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchedRecipes = [];
  bool _isLoading = false;
  int selectedTab = 0;
  Widget currentContent = const SizedBox.shrink();
  String? selectedMeal;
  String? selectedCuisine;
  String? selectedDiet;
  int selectedRating = 0;
  List<String> meals = ['Breakfast', 'Lunch', 'Dinner'];
  List<String> cuisine = ['Italian', 'Asian', 'American', 'French', 'Chinese'];
  List<String> diet = [
    'Gluten Free',
    'Ketogenic',
    'Vegetarian',
    'Vegan',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian'
  ];
  String _sortOrder = '';
  String sortType = '';
  String sortDirection = '';
  String allExIngredients = '';
  String allAdIngredients = '';

  TextEditingController _Addcontroller = TextEditingController();
  TextEditingController _Removedcontroller = TextEditingController();
  List<String> addedingredients = [];
  List<String> Removedingredients = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(250, 38, 40, 48),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 4),
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.72),
                inset: true,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  cursorColor: const Color(0xffff7269),
                  onSubmitted: (String value) {
                    String mealType = selectedMeal ?? 'all';
                    String cuisineType = selectedCuisine ?? 'all';
                    String dietType = selectedDiet ?? 'all';
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => filteredrecipes(
                              inputValue: value,
                              cuisine: cuisineType,
                              mealType: mealType,
                              sortType: sortType,
                              sortDirection: sortDirection,
                              allAdIngredients: allAdIngredients,
                              allExIngredients: allExIngredients,
                              dietType: dietType),
                          transitionsBuilder: (context,animation,secondaryAnimation,child,
                          ) { return FadeTransition(
                              opacity: Tween<double>(begin: 0.0,end: 500.0,
                              ).animate(CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut, 
                                ),
                              ),
                              child: child,
                            );
                          },
                        ));
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search recipe",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 104, 111, 130),
                      fontFamily: 'Poppins',
                      fontSize: 13,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 104, 111, 130),
                    ),
                    suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: const Icon(IconlyLight.filter),
                          color: const Color(0xffff7269),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext bc) {
                                return StatefulBuilder(
                                    // added StatefulBuilder to update the state of the widget
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(250, 38, 40, 48),
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 35.0,
                                          bottom: 10,
                                          left: 26,
                                          right: 26),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Expanded(
                                                child: GestureDetector(
                                                  // Wrapped with GestureDetector
                                                  onTap: () {
                                                    setState(() {
                                                      // Update the state of selectedTab
                                                      selectedTab = 0;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: selectedTab == 0
                                                            ? const Color(
                                                                0xffff7269)
                                                            : null,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 13.0,
                                                              bottom: 13),
                                                      child: Center(
                                                        child: Text(
                                                          'Filter',
                                                          style: TextStyle(
                                                            color: selectedTab ==
                                                                    0
                                                                ? const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255)
                                                                : const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    104,
                                                                    111,
                                                                    130),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedTab = 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: selectedTab == 1
                                                            ? const Color(
                                                                0xffff7269)
                                                            : null,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 13.0,
                                                              bottom: 13),
                                                      child: Center(
                                                        child: Text(
                                                          'Sort',
                                                          style: TextStyle(
                                                            color: selectedTab ==
                                                                    1
                                                                ? const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255)
                                                                : const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    104,
                                                                    111,
                                                                    130),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          if (selectedTab == 0)
                                            SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  const Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 3.0),
                                                        child: Text(
                                                          'Categories',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 25,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          8.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: 55,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10), // This adds border radius
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                  ),
                                                                  child: Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      dividerColor:
                                                                          const Color(
                                                                              0xffff7269),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              14.0,
                                                                          right:
                                                                              14,
                                                                          bottom:
                                                                              4),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          iconEnabledColor:
                                                                              const Color(0xffff7269),
                                                                          iconDisabledColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              104,
                                                                              111,
                                                                              130),
                                                                          dropdownColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              53,
                                                                              56,
                                                                              66),
                                                                          menuMaxHeight:
                                                                              170,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              selectedMeal,
                                                                          hint: const Text(
                                                                              "Select Meal",
                                                                              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins')),
                                                                          onChanged:
                                                                              (String? newValue) {
                                                                            setState(() {
                                                                              selectedMeal = newValue;
                                                                            });
                                                                          },
                                                                          items:
                                                                              meals.map<DropdownMenuItem<String>>((String meal) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: meal,
                                                                              child: Text(meal, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Poppins')),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          8.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: 55,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10), // This adds border radius
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                  ),
                                                                  child: Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      dividerColor:
                                                                          const Color(
                                                                              0xffff7269),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              14.0,
                                                                          right:
                                                                              14,
                                                                          bottom:
                                                                              4),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          iconEnabledColor:
                                                                              const Color(0xffff7269),
                                                                          iconDisabledColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              104,
                                                                              111,
                                                                              130),
                                                                          dropdownColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              53,
                                                                              56,
                                                                              66),
                                                                          menuMaxHeight:
                                                                              170,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              selectedCuisine,
                                                                          hint: const Text(
                                                                              "Select Cuisine",
                                                                              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins')),
                                                                          onChanged:
                                                                              (String? newValue) {
                                                                            setState(() {
                                                                              selectedCuisine = newValue;
                                                                            });
                                                                          },
                                                                          items:
                                                                              cuisine.map<DropdownMenuItem<String>>((String cuisine) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: cuisine,
                                                                              child: Text(cuisine, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Poppins')),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      // Rest of your code
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: TextField(
                                                              controller:
                                                                  _Addcontroller,
                                                              onSubmitted:
                                                                  (String
                                                                      value) {
                                                                setState(() {
                                                                  addedingredients
                                                                      .add(
                                                                          value);
                                                                  _Addcontroller
                                                                      .clear();
                                                                  allAdIngredients =
                                                                      addedingredients
                                                                          .join(
                                                                              ', ');
                                                                  print(
                                                                      allAdIngredients);
                                                                });
                                                              },
                                                              cursorColor: Color(
                                                                  0xffff7269),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Include ingredients',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          104,
                                                                          111,
                                                                          130),
                                                                  fontFamily:
                                                                      'Poppins',
                                                                ),
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            17.0,
                                                                        horizontal:
                                                                            15.0),
                                                                isDense: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              color: Color(
                                                                  0xffff7269),
                                                              size: 30,
                                                            ),
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            setState) {
                                                                      return ClipRRect(
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(25.0),
                                                                          topRight:
                                                                              Radius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          // Change bottom sheet background color here
                                                                          color: Color.fromARGB(
                                                                              250,
                                                                              38,
                                                                              40,
                                                                              48),
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              20.0),
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  Text('Included Ingredients:',
                                                                                      style: TextStyle(
                                                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontSize: 20,
                                                                                      )),
                                                                                  IconButton(
                                                                                    icon: Icon(Icons.clear, color: Color.fromARGB(255, 255, 255, 255)),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                      _Addcontroller.clear(); // Clear the text field
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 16,
                                                                              ),
                                                                              if (addedingredients.isEmpty)
                                                                                const Padding(
                                                                                  padding: EdgeInsets.only(top: 2.0),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        'You have not included ingredients yet',
                                                                                        style: TextStyle(
                                                                                          color: Color.fromARGB(255, 104, 111, 130),
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.w400,
                                                                                          fontSize: 18,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(right: 12.0, left: 12),
                                                                                  child: ListView.builder(
                                                                                    itemCount: addedingredients.length,
                                                                                    itemBuilder: (BuildContext context, int index) {
                                                                                      return Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                          color: Color(0xffff7269),
                                                                                        ),
                                                                                        margin: EdgeInsets.only(bottom: 10.0),
                                                                                        child: ListTile(
                                                                                          title: Text(
                                                                                            addedingredients[index],
                                                                                            style: TextStyle(
                                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          trailing: IconButton(
                                                                                            icon: Icon(
                                                                                              Icons.close,
                                                                                              color: Color.fromARGB(250, 38, 40, 48),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                addedingredients.removeAt(index);
                                                                                                allAdIngredients = addedingredients.join(', ');
                                                                                                print(allAdIngredients);
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      // Rest of your code
                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: TextField(
                                                              controller:
                                                                  _Removedcontroller,
                                                              onSubmitted:
                                                                  (String
                                                                      value) {
                                                                setState(() {
                                                                  Removedingredients
                                                                      .add(
                                                                          value);
                                                                  _Removedcontroller
                                                                      .clear();
                                                                  allExIngredients =
                                                                      Removedingredients
                                                                          .join(
                                                                              ', ');
                                                                  print(
                                                                      allExIngredients);
                                                                });
                                                              },
                                                              cursorColor: Color(
                                                                  0xffff7269),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Execlude ingredients',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          104,
                                                                          111,
                                                                          130),
                                                                  fontFamily:
                                                                      'Poppins',
                                                                ),
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            17.0,
                                                                        horizontal:
                                                                            15.0),
                                                                isDense: true,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: const Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              color: Color(
                                                                  0xffff7269),
                                                              size: 30,
                                                            ),
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            setState) {
                                                                      return ClipRRect(
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(25.0),
                                                                          topRight:
                                                                              Radius.circular(25.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          // Change bottom sheet background color here
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              250,
                                                                              38,
                                                                              40,
                                                                              48),
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              20.0),
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  const Text('Execluded Ingredients:',
                                                                                      style: TextStyle(
                                                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                                                        fontFamily: 'Poppins',
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontSize: 20,
                                                                                      )),
                                                                                  IconButton(
                                                                                    icon: const Icon(Icons.clear, color: Color.fromARGB(255, 255, 255, 255)),
                                                                                    onPressed: () {
                                                                                      Navigator.of(context).pop();
                                                                                      _Removedcontroller.clear(); // Clear the text field
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 16,
                                                                              ),
                                                                              if (Removedingredients.isEmpty)
                                                                                const Padding(
                                                                                  padding: const EdgeInsets.only(top: 2.0),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        'You have not execluded ingredients yet',
                                                                                        style: const TextStyle(
                                                                                          color: Color.fromARGB(255, 104, 111, 130),
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.w400,
                                                                                          fontSize: 18,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(right: 12.0, left: 12),
                                                                                  child: ListView.builder(
                                                                                    itemCount: Removedingredients.length,
                                                                                    itemBuilder: (BuildContext context, int index) {
                                                                                      return Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                          color: Color(0xffff7269),
                                                                                        ),
                                                                                        margin: EdgeInsets.only(bottom: 10.0),
                                                                                        child: ListTile(
                                                                                          title: Text(
                                                                                            Removedingredients[index],
                                                                                            style: const TextStyle(
                                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                                              fontFamily: 'Poppins',
                                                                                              fontWeight: FontWeight.w600,
                                                                                            ),
                                                                                          ),
                                                                                          trailing: IconButton(
                                                                                            icon: const Icon(
                                                                                              Icons.close,
                                                                                              color: Color.fromARGB(250, 38, 40, 48),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                Removedingredients.removeAt(index);
                                                                                                allExIngredients = Removedingredients.join(', ');
                                                                                                print(allExIngredients);
                                                                                              });
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 25,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          8.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    Container(
                                                                  height: 55,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10), // This adds border radius
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        53,
                                                                        56,
                                                                        66),
                                                                  ),
                                                                  child: Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      dividerColor:
                                                                          const Color(
                                                                              0xffff7269),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              14.0,
                                                                          right:
                                                                              14,
                                                                          bottom:
                                                                              4),
                                                                      child:
                                                                          DropdownButtonHideUnderline(
                                                                        child: DropdownButton<
                                                                            String>(
                                                                          iconEnabledColor:
                                                                              const Color(0xffff7269),
                                                                          iconDisabledColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              104,
                                                                              111,
                                                                              130),
                                                                          dropdownColor: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              53,
                                                                              56,
                                                                              66),
                                                                          menuMaxHeight:
                                                                              170,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          isExpanded:
                                                                              true,
                                                                          value:
                                                                              selectedDiet,
                                                                          hint: const Text(
                                                                              "Select Diet",
                                                                              style: TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255), fontFamily: 'Poppins')),
                                                                          onChanged:
                                                                              (String? newValue) {
                                                                            setState(() {
                                                                              selectedDiet = newValue;
                                                                            });
                                                                          },
                                                                          items:
                                                                              diet.map<DropdownMenuItem<String>>((String diet) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: diet,
                                                                              child: Text(diet, style: const TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Poppins')),
                                                                            );
                                                                          }).toList(),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 62,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  Removedingredients
                                                                      .clear();
                                                                  addedingredients
                                                                      .clear();
                                                                  allAdIngredients =
                                                                      '';
                                                                  allExIngredients =
                                                                      '';
                                                                  selectedCuisine =
                                                                      null;
                                                                  selectedDiet =
                                                                      null;
                                                                  selectedMeal =
                                                                      null;
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffff7269),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                child: ListTile(
                                                                    title:
                                                                        const Text(
                                                                      'Reset',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17.5,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    leading:
                                                                        IconButton(
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .refresh,
                                                                          color:
                                                                              Colors.white),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          Removedingredients
                                                                              .clear();
                                                                          addedingredients
                                                                              .clear();
                                                                          allAdIngredients =
                                                                              '';
                                                                          allExIngredients =
                                                                              '';
                                                                          selectedCuisine =
                                                                              null;
                                                                          selectedDiet =
                                                                              null;
                                                                          selectedMeal =
                                                                              null;
                                                                        });
                                                                      },
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                print(
                                                                  'alladdingredients: $allAdIngredients - allremovedingredients: $allExIngredients - selectedMeal: $selectedMeal - ',
                                                                );
                                                                  Navigator.of(context).pop();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffff7269),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                child: ListTile(
                                                                    title:
                                                                        const Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17.5,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    leading:
                                                                        IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.white),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'alladdingredients: $allAdIngredients - allremovedingredients: $allExIngredients');
                                                                              Navigator.of(context).pop();
                                                                      },
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          else
                                            Column(
                                              children: [
                                                const Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 3.0),
                                                      child: Text(
                                                        'Cooking Time',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 18,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder =
                                                              'Longest';
                                                          sortType = 'time';
                                                          sortDirection =
                                                              'desc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Longest to Shortest Time',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'Longest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'time';
                                                                sortDirection =
                                                                    'desc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder =
                                                              'Shortest';
                                                          sortType = 'time';
                                                          sortDirection = 'asc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Shortest to Longest Time',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'Shortest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'time';
                                                                sortDirection =
                                                                    'asc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 16),
                                                    const Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 3.0),
                                                          child: Text(
                                                            'Calories',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder =
                                                              'highest';
                                                          sortType = 'calories';
                                                          sortDirection =
                                                              'desc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Highest to Lowest Calories',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'highest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'calories';
                                                                sortDirection =
                                                                    'desc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder = 'lowest';
                                                          sortType = 'calories';
                                                          sortDirection = 'asc';
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 53, 56, 66),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: ListTile(
                                                          title: const Text(
                                                            'Lowest to Highest Calories',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17.5,
                                                              fontFamily:
                                                                  'Poppins',
                                                            ),
                                                          ),
                                                          leading:
                                                              Radio<String>(
                                                            activeColor: Color(
                                                                0xffff7269),
                                                            value: 'lowest',
                                                            groupValue:
                                                                _sortOrder,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                _sortOrder =
                                                                    value!;
                                                                sortType =
                                                                    'calories';
                                                                sortDirection =
                                                                    'asc';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _sortOrder = 'null';
                                                          sortType = 'null';
                                                          sortDirection =
                                                              'null';
                                                        });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffff7269),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child: ListTile(
                                                                  title:
                                                                      const Text(
                                                                    'Reset',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            17.5,
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                  leading:
                                                                      IconButton(
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .refresh,
                                                                        color: Colors
                                                                            .white),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        _sortOrder =
                                                                            'null';
                                                                        sortType =
                                                                            'null';
                                                                        sortDirection =
                                                                            'null';
                                                                      });
                                                                    },
                                                                  )),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                print(
                                                                    'sortType: $sortType - sortdireaction: $sortDirection');
                                                                      Navigator.of(context).pop();
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xffff7269),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                child: ListTile(
                                                                    title:
                                                                        const Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17.5,
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    leading:
                                                                        IconButton(
                                                                      icon: Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.white),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'sortType: $sortType - sortdireaction: $sortDirection');
                                                                              Navigator.of(context).pop();
                                                                      },
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingRow extends StatefulWidget {
  @override
  _RatingRowState createState() => _RatingRowState();
}

class _RatingRowState extends State<RatingRow> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) => _buildRatingContainer(index + 1)),
    );
  }

  Widget _buildRatingContainer(int rating) {
    bool isSelected = rating <= selectedRating;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRating = rating;
        });
      },
      child: Container(
        width: 67,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Color.fromARGB(255, 231, 149, 91)
                : const Color.fromARGB(255, 255, 255, 255),
          ),
          color: isSelected
              ? Color.fromARGB(255, 231, 149, 91)
              : Color.fromARGB(0, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                rating.toString(),
                style: TextStyle(
                  color: isSelected
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : Color.fromARGB(255, 104, 111, 130),
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(width: 10),
              Icon(
                IconlyBold.star,
                color: isSelected
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(255, 104, 111, 130),
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
