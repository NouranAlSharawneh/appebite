import 'package:appebite/Widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:appebite/pages/MeSection/home_diet_recipes.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.fromLTRB(0, 96, 0, 20),
      child: const Stack(
        children:[ Center(
          child: Text(
            'Choose your plan',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
            
      ]),
    );
  }
}

// class DietsList extends StatelessWidget {
//   const DietsList({super.key, required this.onDietSelected});

//   final Function(String) onDietSelected;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 140,
//       width: 603,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           buildDietContainer('Ketogenic', context,"High fat, protein-rich foods\nare acceptableand carbohydrates 10%"),
//           buildDietContainer('Vegetarian', context,"No ingredients may contain meat or meat by-products, such as bones or gelatin"),
//           buildDietContainer('Lacto-Vegetarian', context,"Ingredients must be vegetarian and none of the ingredients contain egg"),
//           buildDietContainer('Ovo-Vegetarian', context,"Ingredients must be vegetarian and none of the ingredients contain dairy"),
//           buildDietContainer('Vegan', context,"No meat or meat by-productssuch such as bones, gelatin, eggs, dairy, or honey"),
//           buildDietContainer('Pescetarian', context,"Meat and meat by-products are not allowed-some dieters eat eggs and dairy"),
//           buildDietContainer('Paleo', context,"Legumes, grains, dairy,\nrefined sugar, and processed foods are not allowed"),
//           buildDietContainer('Primal', context,"Similar to Paleo, except\ndairy is allowed-full fat milk, butter, ghee"),
//           buildDietContainer('Low FODMAP', context,"Foods are considered\nhigh in different types of carbohydrates"),
//           buildDietContainer('Whole30', context,"Include meats eggs, vegetables,fruits,organicoils, dried fruit, nuts, seeds"),
//           buildDietContainer('Gluten Free', context,"Avoiding wheat, barley,\nrye, and other gluten-containing grains"),
//         ],
//       ),
//     );
//   }

//   Widget buildDietContainer(String dietName, BuildContext context,String dirciption) {
//     return GestureDetector(
//       onTap: () {
//         onDietSelected(dietName); // Pass selected diet to RecipeHomePage
//       },
//       child: Stack(
//         children: [Container(
//           height: 120,
//           width: 197,
//           margin: const EdgeInsets.fromLTRB(18, 10, 10, 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: const Color.fromRGBO(53, 56, 66, 1),
//           ),
//           child: Stack(
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             //mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 height: 26,
//                 margin: const EdgeInsets.only(top: 16),
                
//                 //color: Colors.black,
//                 child: Center(
//                   child: Text(
//                     dietName,
//                     style: const TextStyle(
//                       color: Color.fromRGBO(255, 114, 105, 1),
//                       fontSize: 17,
//                       fontFamily: 'poppins',
//                       fontWeight: FontWeight.w500
//                     ),
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 1,),
//               Container(
//                   height: 70,
//                  //color: Colors.black,
//                   margin: const EdgeInsets.only(top: 38),
//                   //padding: EdgeInsets.only(left: 10),
//                 child: Center(
//                   child: Text(
//                     dirciption,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 11.5,
//                       fontFamily: 'poppins',
//                       fontWeight: FontWeight.w500,
                      
//                   ),
//                       textAlign: TextAlign.center  ),
//                 ),
//               ),
//          ] ),
//         ),
        
//       ]),
//     );
//   }
// }


class DietsList extends StatefulWidget {
  const DietsList({super.key, required this.onDietSelected});

  final Function(String) onDietSelected;

  @override
  // ignore: library_private_types_in_public_api
  _DietsListState createState() => _DietsListState();
}

