import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showbiz/dialogs/app_dialogs.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/controllers/auth/signup_controller.dart';
import 'package:showbiz/presentation/screen/auth/signin.dart';
import 'package:showbiz/presentation/screen/auth/signup.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';
import 'package:showbiz/utils/app_colors.dart';
import 'package:showbiz/utils/app_widgets.dart';

import '../../constant/constant.dart';

class AddBusinessLogo extends StatelessWidget {
  static const String routeName = "add_business_logo";

  const AddBusinessLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (signupController) {
          return Scaffold(
            backgroundColor: darkBlack,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "asset/images/bg_repeat.png",
                    ),
                    repeat: ImageRepeat.repeat),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/bg_repeat.png"),
                      repeat: ImageRepeat.repeat),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getDeviceSize(context).height * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Divider(
                                      height:
                                          getDeviceSize(context).height * 0.1,
                                      color: Colors.transparent,
                                    ),
                                    //! Pick Image
                                    GestureDetector(
                                      onTap: () {
                                        signupController.showPicker(context);
                                      },
                                      child: signupController.img == null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 4.0,
                                                    color: AppColors.bgSimple),
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                Icons.camera,
                                                size: getDeviceSize(context)
                                                        .width *
                                                    0.3,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 4.0,
                                                    color: AppColors.bgSimple),
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: Image.file(
                                                signupController.img!,
                                                width:
                                                    getDeviceHeight(context) *
                                                        0.3,
                                                height:
                                                    getDeviceHeight(context) *
                                                        0.2,
                                              )),
                                    ),
                                    SizedBox(
                                      height:
                                          getDeviceSize(context).width * 0.1,
                                    ),
                                    Text("Upload Business Logo",
                                        style: TextStyles.smallText.copyWith(
                                            color: lightWhiteTextColor),
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height:
                                          getDeviceSize(context).height * 0.4,
                                    ),
                                    signupController.isLoading
                                        ? AppWidgets.getLoadingView()
                                            .paddingOnly(top: 20, bottom: 20)
                                        : PrimaryBtn(
                                            labelString: "Continue",
                                            onTap: () {
                                              if (signupController.img !=
                                                  null) {
                                                signupController
                                                    .uploadProfilePicture();
                                              } else {
                                                AppDialogs.errorSnackBar(
                                                    "Select logo to continue");
                                              }
                                            },
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
