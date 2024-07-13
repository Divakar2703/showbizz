import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showbiz/api_helpers/api_manager.dart';
import 'package:showbiz/api_helpers/api_param.dart';
import 'package:showbiz/api_helpers/api_utils.dart';
import 'package:showbiz/dialogs/app_dialogs.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/models/auth_model.dart';
import 'package:showbiz/presentation/screen/auth/add_business_logo.dart';
import 'package:showbiz/presentation/screen/auth/signin.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();

  XFile? imagex;
  File? img;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool showPwd = true;
  bool showConfirmPwd = true;
  Future<void> businessRegister() async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: Requests.registerBusiness,
      ApiParam.businessName: nameController.text.toString(),
      ApiParam.email: emailController.text.toLowerCase(),
      ApiParam.password: passwordController.text,
      ApiParam.phone: countryController.text + contactController.text,
    }, endPoint: ApiUtils.business)
        .then((value) {
      print("value.toString()");
      print(value.toString());
      isLoading = false;
      AuthModel authModel = AuthModel.fromJson(value);

      StorageHelper().authData = authModel.data!;
      StorageHelper().isLoggedIn = true;
      StorageHelper().isGuest = false;
      AppDialogs.successSnackBar(
          "Registration successful, Please login to continue");
      // Get.offAll(() => const AddBusinessLogo());
      update();
    }).onError(
      (error, stackTrace) {
        isLoading = false;
        update();
        AppDialogs.errorSnackBar(error.toString());
      },
    );
  }

  showHidePwd() {
    // if (showPwd) {
    //   showPwd = false;
    // } else {
    //   showPwd = true;
    // }
    showPwd = !showPwd;
    print("Updated password obsure $showPwd");
    // update();
  }

  showHideConfirmPwd() {
    if (showConfirmPwd) {
      showConfirmPwd = false;
    } else {
      showConfirmPwd = true;
    }
    // update();
  }

  Future<void> userRegister() async {
    isLoading = true;
    update();
    ApiManager.callPost({
      ApiParam.request: Requests.register,
      ApiParam.name: nameController.text.toString(),
      ApiParam.email: emailController.text.toLowerCase(),
      ApiParam.password: passwordController.text,
    }, endPoint: ApiUtils.userRegister)
        .then((value) {
      isLoading = false;
      AuthModel authModel = AuthModel.fromJson(value);
      if (kDebugMode) {
        print("authModel.data!");
        print(authModel.data!);
      }

      StorageHelper().authData = authModel.data!;
      StorageHelper().isLoggedIn = true;
      StorageHelper().isGuest = false;

      AppDialogs.successSnackBar(
          "Registration successful, Please login to continue");
      // Get.offAll(() => const AddBusinessLogo());

      update();
    }).onError(
      (error, stackTrace) {
        isLoading = false;
        update();
        AppDialogs.errorSnackBar(error.toString());
      },
    );
  }

  Future<void> uploadProfilePicture() async {
    if (StorageHelper().authData.userId != null) {
      isLoading = true;
      update();
      ApiManager.callMultiPartPost({
        ApiParam.request: Requests.addLogo,
        ApiParam.businessId: StorageHelper().authData.userId ?? "",
      }, endPoint: ApiUtils.saveBusiness, imgParam: 'logo', imgPath: img!.path)
          .then((value) {
        isLoading = false;
        AppDialogs.successSnackBar("Business Logo uploaded successfully");
        Get.offAll(() => const AddBusinessLogo());
        // AuthModel authModel = AuthModel.fromJson(value);
        // StorageHelper().authData = authModel.d   ata!;
        // StorageHelper().isLoggedIn = true;
        // StorageHelper().isGuest = false;

        update();
      }).onError(
        (error, stackTrace) {
          isLoading = false;
          update();
          print(error.toString());
          AppDialogs.errorSnackBar("Something went wrong, please try again");
        },
      );
    } else {
      AppDialogs.errorSnackBar("Not Found");
    }
  }

  showPicker(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Select source'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Camera'),
              onPressed: () async {
                Navigator.pop(context);
                imagex = await ImagePicker().pickImage(
                  maxWidth: 600,
                  maxHeight: 600,
                  source: ImageSource.camera,
                );
                img = File(imagex!.path);

                update();
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Gallery'),
              onPressed: () async {
                Navigator.pop(context);
                // final pickedFile = await imagex?.pickImage(source: ImageSource.gallery);
                // if (pickedFile != null) {
                //   // Handle the picked file
                //   print('Picked file: ${pickedFile.path}');
                // }
                imagex = await ImagePicker().pickImage(
                  maxWidth: 600,
                  maxHeight: 600,
                  source: ImageSource.gallery,
                );
                img = File(imagex!.path);
                update();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
