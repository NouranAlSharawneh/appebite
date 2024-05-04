import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appebite/pages/MeSection/me_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SettingsEditInformation extends StatefulWidget {
  const SettingsEditInformation({Key? key}) : super(key: key);

  @override
  State<SettingsEditInformation> createState() =>
      _SettingsEditInformationState();
}

class _SettingsEditInformationState extends State<SettingsEditInformation> {
  late String _currentHeight = ''; 
  late String _currentWeight = '';
  late TextEditingController _heightController;
  late String _newProfilePictureUrl = '';
  final ImagePicker _picker = ImagePicker();
  late String _profilePictureUrl = '';
  late String _userName = '';
  late TextEditingController _weightController;

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
    _weightController = TextEditingController();
    _heightController = TextEditingController();
  }

  void _showSuccessDialog(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      backgroundColor: const Color(0xff272a32),
      title: 'Changes Saved',
      titleColor: Colors.white,
      text: "All of the changes that you \nhave made are now saved! \n",
      textColor: const Color(0xff686f82),
      confirmBtnColor: const Color(0xffff7269),
      confirmBtnText: 'okay',
      onCancelBtnTap: () => Navigator.pop(context),
      onConfirmBtnTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              child: const UserBar(),
            ),
          ),
        );
      }
    );
  }

  Future<void> _fetchUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get();

      setState(() {
        _userName = userInfo['firstName'];
        _profilePictureUrl = userInfo['profilePictureUrl'];
        _newProfilePictureUrl = _profilePictureUrl;
        _currentHeight = userInfo['height']; 
        _currentWeight = userInfo['weight'];

        _weightController.text = _currentWeight;
        _heightController.text = _currentHeight;
      });
    }
  }

  Future<void> _changeProfilePicture() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload the selected image to Firebase Storage
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child(FirebaseAuth.instance.currentUser!.uid);
      UploadTask uploadTask = ref.putFile(File(pickedFile.path));
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String newUrl = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        _newProfilePictureUrl = newUrl;
      });
    }
  }

  void _cancelChange() {
    setState(() {
      _newProfilePictureUrl = _profilePictureUrl;
      _currentHeight = _currentHeight;
      _currentWeight = _currentWeight;
    });
    
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(
            opacity: animation,
            child: const UserBar(),
          ),
        ),
      );

  }

Future<void> _saveChange() async {
  // Check if height and weight are not empty
  if (_currentHeight.isNotEmpty && _currentWeight.isNotEmpty) {
    // Save the new picture URL to database
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String newUrl = _newProfilePictureUrl;

        // Update profile picture URL in Firestore
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(user.uid)
            .update({'profilePictureUrl': newUrl,
                     'height': _currentHeight, // Update height in Firestore
                     'weight': _currentWeight}); // Update weight in Firestore
        // Update local state
        setState(() {
          _profilePictureUrl = newUrl;
        });

        // Show success dialog
        _showSuccessDialog(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error saving profile picture: $e'),
        duration: const Duration(seconds: 3),
      ),
    );
    }
  } else {
    // Show snackbar message if height or weight is empty
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill both height and weight fields.'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    double baseWidth = 400;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: const Color(0xff272a32),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.fromLTRB(36 * fem, 120 * fem, 36 * fem, 8 * fem),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff272a32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Settings',
                        style: GoogleFonts.poppins(
                          fontSize: 25 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 32 * fem,
                        height: 32 * fem,
                        child: const Icon(
                          Icons.edit,
                          size: 40,
                          color: Color(0xffff7269),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  'Hello $_userName,',
                  style: GoogleFonts.poppins(
                    fontSize: 13 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * ffem / fem,
                    color: const Color(0xff8e94a4),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: _changeProfilePicture,
                child: Center(
                  child: SizedBox(
                    width: 250 * fem,
                    height: 74 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Edit profile picture',
                          style: GoogleFonts.poppins(
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 73 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffe6955b),
                              width: 3,
                            ),
                            color: const Color(0xff272a32),
                            borderRadius: BorderRadius.circular(10 * fem),
                          ),
                          child: Center(
                            child: _newProfilePictureUrl.isEmpty
                                ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff7269)),
                                ) 
                                : Opacity(
                                    opacity: 0.8,
                                    child: SizedBox(
                                      width: 73 * fem,
                                      height: 74 * fem,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10 * fem),
                                        child: _newProfilePictureUrl.startsWith("http")
                                            ? Image.network(
                                                _newProfilePictureUrl,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(
                                                File(_newProfilePictureUrl),
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Personal information',
                style: GoogleFonts.poppins(
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.5 * ffem / fem,
                  color: const Color(0xffffffff),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 30 * fem, 0 * fem, 15 * fem),
                  width: 270 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Current weight',
                            style: GoogleFonts.poppins(
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: TextFormField(
                              controller: _weightController, 
                                onChanged: (value) {
                                  setState(() {
                                    _currentWeight = value; 
                                  });
                                },
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                prefix: Text(
                                  'kg  ',
                                  style: TextStyle(
                                    color: const Color(0xff686f82),
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                hintText: _currentWeight,
                                hintStyle: const TextStyle(color: Color(0xff686f82)),
                                filled: true,
                                fillColor: const Color.fromRGBO(55, 56, 66, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color:Color(0xff686f82),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color:  Color(0xffff7269) 
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color:Color(0xff686f82),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color: Color(0xffff7269) 
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Current height',
                            style: GoogleFonts.poppins(
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: TextFormField(
                              controller: _heightController, 
                                onChanged: (value) {
                                  setState(() {
                                    _currentHeight = value; 
                                  });
                                },
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),                    
                                prefix: Text(
                                  'cm  ',
                                  style: TextStyle(
                                    color: const Color(0xff686f82),
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                hintText: _currentHeight,
                                hintStyle: const TextStyle(color: Color(0xff686f82)),
                                filled: true,
                                fillColor: const Color(0xff353842),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color:Color(0xff686f82),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color:  Color(0xffff7269) 
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color:Color(0xff686f82),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                    color: Color(0xffff7269) 
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: double.infinity,
                height: 56 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 156 * fem,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff353842),
                        borderRadius: BorderRadius.circular(32 * fem),
                      ),
                      child: TextButton(
                        onPressed: _cancelChange,
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff686e81),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                        width: 156 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffff7269),
                          borderRadius: BorderRadius.circular(32 * fem),
                        ),
                        child: TextButton(
                            onPressed: _saveChange,
                            child: Text(
                                'Save',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    color: Colors.white
                                )
                            )
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
