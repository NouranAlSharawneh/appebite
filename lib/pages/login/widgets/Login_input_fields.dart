import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String emailInput = '';
  String passwordInput = '';
  bool _obscureText = true;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: widget.isPassword
                ? Stack(               
                    alignment: Alignment.centerRight,
                    children: [
                      TextFormField(
                        controller: widget.controller,
                        validator: (value) {
                          setState(() {
                            hasError = true;
                          });
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
                          filled: true,
                          fillColor: const Color(0xff353842),
                          labelText: widget.hint,
                          hintStyle: const TextStyle(
                            color: Color(0xff686f82),
                            height: 1,
                          ),
                          labelStyle:
                              const TextStyle(color: Color(0xff686f82)),
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
                        padding: 
                          hasError ?
                            const EdgeInsets.only(right: 10, bottom: 20, ) 
                            // no validation
                            : const EdgeInsets.only(bottom: 5, right: 10, top:0),
                      ),
                    ],
                  )
                : TextFormField(
                    controller: widget.controller,
                    validator: (value) {
                      setState(() {
                        hasError = value!.isNotEmpty &&
                            (!value.contains("@") || !value.contains("."));
                      });
                      if (value!.isEmpty) {
                        return 'Enter an email';
                      } else if (!value.contains("@") ||
                          !value.contains(".")) {
                        return 'Invalid a email format';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailInput = value!;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff353842),
                      labelText: widget.hint,
                      hintStyle: const TextStyle(
                        color: Color(0xff686f82),
                        height: 1,
                      ),
                      labelStyle:
                          const TextStyle(color: Color(0xff686f82)),
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
    );
  }
}