import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomDialog {
  static bool _isShowing = false;

  static showProgressDialog() {
    // function to show custom progress dialog
    _isShowing = true;
    Get.dialog(
      const PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Thinking...",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              SpinKitPouringHourGlassRefined(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static closeProgressDialog() {
    // function to close the progress dialog
    if (_isShowing) {
      Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
      _isShowing = false;
    }
  }
}
