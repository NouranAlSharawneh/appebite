import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadRecipe extends StatelessWidget {
  const UploadRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor:const Color(0xff272a32) ,
      resizeToAvoidBottomInset : false,
      body: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(34*fem, 34*fem, 22.5*fem, 8*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xff272a32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleHeading(fem: fem, ffem: ffem),
            AddImage(fem: fem, ffem: ffem),
            FoodInput(fem: fem, ffem: ffem),
            DescriptionInput(fem: fem, ffem: ffem),
            CookingDuration(fem: fem, ffem: ffem),
            ServingsAndCaloriesInput(fem: fem, ffem: ffem),
            ContinueButton(fem: fem, ffem: ffem),
          ],
    )
      )
    ));
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return TextButton(
              onPressed: () {},
              style: TextButton.styleFrom (
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 327*fem,
                height: 56*fem,
                decoration: BoxDecoration (
                  color: Color(0xffff7269),
                  borderRadius: BorderRadius.circular(32*fem),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      letterSpacing: 0.1049999982*fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            );
  }
}

class ServingsAndCaloriesInput extends StatelessWidget {
  const ServingsAndCaloriesInput({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
              // fooddetailsN4s (40:627)
              margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 8.5*fem, 107*fem),
              width: double.infinity,
              height: 37*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 2*fem),
                          child: Text(
                            'Servings',
                            style: GoogleFonts.poppins(
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.118999998*fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(9 * fem, 10 * fem, 20 * fem, 8 * fem),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff353842),
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child: TextField(
                            style: GoogleFonts.poppins(
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              letterSpacing: 0.1049999982 * fem,
                              color: const Color(0xff686e81),
                            ),
                            decoration: InputDecoration(
                              hintText: '3',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2125 * ffem / fem,
                                letterSpacing: 0.1049999982 * fem,
                                color: const Color(0xff686e81),
                              ),
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8 * fem, right: 10 * fem),
                                child: const Icon(Icons.fastfood),
                              ),
                            ),
                          ),
                        ),

                  SizedBox(
                    // caloriesboxPXh (41:597)
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // caloriesLxj (40:614)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 2*fem),
                          child: Text(
                            'Calories ',
                            style: GoogleFonts.poppins(
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.118999998*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupg33h4Nw (Jyc15hTZvK3mE2ZrRNG33h)
                          padding: EdgeInsets.fromLTRB(10*fem, 10*fem, 11*fem, 8*fem),
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xff353842),
                            borderRadius: BorderRadius.circular(8*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // vectoryko (40:626)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 2*fem),
                                width: 10*fem,
                                height: 15*fem,
                                child: Image.asset(
                                  'assets/designs/images/vector-EJF.png',
                                  width: 10*fem,
                                  height: 15*fem,
                                ),
                              ),
                              Text(
                                // uPZ (41:596)
                                '250',
                                style: GoogleFonts.poppins(
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125*ffem/fem,
                                  letterSpacing: 0.1049999982*fem,
                                  color: Color(0xff686e81),
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
      );
  }
}

class CookingDuration extends StatelessWidget {
  const CookingDuration({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
              
              margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 5.5*fem, 31*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(32*fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // cookingdurationinminutesyLF (36:633)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 22*fem),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts. poppins(                                  
                          fontSize: 17*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          letterSpacing: 0.118999998*fem,
                          color: Color(0xff3d5480),
                        ),
                        children: [
                          TextSpan(
                            text: 'Cooking ',
                            style: GoogleFonts. poppins(                                      
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.5*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                          TextSpan(
                            text: 'Duration',
                            style: GoogleFonts. poppins(                                       
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.5*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                          ),
                          TextSpan(
                            text: '(in minutes)',
                            style: GoogleFonts. poppins(                                      
                              fontSize: 12*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 0.5*fem,
                              color: Color(0xff686f82),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // group15384eX (36:634)
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(32*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupjkebPwh (JybzdTiHXmFjKyoacyJKEB)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // L6F (36:635)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 128.5*fem, 0*fem),
                                child: Text(
                                  '<10',
                                  style: GoogleFonts. poppins(                                            
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.6666666667*ffem/fem,
                                    letterSpacing: 0.5*fem,
                                    color: Color(0xffff7269),
                                  ),
                                ),
                              ),
                              Container(
                                // ecj (36:637)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 114.5*fem, 0*fem),
                                child: Text(
                                  '30',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts. poppins(
                                     
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.6666666667*ffem/fem,
                                    letterSpacing: 0.5*fem,
                                    color: Color(0xffff7269),
                                  ),
                                ),
                              ),
                              Text(
                                '>60',
                                textAlign: TextAlign.right,
                                style: GoogleFonts. poppins(
                                   
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.6666666667*ffem/fem,
                                  letterSpacing: 0.5*fem,
                                  color: const Color(0xff686e81),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 24*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle36dzT (36:638)
                                left: 0*fem,
                                top: 8*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 327*fem,
                                    height: 8*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(32*fem),
                                        color: Color(0xfff4f5f7),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle213xG3 (36:639)
                                left: 0*fem,
                                top: 8*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 167*fem,
                                    height: 8*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(32*fem),
                                        color: Color(0xffff7269),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle212fRM (36:640)
                                left: 158*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 24*fem,
                                    height: 24*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(32*fem),
                                        color: Color(0xffff7269),
                                      ),
                                    ),
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

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 5.5*fem, 16*fem),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
            child: Text(
              'Description',
              style: GoogleFonts.poppins(
                fontSize: 17*ffem,
                fontWeight: FontWeight.w700,
                height: 1.5*ffem/fem,
                letterSpacing: 0.5*fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 80 * fem,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 * fem),
                color: const Color(0xff353842),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16 * fem, 3 * fem, 16 * fem, 0),
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
            ),
          )
        ],
      ),
    );
  }
}

class FoodInput extends StatelessWidget {
  const FoodInput({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
            child: Text(
              'Food Name',
              style: GoogleFonts.poppins(
                fontSize: 17*ffem,
                fontWeight: FontWeight.w700,
                height: 1.5882352941*ffem/fem,
                letterSpacing: 0.5*fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          TextField(
            style: GoogleFonts.poppins(
              fontSize: 15 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.5 * ffem / fem,
              letterSpacing: 1 * fem,
              color: const Color(0xff686e81),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(24 * fem, 19 * fem, 24 * fem, 18 * fem),
              hintText: 'Enter food name',
              hintStyle: GoogleFonts.poppins(
                fontSize: 15 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2125 * ffem / fem,
                color: const Color(0xff686e81),
              ),
              filled: true,
              fillColor: const Color(0xff353841),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32 * fem),
                borderSide: BorderSide.none,
              ),
            ),
          )

        ],
      ),
    );
  }
}

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
      padding: EdgeInsets.fromLTRB(0*fem, 25*fem, 0*fem, 16*fem),
      width: double.infinity,
      decoration: BoxDecoration (
        border: Border.all(color: const Color(0xff686f82)),
        color: const Color(0xff353842),
        borderRadius: BorderRadius.circular(16*fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 30*fem),
            width: 55*fem,
            height: 55*fem,
            child: const Icon(Icons.photo_rounded, size: 80,color:  Color(0xff8e94a4),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
            child: Text(
              'Add Cover Photo',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15*ffem,
                fontWeight: FontWeight.w700,
                height: 1.6666666667*ffem/fem,
                letterSpacing: 0.5*fem,
                color: const Color(0xff8e94a4),
              ),
            ),
          ),
          Text(
            '(up to 12 Mb)',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12*ffem,
              fontWeight: FontWeight.w500,
              height: 1.2125*ffem/fem,
              letterSpacing: 0.5*fem,
              color: const Color(0xff9fa5c0),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleHeading extends StatelessWidget {
  const TitleHeading({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0*fem, 30*fem, 0*fem, 0*fem),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 240*fem, 0*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    fontSize: 17*ffem,
                    fontWeight: FontWeight.w700,
                    height: 2*ffem/fem,
                    letterSpacing: 0.5*fem,
                    color: const Color(0xffff6363),
                  ),
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 17*ffem,
                  fontWeight: FontWeight.w700,
                  height: 2*ffem/fem,
                  letterSpacing: 0.5*fem,
                  color: const Color(0xff3d5480),
                ),
                children: [
                  TextSpan(
                    text: '1/',
                    style: GoogleFonts.poppins(
                      fontSize: 17*ffem,
                      fontWeight: FontWeight.w700,
                      height: 2*ffem/fem,
                      letterSpacing: 0.5*fem,
                      color: const Color(0xff686e81),
                    ),
                  ),
                  TextSpan(
                    text: '2',
                    style: GoogleFonts.poppins(
                      fontSize: 17*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.5*ffem/fem,
                      letterSpacing: 0.5*fem,
                      color: const Color(0xffd9d9d9),
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

