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

  selectYear(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff272a32),
          title: const Text(
            "Select birthyear",
            style: TextStyle(color: Colors.white, fontSize: 20), 
          ),
          contentTextStyle: const TextStyle(color: Colors.white), 
          titleTextStyle: const TextStyle(color: Colors.white),
          content: SizedBox(
            width: 300,
            child: YearPicker(             
              firstDate: DateTime(DateTime.now().year - 90, 1),
              lastDate: DateTime(DateTime.now().year),
              initialDate: DateTime.now(),
              selectedDate: _selectedYear,
              onChanged: (DateTime dateTime) {
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

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedYear,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder:(context, child) => 
        Theme(
          data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xffff7269), 
              onPrimary: Colors.white,
              onSurface: Colors.white,
          ),
        ), child: child!,
      ),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (picked != null && picked != _selectedYear) {
      setState(() {
        _selectedYear = picked;
        showYear = DateFormat('yyyy').format(_selectedYear);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45 * widget.fem,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Birth year',
            style: GoogleFonts.poppins(
              fontSize: 11 * widget.ffem,
              fontWeight: FontWeight.w400,
              color: const Color(0xffffffff),
            ),
          ),
          SizedBox(width: 41*widget.fem,),
          GestureDetector(
            onTap: () => selectYear(context),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff353841),
                borderRadius: BorderRadius.circular(13 * widget.fem),
                border: Border.all(
                        color:const Color(0xff686f82),
                        width: 0.3,
                      )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 180 * widget.fem,
                    padding: EdgeInsets.only(left:30 * widget.fem),
                    decoration: const BoxDecoration(
                      color: Color(0xff353841),
                    ),

                    child: Text(
                      showYear,
                      style: GoogleFonts.poppins(
                        fontSize: 13 * widget.ffem,
                        fontWeight: FontWeight.w500,
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