class _DietsListState extends State<DietsList> {
  String selectedDiet = ''; // Track the selected diet

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 603,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildDietContainer('Ketogenic', context,
              "High fat, protein-rich foods\nare acceptable and carbohydrates 10%"),
          buildDietContainer('Vegetarian', context,
              "No ingredients may contain meat or meat by-products, such as bones or gelatin"),
          buildDietContainer('Lacto-Vegetarian', context,
              "Ingredients must be vegetarian and none of the ingredients contain egg"),
          buildDietContainer('Ovo-Vegetarian', context,
              "Ingredients must be vegetarian and none of the ingredients contain dairy"),
          buildDietContainer('Vegan', context,
              "No meat or meat by-products such as bones, gelatin, eggs, dairy, or honey"),
          buildDietContainer('Pescetarian', context,
              "Meat and meat by-products are not allowed-some dieters eat eggs and dairy"),
          buildDietContainer('Paleo', context,
              "Legumes, grains, dairy,\nrefined sugar, and processed foods are not allowed"),
          buildDietContainer('Primal', context,
              "Similar to Paleo, except\ndairy is allowed-full fat milk, butter, ghee"),
          buildDietContainer('Low FODMAP', context,
              "Foods are considered\nhigh in different types of carbohydrates"),
          buildDietContainer('Whole30', context,
              "Include meats eggs, vegetables,fruits,organicoils, dried fruit, nuts, seeds"),
          buildDietContainer('Gluten Free', context,
              "Avoiding wheat, barley,\nrye, and other gluten-containing grains"),
        ],
      ),
    );
  }

  Widget buildDietContainer(String dietName, BuildContext context, String description) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDiet = dietName; // Update the selected diet
        });
        widget.onDietSelected(dietName); // Pass selected diet to RecipeHomePage
      },
      child: Container(
        height: 120,
        width: 197,
        margin: const EdgeInsets.fromLTRB(18, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(53, 56, 66, 1),
          boxShadow: selectedDiet == dietName // Apply shadow if the container is selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 26,
              
              margin: const EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  dietName,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 114, 105, 1),
                    fontSize: 17,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 1),
            Container(
              height: 70,
              //color: Colors.yellow,
              margin: const EdgeInsets.only(top: 0),
              child: Center(
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11.5,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class CalendarView extends StatelessWidget {
  final Function(DateTime) onDateSelected; // Define callback function

  const CalendarView({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      //width: 100,
      //color: Colors.black,
       margin: const EdgeInsets.fromLTRB(60, 0, 0, 0),
      // padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
      child: ListView(
        padding: const EdgeInsets.all(1),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 290,
            //height: 200,
            //color: Colors.black,
            //padding: EdgeInsets.all(3),
            child: DatePicker(
              DateTime.now(),
              height: 71,
              width: 36,
              initialSelectedDate: null,
              selectionColor: const Color.fromRGBO(255, 114, 105, 1),
              selectedTextColor: Colors.white,
              daysCount: 7,
              dateTextStyle: const TextStyle(
                fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              dayTextStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: Color.fromRGBO(105, 109, 123, 1),
                fontWeight: FontWeight.w500,
              ),
              monthTextStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8.5,
                color: Color.fromRGBO(105, 109, 123, 1),
                fontWeight: FontWeight.w500,
              ),
              onDateChange: (date) {
                onDateSelected(date); // Trigger callback function with selected date
              },
            ),
          ),
          
        ],
      ),
    );
  }
}

class DietsHomePage extends StatefulWidget {
  const DietsHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DietsHomePage> {
  String selectedDiet = '';
  DateTime? selectedDate; // Add selectedDate variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Header(),
              DietsList(
                onDietSelected: (diet) {
                  setState(() {
                    selectedDiet = diet;
                  });
                },
              ),
              const SizedBox(height: 18,),
              CalendarView(
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              Expanded(
                child: RecipeHomePage(selectedDiet: selectedDiet, selectedDate: selectedDate), // Pass selectedDate to RecipeHomePage
              ),
              Container(
                height: 10,
                margin: const EdgeInsets.only(bottom: 50),
              )
            ],
          ),
          const Positioned(
            top: 420,
            left: 30,
            child: Text(
              "Recipes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w300
              ),
            ),
          ),
          const Positioned(
            top: 420,
            left: 325,
            child: Text(
              "2 items",
              style: TextStyle(
                color: Color.fromARGB(255, 134, 137, 150),
                fontSize: 15,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w300
              ),
            ),
          ),
          const HomePage(index: 2,),
        ],
        
      ),
    );
  }
}



