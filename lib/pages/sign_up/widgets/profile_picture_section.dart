import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePictureSection extends StatelessWidget {
  const ProfilePictureSection({super.key, required this.fem, required this.ffem});

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 315 * fem,
        height: 70, 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(39 * fem, 20 * fem, 0 * fem, 0 * fem),
                  child: Text(
                    'Add your profile picture  ',
                    style: GoogleFonts.poppins(
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10 * fem, top: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.photo,
                      color: const Color.fromRGBO(104, 111, 130, 100),
                      size: 48 * ffem,
                    ),
                    onPressed: _pickImage, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    // Implement image picking logic here
  }
}
