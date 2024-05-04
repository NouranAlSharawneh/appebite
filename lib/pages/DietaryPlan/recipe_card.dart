import 'package:appebite/RecipeInfo.dart';
import 'package:appebite/plansinfo.dart';
import 'package:flutter/material.dart';

import 'package:appebite/pages/MeSection/personal_information.dart';
// class RecipeCard extends StatelessWidget {
//   final String title;
//   final String rating;
//   final String cookTime;
//   final String thumbnailUrl;
//   final String calories;
//   final int servings; // Add servings parameter

//   const RecipeCard({
//     Key? key,
//     required this.title,
//     required this.rating,
//     required this.cookTime,
//     required this.thumbnailUrl,
//     required this.calories,
//     required this.servings, // Initialize servings
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final double ratingDouble = double.parse(rating);
//     List<dynamic> ingredients = [];
    
//   final Map<String, dynamic> recipe = {
//       'title': title,
//       'rating': ratingDouble,
//       'prepTime': cookTime,
//       'image': thumbnailUrl,
//       'calories': calories,
//       'servings': servings,
//     };
//     return GestureDetector(
//       onTap: () {
//         // Navigate to another page when the card is tapped
       
        
//         Navigator.push(
//             context,
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) => RecipeInfo(recipe: recipe),
//               transitionsBuilder: (
//                 context,
//                 animation,
//                 secondaryAnimation,
//                 child,
//               ) {
//                 return FadeTransition(
//                   opacity: Tween<double>(
//                     begin: 0.0,
//                     end: 500.0,
//                   ).animate(
//                     CurvedAnimation(
//                       parent: animation,
//                       curve:
//                           Curves.easeInOut, // Specify the desired easing curve
//                     ),
//                   ),
//                   child: child,
//                 );
//               },
//             ));
    
//       },
//       child: Card(
//         margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
//         elevation: 4,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             children: [
//               Image.network(
//                 thumbnailUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 190,
//               ),
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: Container(
//                   height: 20,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 255, 225, 179),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(
//                         Icons.star,
//                         color: Color.fromARGB(255, 255, 173, 48),
//                         size: 12,
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         (ratingDouble).toString(),
//                         style: const TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color.fromARGB(255, 0, 0, 0),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors:  [
//                        const  Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
//                        const  Color.fromARGB(0, 0, 0, 0),
//                       ],
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10, bottom: 3, right: 10),
//                         child: Text(
//                           title,
//                           style: const TextStyle(
//                             fontFamily: 'Poppins',
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                            maxLines: 3, // Set max lines to 2
//                            overflow: TextOverflow.ellipsis, // Specify how overflowed text should be handled
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Icon(
//                               Icons.people_alt_outlined,
//                               color: Color.fromARGB(255, 231, 149, 91),
//                               size: 19,
//                             ),
//                             const SizedBox(width: 4),
//                             Text(
//                               '$servings serve',
//                               style: const TextStyle(
//                                 fontFamily: 'Poppins',
//                                 color: Colors.white,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             const SizedBox(width: 13),
//                             const Icon(
//                               Icons.timer,
//                               color: Color.fromARGB(255, 231, 149, 91),
//                               size: 18,
//                             ),
//                             const SizedBox(width: 4),
//                             Text(
//                               '$cookTime min',
//                               style: const TextStyle(
//                                 fontFamily: 'Poppins',
//                                 color: Colors.white,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             const SizedBox(width: 13),
//                              const Icon(
//                                Icons.whatshot,
//                               color: Color.fromARGB(255, 231, 149, 91),
//                               size: 18,
//                             ),
//                             const SizedBox(width: 4),
//                             Text(
//                               '$calories kcal',
//                               style: const TextStyle(
//                                 fontFamily: 'Poppins',
//                                 color: Colors.white,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class Recipe1 {
//   final String title;
//   final double rating;
//   final String cookTime;
//   final String thumbnailUrl;
//   final String calories;
//   final int servings;

//   Recipe1({
//     required this.title,
//     required this.rating,
//     required this.cookTime,
//     required this.thumbnailUrl,
//     required this.calories,
//     required this.servings,
//   });
//    Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'rating': rating,
//       'cookTime': cookTime,
//       'thumbnailUrl': thumbnailUrl,
//       'calories': calories,
//       'servings': servings,
//     };
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeCard extends StatefulWidget {
  final String title;
  final String rating;
   final String id;
  final String cookTime;
  final String thumbnailUrl;
  final String calories;
  final int servings;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.rating,
     required this.id,
    required this.cookTime,
    required this.thumbnailUrl,
    required this.calories,
    required this.servings,
  }) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  Map<String, dynamic> recipe = {};
   List<Map<String, dynamic>> ingredients = [];
Map<String, List<String>> substitutes = {};
List<String> instructions = [];

