import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showbiz/utils/app_colors.dart';
import 'package:showbiz/utils/app_widgets.dart';

class AppDialogs {
  static successSnackBar(String msg) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              msg,
              style: TextStyle(fontSize: 14, color: AppColors.whiteColor),
            )),
      );
    }
  }

  static errorSnackBar(String msg) {
    if (msg.isNotEmpty) {
      return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.redColor,
            content: Text(
              msg,
              style: TextStyle(fontSize: 14, color: Colors.white),
            )),
      );
    }
  }

  static showProcess() {
    return Get.dialog(
      barrierDismissible: false,
      AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: PopScope(canPop: false, child: AppWidgets.getLoadingView())),
    );
  }

  
}
