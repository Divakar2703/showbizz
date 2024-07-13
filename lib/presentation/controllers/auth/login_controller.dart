import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showbiz/api_helpers/api_manager.dart';
import 'package:showbiz/api_helpers/api_param.dart';
import 'package:showbiz/api_helpers/api_utils.dart';
import 'package:showbiz/dialogs/app_dialogs.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/models/auth_model.dart';
import 'package:showbiz/presentation/constant/app_hive.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/base_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/base_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Future<void> login() async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: StorageHelper().selectedUser == "business"
          ? Requests.businessLogin
          : Requests.login,
      ApiParam.email: emailController.text.toLowerCase(),
      ApiParam.password: passwordController.text,
    },
            endPoint: StorageHelper().selectedUser == "business"
                ? ApiUtils.business
                : ApiUtils.userLogin)
        .then((value) {
      log(value.toString());
      isLoading = false;
      AppDialogs.successSnackBar("Login Successful");
      AuthModel authModel = AuthModel.fromJson(value);
      StorageHelper().authData = authModel.data!;
      StorageHelper().selectedUser == "business"
          ? Get.offAllNamed(BaseBusinessScreen.routeName)
          : Get.offAllNamed(BaseScreen.routeName);
      // AppHive.getHive("user_type", "i_am").then(
      //   (value) {
      //     if (value == "business") {

      //     } else {

      //     }
      //   },
      // );

      update();
    }).onError(
      (error, stackTrace) {
        isLoading = false;
        update();
        AppDialogs.errorSnackBar(error.toString());
      },
    );
  }
}