@override
void initState() {
  super.initState();

  (() async {
    try {
      ingredients = await fetchIngredients();
      substitutes = await fetchIngredientSubstitutes(widget.id, ingredients);
      instructions = await fetchInstructions();
      
int ingredientsCount = ingredients.length;
      setState(() {
        recipe = {
          'title': widget.title,
          'rating': double.parse(widget.rating),
          'prepTime': widget.cookTime,
          'image': widget.thumbnailUrl,
          'calories': widget.calories,
          'servings': widget.servings,
          'ingredients': ingredients,
          'ingredientSubstitutes': substitutes,
          'instructions': instructions, // Adding instructions to the recipe map
          'ingredientsCount':ingredientsCount
        };
      });
    } catch (error) {
      print('Failed to fetch recipe data: $error');
    }
  })();
}


  Future<List<Map<String, dynamic>>> fetchIngredients() async {
  const String apiKey = '25e156a57e0b43be98220d6f32fd8ff4';
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/recipes/${widget.id}/ingredientWidget.json?apiKey=$apiKey'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    List<Map<String, dynamic>> ingredients = responseData['ingredients']
        .cast<Map<String, dynamic>>(); // Use cast<> method here

    // Remove duplicates
    final ingredientNames =
        ingredients.map((ingredient) => ingredient['name']).toSet();
    ingredients.retainWhere(
        (ingredient) => ingredientNames.remove(ingredient['name']));

    return ingredients;
  } else {
    print('Failed to fetch ingredients for recipe ${widget.id}');
    return [];
  }
}

Future<List<String>> fetchInstructions() async {
  final String apiKey = '25e156a57e0b43be98220d6f32fd8ff4';
  final String apiUrl =
      'https://api.spoonacular.com/recipes/${widget.id}/analyzedInstructions?apiKey=$apiKey';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> instructionsData = json.decode(response.body);
    if (instructionsData.isNotEmpty) {
      final List<dynamic> steps = instructionsData[0]['steps'];
      List<String> instructions = [];
      steps.forEach((stepData) {
        final String step = stepData['step'].toString();
        final List<String> separatedSteps = _splitSteps(step); // Split steps based on patterns
        instructions.addAll(separatedSteps);
      });
      instructions = instructions.where((step) => step.trim().isNotEmpty).toList(); // Remove empty steps
      print('Instructions for recipe ${widget.id}: $instructions');
      return instructions;
    } else {
      print('No instructions found for recipe ${widget.id}');
      return [];
    }
  } else {
    print('Failed to fetch instructions for recipe ${widget.id}');
    return [];
  }
}

List<String> _splitSteps(String step) {
  // Define patterns that indicate the end of a step
  final List<String> patterns = ['.', '!', '?', ';'];

  // Loop through each pattern and split the step based on it
  for (String pattern in patterns) {
    step = step.replaceAll(pattern, '$pattern\\n');
  }

  // Split the step into individual lines and trim each line
  List<String> lines = step.split('\\n');
  lines = lines.map((line) => line.trim()).toList();

  // Remove any empty lines
  lines = lines.where((line) => line.isNotEmpty).toList();

  return lines;
}





  Future<Map<String, List<String>>> fetchIngredientSubstitutes(
   String recipeId, List<dynamic> ingredients) async {
    Map<String, List<String>> substitutes = {};
    final String apiKey = '25e156a57e0b43be98220d6f32fd8ff4';

    for (var ingredient in ingredients) {
      final String ingredientName = ingredient['name'];
      final String substitutesApiUrl =
          'https://api.spoonacular.com/food/ingredients/substitutes?ingredientName=$ingredientName&apiKey=$apiKey';

      try {
        final response = await http.get(Uri.parse(substitutesApiUrl));
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          print('Response for $ingredientName: $jsonData'); // Debug print
          if (jsonData['status'] == 'success') {
            if (jsonData['substitutes'] != null) {
              final List<dynamic> substitutesData = jsonData['substitutes'];
              // Convert all substitutes to strings and add them to the map
              substitutes[ingredientName] = substitutesData
                  .map((substitute) => substitute.toString())
                  .toList();
            }
          } else {
            print(
                'No substitutes found for $ingredientName: ${jsonData['message']}');
          }
        } else {
          print(
              'Failed to fetch substitutes for ingredient $ingredientName. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print(
            'Error fetching substitutes for ingredient $ingredientName: $error');
      }
    }

    return substitutes;
  }

  @override
  Widget build(BuildContext context) {
    // Here, you can access the recipe properties like this: recipe['title'], recipe['rating']...
    // But, remember to handle the case where the recipe map is empty (before the fetchIngredients call resolves)
 final double ratingDouble = double.parse(widget.rating);
    // For instance:
    if (recipe.isEmpty) {
      return CircularProgressIndicator();
    } else {
      return GestureDetector(
        onTap: () {  
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => PlansInfo(recipe: recipe),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0.0,
                    end: 500.0,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: child,
                );
              },
            ),
          );
        },
        // Your existing code to display the RecipeCard goes here...
        child: Card(
        margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Image.network(
                widget.thumbnailUrl,
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
                    borderRadius: BorderRadius.circular(15),
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
                    borderRadius: BorderRadius.circular(15),
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
                          widget.title,
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
                              '${widget.servings} serve',
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
                              '${widget.cookTime} min',
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
                              '${widget.calories} kcal',
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
}
