import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBirthYear extends StatefulWidget {
  const SignUpBirthYear({
    Key? key,
    required this.fem,
    required this.ffem,
    required this.onBirthYearChanged,
  }) : super(key: key);

  final double fem;
  final double ffem;
  final Function(int) onBirthYearChanged;

  @override
  State<SignUpBirthYear> createState() => _SignUpBirthYearState();
}

class _SignUpBirthYearState extends State<SignUpBirthYear> {
  String showYear = 'Select Year';
  DateTime _selectedYear = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedYear,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (picked != null && picked != _selectedYear) {
      setState(() {
        _selectedYear = picked;
        showYear = DateFormat('yyyy').format(_selectedYear);
      });
    }
  }

  selectYear(context) async {
    print("Calling year picker");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              
              firstDate: DateTime(DateTime.now().year - 10, 1),
              lastDate: DateTime(2025),
              initialDate: DateTime.now(),
              selectedDate: _selectedYear,
              onChanged: (DateTime dateTime) {
                print(dateTime.year);
                setState(() {
                  _selectedYear = dateTime;
                  showYear = "${dateTime.year}";
                  widget.onBirthYearChanged(dateTime.year);
                });
                Navigator.pop(context);
              },
            ), 
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0* widget.fem, 0 * widget.fem, 84.5 * widget.fem, 34 * widget.fem),
      width: double.infinity,
      height: 28 * widget.fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 63 * widget.fem, 3 * widget.fem),
            child: Text(
              'Birth year ',
              style: GoogleFonts.poppins(
                fontSize: 11 * widget.ffem,
                fontWeight: FontWeight.w400,
                height: 1.5 * widget.ffem / widget.fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => selectYear(context),
            child: Container(
              padding: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 40 * widget.fem, 0 * widget.fem),
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff353841),
                borderRadius: BorderRadius.circular(5 * widget.fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * widget.fem, 4 * widget.fem, 0 * widget.fem, 0 * widget.fem),
                    // width: 21 * widget.fem,
                    height: 21.21 * widget.fem,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 26 * widget.fem, 0 * widget.fem),
                    width: 0 * widget.fem,
                    height: 1 * widget.fem,
                    decoration: const BoxDecoration(
                      color: Color(0xff252830),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * widget.fem, 6.59 * widget.fem, 0 * widget.fem, 0 * widget.fem),
                    child: Text(
                      showYear,
                      style: GoogleFonts.poppins(
                        fontSize: 11 * widget.ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * widget.ffem / widget.fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
