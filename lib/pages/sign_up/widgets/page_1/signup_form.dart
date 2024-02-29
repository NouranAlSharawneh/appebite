import 'package:appebite/pages/sign_up/widgets/page_2/signup_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.fem,
    required this.ffem,
  }) : super(key: key);

  final double fem;
  final double ffem;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;
  String firstNameInput = '';
  String lastNameInput = '';
  String emailInput = '';
  String passwordInput = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 16.5 * widget.fem, 18.83 * widget.fem),
      width: 316 * widget.fem,
      height: 330 * widget.fem,
      child: SizedBox(
        width: 316 * widget.fem,
        height: 313 * widget.fem,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First row: Labels
                Row(
                  children: [
                    // "First name" label
                    Expanded(
                      child: Text(
                        'First name',
                        style: GoogleFonts.poppins(
                          fontSize: 14 * widget.ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * widget.ffem / widget.fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    // "Last name" label
                    Expanded(
                      child: Text(
                        'Last name',
                        style: GoogleFonts.poppins(
                          fontSize: 14 * widget.ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * widget.ffem / widget.fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0), // Add some spacing between rows

                // Second row: Text Fields
                Row(
                  children: [
                    // "First name" text field
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff353842),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter first name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            firstNameInput = value!;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromRGBO(104, 111, 130, 100),
                            ),
                            hintText: 'first name',
                            hintStyle:
                                TextStyle(color: Color(0xff686f82)),
                            contentPadding: EdgeInsets.all(12.0),
                            border: InputBorder.none,
                            errorStyle: TextStyle(
                              color: Color(0xffff7269),
                              fontSize: 12.0,
                              height: 0.5
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 25.0), // Add some spacing between text fields

                    // "Last name" text field
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff353842),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter last name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            lastNameInput = value!;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'last name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromRGBO(104, 111, 130, 100),
                            ),
                            hintStyle:
                                TextStyle(color: Color(0xff686f82)),
                            contentPadding: EdgeInsets.all(12.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0), // Add some spacing between rows

                // Third row: Labels
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Email" label
                    Text(
                      'Email address',
                      style: GoogleFonts.poppins(
                        fontSize: 14 * widget.ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * widget.ffem / widget.fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Fourth row: Text Field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff353842),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        style:const TextStyle(color: Colors.white),
                        decoration:const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromRGBO(104, 111, 130, 100),
                          ),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Color(0xff686f82)),
                          contentPadding: EdgeInsets.all(12.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Fifth row: Labels
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Password" label
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        fontSize: 14 * widget.ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * widget.ffem / widget.fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(height: 8.0),

                    // Sixth row: Text Field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff353842),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SizedBox(
                        height: 45,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              obscureText: _obscureText,
                              decoration: const InputDecoration(
                                hintText: 'Enter your password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color.fromRGBO(104, 111, 130, 100),
                                ),
                                hintStyle: TextStyle(color: Color(0xff686f82)),
                                contentPadding: EdgeInsets.all(12.0),
                                border: InputBorder.none,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromRGBO(104, 111, 130, 100),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SignUpProfilePicture(fem: widget.fem, ffem: widget.ffem),
          ],
        ),
      ),
    );
  }
}

