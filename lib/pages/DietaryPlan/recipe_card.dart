import 'package:flutter/material.dart';

import 'package:appebite/pages/MeSection/personal_information.dart';
class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final String calories;
  final int servings; // Add servings parameter

  const RecipeCard({
    Key? key,
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbnailUrl,
    required this.calories,
    required this.servings, // Initialize servings
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double ratingDouble = double.parse(rating);

    return GestureDetector(
      onTap: () {
        // Navigate to another page when the card is tapped
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) => 
            FadeTransition(
            opacity: animation,
            child: const MeList()
            )
            ),
        );
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(30, 15, 30, 00),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 190,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 20,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 225, 179),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 173, 48),
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        (ratingDouble).toString(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors:  [
                       const  Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
                       const  Color.fromARGB(0, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 3, right: 10),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                           maxLines: 3, // Set max lines to 2
                           overflow: TextOverflow.ellipsis, // Specify how overflowed text should be handled
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.people_alt_outlined,
                              color: Color.fromARGB(255, 231, 149, 91),
                              size: 19,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$servings serve',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 13),
                            const Icon(
                              Icons.timer,
                              color: Color.fromARGB(255, 231, 149, 91),
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$cookTime min',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 13),
                             const Icon(
                               Icons.whatshot,
                              color: Color.fromARGB(255, 231, 149, 91),
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$calories kcal',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
