import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadRecipeRating extends StatelessWidget {
  const UploadRecipeRating({
    super.key,
    required this.fem,
    required this.ffem,
    required this.onRatingUpdate
  });

  final double fem;
  final double ffem;
  final Function(double) onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10*fem),            
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
                    glowColor: const Color(0xff272a32),
                    unratedColor: const Color(0xff353842),
                    onRatingUpdate: onRatingUpdate,
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
        ],
      ),
    );
  }
}
