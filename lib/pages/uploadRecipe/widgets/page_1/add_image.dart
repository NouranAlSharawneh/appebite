import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.onImageSelected,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final Function(File?) onImageSelected;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

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
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 24 * widget.fem),
        padding: EdgeInsets.fromLTRB(0 * widget.fem, 15 * widget.fem, 0 * widget.fem, 16 * widget.fem),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff686f82), width: 3),
          color: const Color(0xff353842),
          borderRadius: BorderRadius.circular(16 * widget.fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 40 * widget.fem),
              width: 80 * widget.fem,
              height: 40 * widget.fem,
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : const Icon(Icons.photo_rounded, size: 80, color: Color(0xff8e94a4)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 8 * widget.fem),
              child: Text(
                'Add Cover Photo',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15 * widget.ffem,
                  fontWeight: FontWeight.w700,
                  height: 1 * widget.ffem / widget.fem,
                  letterSpacing: 0.5 * widget.fem,
                  color: const Color(0xff8e94a4),
                ),
              ),
            ),
            Text(
              '(up to 12 Mb)',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12 * widget.ffem,
                fontWeight: FontWeight.w500,
                height: 1 * widget.ffem / widget.fem,
                letterSpacing: 0.5 * widget.fem,
                color: const Color(0xff9fa5c0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
