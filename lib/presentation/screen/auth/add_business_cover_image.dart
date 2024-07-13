import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showbiz/presentation/screen/UserScreens/base_screen.dart';
import '../../../dialogs/app_dialogs.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_widgets.dart';
import '../../constant/constant.dart';
import '../../constant/size_constant.dart';
import '../../constant/text_style.dart';
import '../../controllers/auth/signup_controller.dart';
import '../../widget/button/primary_btn.dart';

class AddBusinessCoverImage extends StatelessWidget {
  static const String routeName = "add_business_cover_image";
  const AddBusinessCoverImage({super.key});

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
                                        padding: const EdgeInsets.all(10),
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
                                          padding: const EdgeInsets.all(10),
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
                                    Text("Upload Business Cover Image",
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
                                          Navigator.pushNamed(context, BaseScreen.routeName);

                                        } else {
                                          AppDialogs.errorSnackBar(
                                              "Select Cover Image to continue");
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
