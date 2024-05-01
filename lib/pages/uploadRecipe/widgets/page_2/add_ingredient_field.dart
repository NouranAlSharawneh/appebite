import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; 
import 'package:google_fonts/google_fonts.dart';

class AddIngredientPage extends StatefulWidget {
  const AddIngredientPage({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<AddIngredientPage> createState() => _AddIngredientPageState();
  
}

class _AddIngredientPageState extends State<AddIngredientPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Dismissible(
    key: UniqueKey(),
    confirmDismiss: (DismissDirection direction) async {
      bool confirmed = await showDialog(
        context: context,
        builder: (BuildContext context) {
          // Use CupertinoAlertDialog for iOS
          if (Theme.of(context).platform == TargetPlatform.iOS) {
            return CupertinoAlertDialog(
              title: const Text("Confirm Deletion"),
              content: const Text("Are you sure you want to delete this ingredient?"),
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
              content: const Text("Are you sure you want to delete this ingredient?"),
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
      setState(() {
        widget.controller.clear(); // Clear the text when dismissed
      });
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
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 15),
      width: double.infinity,
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: 24,
            height: 24,
            child: const Icon(
              Icons.drag_indicator_outlined,
              size: 24,
              color: Color(0xff686f82),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff353842)),
                color: const Color(0xff353842),
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextField(
                controller: widget.controller,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffffffff),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xff353842),
                  hintText: 'Enter ingredient',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff686f82),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}