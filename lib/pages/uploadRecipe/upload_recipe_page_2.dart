import 'package:appebite/pages/uploadRecipe/widgets/page_2/add_ingredient_field.dart';
import 'package:appebite/pages/uploadRecipe/widgets/title_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadRecipePage2 extends StatefulWidget {
  const UploadRecipePage2({Key? key}) : super(key: key);

  @override
  State<UploadRecipePage2> createState() => _UploadRecipePage2State();
}

class _UploadRecipePage2State extends State<UploadRecipePage2> {
  List<Widget> ingredientFields = [];

  @override
  void initState() {
    super.initState();
    // Add two initial TextFields
    addIngredientField();
    addIngredientField();
  }

  void addIngredientField() {
    setState(() {
      ingredientFields.add(
        const AddIngredientPage(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(34 * fem, 34 * fem, 22.5 * fem, 8 * fem),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff272a32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleHeading(fem: fem, ffem: ffem, dynamicValue: '2'),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 19 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 198 * fem, 0 * fem),
                              child: Text(
                                'Ingredients',
                                style: GoogleFonts.poppins(
                                  fontSize: 17 * ffem,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5 * fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: addIngredientField,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                width: 24 * fem,
                                height: 24 * fem,
                                child: Icon(
                                  Icons.add,
                                  size: 24 * fem,
                                  color: const Color(0xffff7269),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...ingredientFields,
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 0 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18 * fem),
                        child: Text(
                          'Categories',
                          style: GoogleFonts.poppins(
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5 * fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: double.infinity,
                        height: 33 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20 * fem, 0 * fem),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff353841),
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: const MealDropdown(),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(11.74 * fem, 7.59 * fem, 11.74 * fem, 8.41 * fem),
                              width: 184 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff353841),
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: TextField(
                                style: GoogleFonts.poppins(
                                  fontSize: 13 * ffem,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffffffff),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Cuisine type',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 11 * ffem,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff686f82),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff353841),
                    ),
                  ),
                ),
                SizedBox(
                  width: 391 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 57 * fem, 16 * fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18 * fem),
                              child: Text(
                                'Rate recipe ',
                                style: GoogleFonts.poppins(
                                  fontSize: 17 * ffem,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  initialRating: 2.5,
                                  itemCount: 5,
                                  allowHalfRating: true,
                                  itemSize: 50.0,
                                  glowColor: const Color.fromRGBO(111, 71, 11, 0.5),
                                  unratedColor: const Color(0xff353842),
                                  onRatingUpdate: (rating) {
                                    // print(rating);
                                  },
                                  direction: Axis.horizontal,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_rounded,
                                    color: Color.fromRGBO(255, 173, 48, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 57 * fem, 16 * fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18 * fem),
                              child: Text(
                                'Steps ',
                                style: GoogleFonts.poppins(
                                  fontSize: 17 * ffem,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 112 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 0 * fem),
                                    width: 24 * fem,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                                          // width: double.infinity,
                                          height: 24 * fem,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffe6955b),
                                            borderRadius: BorderRadius.circular(12 * fem),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2125 * ffem / fem,
                                                color: const Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox (
                                          width: 24,
                                          height: 24,
                                          child: Icon(
                                            Icons.drag_indicator_outlined,
                                            size: 24,
                                            color: Color(0xff686f82),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(16 * fem, 5 * fem, 16 * fem, 16 * fem),
                                    width: 250 * fem,
                                    height: 100 * fem,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xff353842)),
                                      color: const Color(0xff353842),
                                      borderRadius: BorderRadius.circular(8 * fem),
                                    ),
                                    child: TextField(
                                      style: GoogleFonts.poppins(
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1 * ffem / fem,
                                        letterSpacing: 0.5 * fem,
                                        color: const Color(0xff686f82),
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Tell a little about your food',
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.2125 * ffem / fem,
                                          letterSpacing: 0.5 * fem,
                                          color: const Color(0xff686f82),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MealDropdown extends StatefulWidget {
  const MealDropdown({super.key});

  @override
  State<MealDropdown> createState() => _MealDropdownState();
}

class _MealDropdownState extends State<MealDropdown> {
  String selectedMeal = 'Breakfast';

  String getMealIcon(String mealType) {
    switch (mealType) {
      case 'Breakfast':
        return '🥐';
      case 'Dinner':
        return '🍲';
      case 'Lunch':
        return '🍔';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: const Color(0xff272a32),
      icon: const Icon(Icons.arrow_drop_down, color: Color(0xffff7269),),
      value: selectedMeal,
      iconSize: 24,
      elevation: 16,
      underline: Container(),
      style: const TextStyle(color: Colors.blue),
      onChanged: (String? newValue) {
        setState(() {
          selectedMeal = newValue!;
        });
      },
      items: <String>['Breakfast', 'Lunch', 'Dinner']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 1.18 , 9, 0),
                child: Text(
                  getMealIcon(value),
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.5 ,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 1.18, 0, 0),
                child: Text(
                  '$value ',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
