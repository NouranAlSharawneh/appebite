import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsEditInformation extends StatefulWidget {
  const SettingsEditInformation({Key? key}) : super(key: key);

  @override
  State<SettingsEditInformation> createState() => _SettingsEditInformationState();
}

class _SettingsEditInformationState extends State<SettingsEditInformation> {
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
          padding: EdgeInsets.fromLTRB(26 * fem, 120 * fem, 26 * fem, 8 * fem),
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
                      const Spacer(), // Add Spacer widget to occupy maximum space between widgets
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
                  'Hello user name,',
                  style: GoogleFonts.poppins(
                    fontSize: 13 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * ffem / fem,
                    color: const Color(0xff8e94a4),
                  ),
                ),
              ),
              const SizedBox(height: 80,),
              Center(
                child: SizedBox(
                  width: 300 * fem,
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
                          border: Border.all(color: const Color(0xffe6955b)),
                          color: const Color(0xff686e81),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Center(
                          child: Opacity(
                            opacity: 0.8,
                            child: SizedBox(
                              width: 73 * fem,
                              height: 74 * fem,
                              child: Image.asset(
                                'assets/images/profile.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60,),
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
                  margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 28 * fem),
                  width: 250 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 27 * fem),
                        width: double.infinity,
                        height: 28 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 37 * fem, 2 * fem),
                              child: Text(
                                'Current weight',
                                style: GoogleFonts.poppins(
                                  fontSize: 11 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff353842),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.justify,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 12 * fem, 10 * fem),
                                    prefix: Text(
                                      'kg  ',
                                      style: TextStyle(
                                        color: const Color(0xff686f82),
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                      ),
                                    ),
                                    hintText: '55',
                                    hintStyle: const TextStyle(color: Color(0xff686f82)),
                                    border: InputBorder.none,
                                    errorStyle: const TextStyle(
                                      color: Color(0xffff7269),
                                      fontSize: 12.0,
                                      height: 0.02
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 28 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 3 * fem, 39 * fem, 0 * fem),
                              child: Text(
                                'Current height',
                                style: GoogleFonts.poppins(
                                  fontSize: 11 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff353842),
                                  borderRadius: BorderRadius.circular(8 * fem),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.justify,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 12 * fem, 10 * fem),
                                    prefix: Text(
                                      'cm  ',
                                      style: TextStyle(
                                        color: const Color(0xff686f82),
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                      ),
                                    ),
                                    hintText: '173',
                                    hintStyle: const TextStyle(color: Color(0xff686f82)),
                                    border: InputBorder.none,
                                    errorStyle: const TextStyle(
                                      color: Color(0xffff7269),
                                      fontSize: 12.0,
                                      height: 0.02
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60,),
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
                        onPressed: () {
                          // Handle cancel button press
                        },
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
                        onPressed: () {
                          // Handle save button press
                        },
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
