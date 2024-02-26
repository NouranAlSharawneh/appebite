import 'package:appebite/pages/uploadRecipe/widgets/page_2/add_ingredient_field.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_categories.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_divider.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/upload_recipe_rating.dart';
import 'package:appebite/pages/uploadRecipe/widgets/title_heading.dart';
import 'package:flutter/material.dart';
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
                UploadRecipeCategories(fem: fem, ffem: ffem),
                const UploadRecipeDivider(),
                UploadRecipeRating(fem: fem, ffem: ffem),
                UploadRecipeSteps(fem: fem, ffem: ffem),
                UploadFormButtons(fem: fem, ffem: ffem),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UploadRecipeSteps extends StatelessWidget {
  const UploadRecipeSteps({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 16 * fem),
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
                              width: double.infinity,
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
                        padding: EdgeInsets.fromLTRB(16 * fem, 5 * fem, 0* fem, 16 * fem),
                        width: 300 * fem,
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
    );
  }
}

class UploadFormButtons extends StatelessWidget {
  const UploadFormButtons({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21*fem),
            width: double.infinity,
            height: 56*fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
              context
             
            );
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: SizedBox(
                      width: 156*fem,
                      height: double.infinity,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration (
                          color: const Color(0xff353842),
                          borderRadius: BorderRadius.circular(32*fem),
                        ),
                        child: Center(
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2*ffem/fem,
                              color: const Color(0xff686e81),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 156*fem,
                    height: double.infinity,
                    decoration: BoxDecoration (
                      color: const Color(0xffff7269),
                      borderRadius: BorderRadius.circular(32*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Upload',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

