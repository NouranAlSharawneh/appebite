import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.emailController,
    required this.passwordController,
    this.firstNameController,
    this.lastNameController,
  }) : super(key: key);

  final TextEditingController emailController;
  final double fem;
  final double ffem;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController passwordController;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;
  bool hasError = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 16.5 * widget.fem),
        width: 316 * widget.fem,
        child: SizedBox(
          width: 316 * widget.fem,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      const SizedBox(width: 17.0),
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
                  const SizedBox(height: 8.0),
    
                  // Second row: Text Fields
                  Row(
                    children: [
                      // "First name" text field
                      Expanded(
                        child: TextFormField(
                          controller: widget.firstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter first name';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white,),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color.fromRGBO(104, 111, 130, 100),
                            ),
                            filled: true,
                            fillColor: const Color(0xff353842),
                            hintText: 'first name',
                            hintStyle:
                            const TextStyle(color:Color(0xff686f82),),
                            contentPadding: EdgeInsets.symmetric(vertical:15.0 * widget.fem, horizontal: 12* widget.fem),
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
                          errorStyle: const TextStyle(
                            color: Color(0xffff7269),
                            fontSize: 12.0,
                            height: 1, 
                          ),
                          ),
                        ),
                      ),
    
                      const SizedBox(width: 25.0), // Add some spacing between text fields
    
                      // "Last name" text field
                      Expanded(
                        child: TextFormField(
                          controller: widget.lastNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter last name';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'last name',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color.fromRGBO(104, 111, 130, 100),
                            ),
                            hintStyle:
                            const TextStyle(color: Color(0xff686f82)),
                            contentPadding: EdgeInsets.symmetric(vertical:15.0 * widget.fem, horizontal: 12* widget.fem),
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
                          errorStyle: const TextStyle(
                            color: Color(0xffff7269),
                            fontSize: 12.0,
                            height: 1, 
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter an email';
                          } else if (!value.contains("@") || !value.contains(".") || value.length < 8) {
                            return 'Invalid a email format';
                          }
                          return null;
                        },
                        controller: widget.emailController,
                        style
                        : const TextStyle(color: Colors.white),
                        decoration:InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromRGBO(104, 111, 130, 100),
                          ),
                          hintText: 'email address',
                          hintStyle: const TextStyle(color: Color(0xff686f82)),
                          contentPadding: EdgeInsets.symmetric(vertical:15.0 * widget.fem, horizontal: 12* widget.fem),                          
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
                        errorStyle: const TextStyle(
                          color: Color(0xffff7269),
                          fontSize: 12.0,
                          height: 1, 
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
                      SizedBox(
                        child: TextFormField(
                          validator: (value) {
                            setState(() {
                              hasError = true;
                            });

                            if (value!.isEmpty) {
                              return 'Enter a password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                            bool hasLowercase = value.contains(RegExp(r'[a-z]'));
                            bool hasDigit = value.contains(RegExp(r'\d'));
                            RegExp hasSpecialChar = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@_#\$&*~]).{8,}$');

                            if (!hasUppercase) {
                              return 'Password must include at least one uppercase letter';
                            }

                            if (!hasLowercase) {
                              return 'Password must include at least one lowercase letter';
                            }

                            if (!hasDigit) {
                              return 'Password must include at least one number';
                            }
                            if (!hasSpecialChar.hasMatch(value)) {
                              return 'Password must include at least one special character';
                            }
                            return null;
                          },
                          controller: widget.passwordController,
                          style: const TextStyle(color: Colors.white),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromRGBO(104, 111, 130, 100),
                            ),
                            hintStyle: const TextStyle(color: Color(0xff686f82)),
                            filled: true,
                            fillColor: const Color(0xff353842),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(
                                color: Color(0xff686f82),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(
                                color: Color(0xffff7269),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(
                                color: Color(0xff686f82),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(
                                color: Color(0xffff7269),
                              ),
                            ),
                            errorStyle: const TextStyle(
                              color: Color(0xffff7269),
                              fontSize: 12.0,
                            ),
                            suffixIcon: IconButton(
                              onPressed: _togglePasswordVisibility,
                              icon: Icon(
                                _obscureText ? Icons.visibility : Icons.visibility_off,
                                color: const Color.fromRGBO(104, 111, 130, 100),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical:15.0 * widget.fem, horizontal: 12* widget.fem),
                          ),
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
