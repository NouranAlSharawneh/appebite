import 'dart:io';
import 'package:appebite/home_main.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/add_ingredient_field.dart';

class UploadFormButtons extends StatelessWidget {
  const UploadFormButtons({
    super.key,
    required this.fem,
    required this.ffem,
    required this.foodName,
    required this.description,
    required this.servings,
    required this.calories,
    required this.cookingDuration,
    required this.selectedImage,
    required this.ratingValue,
    required this.category,
    required this.cuisineType, 
    required this.ingredientFields, 
    required this.stepControllers,
  });

  final String calories;
  final String category; 
  final double cookingDuration;
  final String cuisineType;
  final String description;
  final double fem;
  final double ffem;
  final String foodName;
  final List<Widget> ingredientFields;
  final double ratingValue;
  final File? selectedImage;
  final String servings;
  final List<TextEditingController> stepControllers;

  void _showSuccessDialog(BuildContext context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        backgroundColor: const Color(0xff272a32),
        title: 'Recipe Uploaded',
        titleColor: Colors.white,
        text: "Your recipe has been uploaded, \nyou can see it on your home page \n",
        textColor: const Color(0xff686f82),
        confirmBtnColor: const Color(0xffff7269),
        confirmBtnText: 'Back home',
        onConfirmBtnTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration.zero,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    FadeTransition(
                  opacity: animation,
                  child: const HomeMain(),
                ),
              ),
            );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    // Function to handle the upload of recipe details to Firestore
  Future<void> uploadRecipe() async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Check if any required fields are empty
      if (foodName.isEmpty || description.isEmpty || servings.isEmpty || calories.isEmpty || category.isEmpty || selectedImage == null) {
        // Show scaffold message if any required field is empty
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill in all fields.'),
            duration: Duration(seconds: 5),
          ),
        );
        return; // Exit the function if any field is empty
      }

      // Show loader
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing the dialog
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff7269)),
            ), // Loader widget
          );
        },
      );

      String imageUrl = ''; // Initialize imageUrl variable

      // Upload image to Firebase Storage if an image is selected
      if (selectedImage != null) {
        // Generate a unique filename for the image
        String fileName = '${DateTime.now().millisecondsSinceEpoch}-${user.uid}.jpg';

        // Reference to the image location in Firebase Storage
        Reference ref = FirebaseStorage.instance.ref().child('recipe_images').child(fileName);

        // Upload the image file to Firebase Storage
        TaskSnapshot taskSnapshot = await ref.putFile(selectedImage!);

        // Get the download URL of the uploaded image
        imageUrl = await taskSnapshot.ref.getDownloadURL();
      }

      // Store ingredients in a List
      List<String> ingredients = [];
      for (Widget ingredientField in ingredientFields) {
        if (ingredientField is AddIngredientPage) {
          // Access the TextField's value
          String ingredient = ingredientField.controller.text;
          
          // Add ingredient to the list if it's not empty
          if (ingredient.isNotEmpty) {
            ingredients.add(ingredient);
          }
        }
      }

      // Store steps in a List
      List<String> steps = stepControllers.map((controller) => controller.text).toList();

      // Hide loader after upload is complete
      Navigator.pop(context);

      // Displaying the dialog
      _showSuccessDialog(context);

      // Store recipe data in Firestore under "recipes posted" collection
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .collection('recipes_posted')
          .add({
        'foodName': foodName,
        'description': description,
        'servings': servings,
        'calories': calories,
        'cookingDuration': cookingDuration,
        'imageUrl': imageUrl,
        'RecipeRating': ratingValue,
        'CuisineType': cuisineType,
        'Category': category,
        'Ingredients': ingredients,
        'Steps': steps,
      });     
    }
  } catch (error) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Uploading recipe failed. ${error.toString()}'),
        duration: const Duration(seconds: 6),
      ),
    );
  }
}


    return Container(
      margin: EdgeInsets.symmetric(vertical: 21 * fem),
      width: double.infinity,
      height: 56 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              width: 156 * fem,
              height: double.infinity,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff353842),
                  borderRadius: BorderRadius.circular(32 * fem),
                ),
                child: Center(
                  child: Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff686e81),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: uploadRecipe,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Container(
              width: 156 * fem,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffff7269),
                borderRadius: BorderRadius.circular(32 * fem),
              ),
              child: Center(
                child: Text(
                  'Upload',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w700,
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
