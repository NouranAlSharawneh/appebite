import 'dart:io';
import 'package:appebite/pages/uploadRecipe/widgets/page_2/add_ingredient_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadFormButtons extends StatelessWidget {
  const UploadFormButtons({
    Key? key,
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
    required this.cuisineType, required this.ingredientFields,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final String foodName;
  final String description;
  final String servings;
  final String calories;
  final double cookingDuration;
  final File? selectedImage;
  final double ratingValue;
  final String category; 
  final String cuisineType;
  final List<Widget> ingredientFields;

  @override
  Widget build(BuildContext context) {
    // Function to handle the upload of recipe details to Firestore
    Future<void> uploadRecipe() async {
      try {
        // Get the current user
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
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
              // Access the TextField's value and add to the ingredients list
              String ingredient = ingredientField.controller.text;
              ingredients.add(ingredient);
            }
          }
          print(ingredients);

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
          });

          // Navigate to a new page or perform any other action after upload
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const UploadRecipePage2()),
          // );
        }
      } catch (error) {
        print('Error uploading recipe: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Uploading recipe failed. ${error.toString()}'),
            duration: const Duration(seconds: 6),
          ),
          );
      }
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 21 * fem),
      width: double.infinity,
      height: 56 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 15 * fem, 0 * fem),
            child: TextButton(
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
                        height: 1.2 * ffem / fem,
                        color: const Color(0xff686e81),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                    height: 1.2125 * ffem / fem,
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
