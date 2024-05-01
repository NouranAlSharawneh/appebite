import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadRecipeSteps extends StatefulWidget {
  const UploadRecipeSteps({
    super.key,
    required this.fem,
    required this.ffem,
    required this.stepsControllers,
    required this.addStepCallback,
    required this.deleteStepCallback,
  });

  final double fem;
  final double ffem;
  final List<TextEditingController> stepsControllers;
  final VoidCallback addStepCallback;
  final Function(int) deleteStepCallback;

  @override
  State<UploadRecipeSteps> createState() => _UploadRecipeStepsState();
}

class _UploadRecipeStepsState extends State<UploadRecipeSteps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10*widget.fem),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10*widget.fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Steps ',
                      style: GoogleFonts.poppins(
                        fontSize: 17 * widget.ffem,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: widget.addStepCallback,
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
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.stepsControllers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: ValueKey(widget.stepsControllers[index]),
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
                      widget.deleteStepCallback(index);
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
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15 * widget.fem),
                      width: double.infinity,
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
                                    borderRadius: BorderRadius.circular(13 * widget.fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12 * widget.ffem,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
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
                          Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(16 * widget.fem, 5 * widget.fem, 0 * widget.fem, 16 * widget.fem),
                              width: 300 * widget.fem,
                              height: 100 * widget.fem,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff353842)),
                                color: const Color(0xff353842),
                                borderRadius: BorderRadius.circular(8 * widget.fem),
                              ),
                              child: TextField(
                                controller: widget.stepsControllers[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 13 * widget.ffem,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffffffff),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Tell a little about your food',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 12 * widget.ffem,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff686f82),
                                  ),
                                  border: InputBorder.none,
                                ),
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
