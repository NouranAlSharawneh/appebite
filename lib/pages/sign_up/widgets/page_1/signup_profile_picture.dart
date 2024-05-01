import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfilePicture extends StatefulWidget {
  const SignUpProfilePicture({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.onImageSelected,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final Function(File?) onImageSelected;

  @override
  State<SignUpProfilePicture> createState() => _SignUpProfilePictureState();
}

class _SignUpProfilePictureState extends State<SignUpProfilePicture> {
  File? _image;
  late ImagePicker _picker;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
  }

  Future<void> _pickImage() async {
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    setState(() {
      _image = File(pickedFile.path);
    });

    widget.onImageSelected(_image);
  }
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 315 * widget.fem,
        height: 85 * widget.fem,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20 * widget.fem),
                  child: Text(
                    'Add your profile picture  ',
                    style: GoogleFonts.poppins(
                      fontSize: 14 * widget.ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * widget.ffem / widget.fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    margin: EdgeInsets.only(right: 10 * widget.fem, top: 20),
                    child: _image != null
                        ? CircleAvatar(
                            radius: 30 * widget.ffem,
                            backgroundImage: FileImage(_image!),
                          )
                        : Icon(
                            Icons.photo,
                            color: const Color.fromRGBO(104, 111, 130, 100),
                            size: 48 * widget.ffem,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
