import 'package:appebite/pages/uploadRecipe/upload_recipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});
  final formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 45),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: REPLACE WITH THE HOMEPAGE WHEN ADDED
          final isValid = formKey.currentState.validate();
          if(isValid) {
            formKey.currentState!.save();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UploadRecipe()), 
            );
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 126, vertical: 18),
          backgroundColor: const Color(0xffff7269),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login ',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: const Color(0xffffffff),
              ),
            ),
            const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
