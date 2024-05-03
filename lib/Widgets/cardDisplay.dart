import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:appebite/RecipeInfo.dart';
import 'package:appebite/Widgets/cardDisplayInfo.dart';
import 'package:appebite/posted_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CardDisplay extends StatefulWidget {
  final Map<String, dynamic>? recipe;
  final Function onDelete;

  const CardDisplay({Key? key, required this.recipe, required this.onDelete})
      : super(key: key);

  @override
  _CardDisplayState createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  @override
  Widget build(BuildContext context) {
    if (widget.recipe == null) {
      return Container(
          height: 160.0,
          width: 330,
          color: Colors.white,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ));
    }
    final String imageUrl =
        widget.recipe!['imageUrl'] ?? 'https://via.placeholder.com/150';
    final String title = widget.recipe!['foodName'] ?? 'Unknown Title';
    final double rating = widget.recipe!['RecipeRating'] ?? 0.0;

    return GestureDetector(
      onTap: () {
        if (widget.recipe != null) {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                    RecipeInfoP(recipe: widget.recipe!),
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
                        curve: Curves
                            .easeInOut, // Specify the desired easing curve
                      ),
                    ),
                    child: child,
                  );
                },
              ));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 10),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust border radius as needed
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        height: 160.0,
        width: 340,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12, top: 8),
                  width: 32,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 53, 56, 66),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => QuickAlert.show(
                            context: context,
                            type: QuickAlertType.confirm,
                            backgroundColor: const Color(0xff272a32),
                            title: 'Are you sure',
                            titleColor: Colors.white,
                            text:
                                "Are you sure you want to delete\n your ${widget.recipe!['foodName']} recipe? \n",
                            textColor: const Color(0xff686f82),
                            confirmBtnColor: const Color(0xffff7269),
                            confirmBtnText: 'Yes',
                            cancelBtnText: 'No',
                            onCancelBtnTap: () => Navigator.pop(context),
                            onConfirmBtnTap: () {
                              widget.onDelete();
                              Navigator.pop(context);
                            }),
                        child: const Icon(
                          Icons.delete_forever,
                          color: Color.fromARGB(216, 255, 115, 105),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 235, top: 8),
                  width: 50,
                  height: 30,
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
                        '${rating.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              // Ensure that the second column takes remaining space
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
                      const Color.fromARGB(0, 0, 0, 0),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align the second column to the end
                  mainAxisAlignment: MainAxisAlignment
                      .end, // Align the content of the second column to the end
                  children: [
                    Text(
                      widget.recipe!['foodName'] ?? 'Untitled Recipe',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.people_alt_outlined,
                          color: Color.fromARGB(255, 231, 149, 91),
                          size: 19,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.recipe!['servings'] ?? 'N/A'} serves',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Iconsax.timer_1_copy,
                          color: Color.fromARGB(255, 231, 149, 91),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${(widget.recipe!['cookingDuration'] ?? 0).round()} mins',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          AkarIcons.fire,
                          color: Color.fromARGB(255, 231, 149, 91),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.recipe!['calories'] ?? 'N/A'} kcal',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class CardDisplay extends StatefulWidget {
//   final Map<String, dynamic> recipe;

//   const CardDisplay({Key? key, required this.recipe}) : super(key: key);

//   @override
//   _CardDisplayState createState() => _CardDisplayState();
// }

// class _CardDisplayState extends State<CardDisplay> {
//   @override
//   Widget build(BuildContext context) {
//     final double rating = widget.recipe['RecipeRating'];
//     return GestureDetector(
//       onTap: () {
//         // Handle tap
//       },
//       child: Card(
//         margin: const EdgeInsets.all(15),
//         elevation: 4,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Stack(
//             children: [
//               Image.network(
//                 widget.recipe['imageUrl'] ?? 'https://via.placeholder.com/150',
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 190,
//               ),
//                 Container(
//                   width: 80, // Adjust size accordingly
//                   height: 30,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 255, 225, 179),
//                     borderRadius: BorderRadius.circular(20),
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
//                         '${rating.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Color.fromARGB(255, 0, 0, 0),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                   Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     gradient: LinearGradient(
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                       colors: [
//                         const Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
//                         const Color.fromARGB(0, 0, 0, 0),
//                       ],
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.recipe['foodName'] ?? 'Untitled Recipe',
//                         style: const TextStyle(
//                           fontFamily: 'Poppins',
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.people_alt_outlined,
//                             color: Color.fromARGB(255, 231, 149, 91),
//                             size: 19,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             '${widget.recipe['servings'] ?? 'N/A'} serves',
//                             style: const TextStyle(
//                               fontFamily: 'Poppins',
//                               color: Colors.white,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           const Icon(
//                             Icons.timer,
//                             color: Color.fromARGB(255, 231, 149, 91),
//                             size: 18,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             '${widget.recipe['cookingDuration'] ?? 'N/A'} mins',
//                             style: const TextStyle(
//                               fontFamily: 'Poppins',
//                               color: Colors.white,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           const Icon(
//                             Icons.fireplace,
//                             color: Color.fromARGB(255, 231, 149, 91),
//                             size: 18,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             '${widget.recipe['calories'] ?? 'N/A'} kcal',
//                             style: const TextStyle(
//                               fontFamily: 'Poppins',
//                               color: Colors.white,
//                               fontSize: 13,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ));
//   }
// }


