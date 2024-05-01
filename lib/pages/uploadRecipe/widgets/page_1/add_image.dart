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
  bool _imageSelected = false;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imageSelected = true;
      });

      widget.onImageSelected(_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10 * widget.fem),
        padding: EdgeInsets.only(top: 10 * widget.fem, bottom: 10 * widget.fem,),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff686f82), width: 3),
          color: const Color(0xff353842),
          borderRadius: BorderRadius.circular(13 * widget.fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200 * widget.fem,
              height: 100 * widget.fem,
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(13 * widget.fem),
                      child: Image.file(_image!, fit: BoxFit.cover),
                    )
                  : const Icon(Icons.photo_rounded, size: 80, color: Color(0xff8e94a4)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5 * widget.fem),
              child: Text(
                _imageSelected ? 'Change Cover Photo' : 'Add Cover Photo',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15 * widget.ffem,
                  fontWeight: FontWeight.w700,
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
                color: const Color(0xff9fa5c0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
