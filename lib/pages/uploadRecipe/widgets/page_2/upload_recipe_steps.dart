import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadRecipeSteps extends StatefulWidget {
  const UploadRecipeSteps({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  State<UploadRecipeSteps> createState() => _UploadRecipeStepsState();
}

class _UploadRecipeStepsState extends State<UploadRecipeSteps> {
  List<TextEditingController> controllers = [TextEditingController()];
  List<int> stepNumbers = [1];

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 250 * widget.fem),
                    child: Text(
                      'Steps ',
                      style: GoogleFonts.poppins(
                        fontSize: 17 * widget.ffem,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        int newStep = stepNumbers.length + 1;
                        stepNumbers.add(newStep);
                        controllers.add(TextEditingController());
                      });
                    },
                    child: SizedBox(
                      width: 24 * widget.fem,
                      height: 24 * widget.fem,
                      child: Icon(
                        Icons.add,
                        size: 24 * widget.fem,
                        color: const Color(0xffff7269),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stepNumbers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: UniqueKey(),
                    confirmDismiss: (DismissDirection direction) async {
                      bool confirmed = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          if (Theme.of(context).platform == TargetPlatform.iOS) {
                            // Use CupertinoAlertDialog for iOS
                            return CupertinoAlertDialog(
                              title: const Text("Confirm Deletion"),
                              content: const Text("Are you sure you want to delete this step?"),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Do not delete
                                  },
                                  child: const Text("Cancel"),
                                ),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop(true); // Confirm deletion
                                  },
                                  child: const Text("Delete"),
                                ),
                              ],
                            );
                          } else {
                            // Use AlertDialog for Android and other platforms
                            return AlertDialog(
                              title: const Text("Confirm Deletion"),
                              content: const Text("Are you sure you want to delete this step?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Do not delete
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true); // Confirm deletion
                                  },
                                  child: const Text("Delete"),
                                ),
                              ],
                            );
                          }
                        },
                      );

                      return confirmed;
                    },
                    onDismissed: (DismissDirection direction) {
                      // Handle step deletion here
                      if (direction == DismissDirection.startToEnd) {
                        // User confirmed deletion and dragged from the left
                        // Perform deletion logic here
                        // deleteStep();
                      }
                    },
                    background: Container(
                      color: const Color(0xffff7269),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 112 * widget.fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8 * widget.fem),
                            width: 24 * widget.fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10 * widget.fem),
                                  width: double.infinity,
                                  height: 24 * widget.fem,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe6955b),
                                    borderRadius: BorderRadius.circular(12 * widget.fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${stepNumbers[index]}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12 * widget.ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2125 * widget.ffem / widget.fem,
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
                            padding: EdgeInsets.fromLTRB(16 * widget.fem, 5 * widget.fem, 0* widget.fem, 16 * widget.fem),
                            width: 300 * widget.fem,
                            height: 100 * widget.fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xff353842)),
                              color: const Color(0xff353842),
                              borderRadius: BorderRadius.circular(8 * widget.fem),
                            ),
                            child: TextField(
                              controller: controllers[index],
                              style: GoogleFonts.poppins(
                                fontSize: 12 * widget.ffem,
                                fontWeight: FontWeight.w500,
                                height: 1 * widget.ffem / widget.fem,
                                letterSpacing: 0.5 * widget.fem,
                                color: const Color(0xffffffff),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Tell a little about your food',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 12 * widget.ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125 * widget.ffem / widget.fem,
                                  letterSpacing: 0.5 * widget.fem,
                                  color: const Color(0xff686f82),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
