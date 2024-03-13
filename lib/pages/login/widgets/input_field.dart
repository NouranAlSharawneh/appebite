import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.label,
    required this.hint,
    this.isPassword = false,
  }) : super(key: key);

  final String hint;
  final bool isPassword;
  final String label;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String emailInput = '';
  String passwordInput = '';

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff353842),
              borderRadius: BorderRadius.circular(13),
            ),
            child: widget.isPassword
                ? SizedBox(
                    height: 45,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            passwordInput = value!;
                          },
                          obscureText: _obscureText,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: widget.hint,
                            hintStyle:
                                const TextStyle(
                                  color: Color(0xff686f82),
                                  height: 1,
                                  ),
                            border: InputBorder.none,
                            errorStyle: const TextStyle(
                              color: Color(0xffff7269),
                              fontSize: 12.0,
                              height: 0.1, // Adjust height to position error text
                            ),
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
                  )
                : SizedBox(
                    height: 45,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter an email';
                        } else if (!value.contains("@") || !value.contains(".")) {
                          return 'Invalid a email format';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailInput = value!;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle:
                            const TextStyle(
                              color: Color(0xff686f82),
                              height: 1,
                              ),
                        border: InputBorder.none,
                        errorStyle: const TextStyle(
                          color: Color(0xffff7269),
                          fontSize: 12.0,
                          height: 0.5,                       
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
