import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UploadRecipeCategories extends StatelessWidget {
  const UploadRecipeCategories({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.cuisineTypeController,
    required this.category,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final TextEditingController cuisineTypeController;
  final Function(String) category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          margin: EdgeInsets.symmetric(vertical: 10*fem),
            child: Text(
              'Categories',
              style: GoogleFonts.poppins(
                fontSize: 17 * ffem,
                fontWeight: FontWeight.w700,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 33 * fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20 * fem, 0 * fem),
                  decoration: BoxDecoration(
                    color: const Color(0xff353841),
                    borderRadius: BorderRadius.circular(5 * fem),
                  ),
                  child: MealDropdown(onMealSelected: category),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                  width: 180 * fem,
                  decoration: BoxDecoration(
                    color: const Color(0xff353841),
                    borderRadius: BorderRadius.circular(5 * fem),
                  ),
                  child: TextField(
                    controller: cuisineTypeController,
                    style: GoogleFonts.poppins(
                      fontSize: 13 * ffem,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffffffff),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Cuisine type',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 13 * ffem,
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
    );
  }
}

class MealDropdown extends StatefulWidget {
  const MealDropdown({required this.onMealSelected,super.key});
  final Function(String) onMealSelected;

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
        return '🥘';
      case 'Lunch':
        return '🍝';
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
          widget.onMealSelected(selectedMeal);
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
