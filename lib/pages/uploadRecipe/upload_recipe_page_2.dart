import 'package:appebite/pages/uploadRecipe/widgets/page_2/add_ingredient_field.dart';
import 'package:appebite/pages/uploadRecipe/widgets/title_heading.dart';
import 'package:flutter/material.dart';

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
                                style: TextStyle(
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
                      // Display existing ingredient fields
                      ...ingredientFields,
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
