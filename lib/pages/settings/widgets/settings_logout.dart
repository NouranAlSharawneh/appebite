import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appebite/pages/login/login_screen.dart';
import 'package:appebite/pages/settings/settings_edit_information.dart';

class SettingLogout extends StatefulWidget {
  const SettingLogout({Key? key}) : super(key: key);

  @override
  State<SettingLogout> createState() => _SettingLogoutState();
}

class _SettingLogoutState extends State<SettingLogout> {
  FirebaseAuth auth = FirebaseAuth.instance;

  void _showDialog(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      backgroundColor: const Color(0xff272a32),
      title: 'Are you sure',
      titleColor: Colors.white,
      text: "Are you sure you\nwant to logout? \n",
      textColor: const Color(0xff686f82),
      confirmBtnColor: const Color(0xffff7269),
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      onConfirmBtnTap: () {
        _logout();
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              child: const LoginPage(),
            ),
          ),
        );
      }
    );
  }

  void _logout() async {
    await auth.signOut();
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
          opacity: animation,
          child: const LoginPage(),
        ),
      ),
    );
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
          opacity: animation,
          child: const SettingsEditInformation(),
        ),
      ),
    );
  }


  void showLogoutOptions() {
    showModalBottomSheet(
      backgroundColor: const Color(0xff272a32),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('Logout', style: TextStyle(color: Colors.white),),
              onTap: () {
                _showDialog(context);
              },
            ),
            ListTile(
              title:const Text('User Settings', style: TextStyle(color: Colors.white),),
              onTap: () {
                _navigateToSettings();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Your main UI widget here
    return Container();
  }
}
