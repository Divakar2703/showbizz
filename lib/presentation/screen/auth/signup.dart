import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/auth/signin.dart';
import 'package:showbiz/presentation/screen/UserScreens/base_screen.dart';
import 'package:showbiz/presentation/controllers/auth/signup_controller.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';
import 'package:showbiz/utils/app_function.dart';
import 'package:showbiz/utils/app_validation.dart';
import 'package:showbiz/utils/app_widgets.dart';

import '../../constant/constant.dart';
import '../../widget/text_input_widget.dart';
import 'forgot_password.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "signup";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // Get.put(SignupController());
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (signupController) {
          return Scaffold(
            backgroundColor: darkBlack,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/bg_repeat.png"),
                    repeat: ImageRepeat.repeat),
              ),
              child: SafeArea(
                child: Form(
                  key: signupController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const DividerWidget(height: 10),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Hero(
                                  tag: logoHeroString,
                                  child: LogoWidget(
                                    imageHeight:
                                        getDeviceSize(context).height * 0.2,
                                    textHeight: 15,
                                  ))),
                        ),
                        DividerWidget(
                            height: getDeviceSize(context).height * 0.05),
                        Text("Sign Up",
                            style: TextStyles.largerText.copyWith(
                                fontWeight: FontWeight.bold,
                                color: lightWhiteTextColor),
                            textAlign: TextAlign.center),
                        DividerWidget(
                            height: getDeviceSize(context).height * 0.03),
                        AppInputTextField(
                          controller: signupController.nameController,
                          validator: AppValidation.checkEmpty,
                          hint: "Your Name",
                          hintTextColor: lightWhiteTextColor,
                          focusedBorderColor: buttonLightPurple,
                          suffixIcon: const Icon(
                            Icons.check,
                            color: white,
                          ),
                        ).paddingOnly(bottom: 20),
                        Row(
                          children: [
                            if (StorageHelper().selectedUser == "business")
                              CountryCodePicker(
                                onChanged: print,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'US',
                                showCountryOnly: true,
                                // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                                flagDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            if (StorageHelper().selectedUser == "business")
                              Expanded(
                                child: AppInputTextField(
                                  controller:
                                      signupController.contactController,
                                  validator: AppValidation.checkEmpty,
                                  hint: "Your Number",
                                  keyboardType: TextInputType.number,
                                  hintTextColor: lightWhiteTextColor,
                                  focusedBorderColor: buttonLightPurple,
                                  suffixIcon: const Icon(
                                    Icons.check,
                                    color: white,
                                  ),
                                ).paddingOnly(bottom: 20),
                              ),
                          ],
                        ),
                        AppInputTextField(
                          controller: signupController.emailController,
                          validator: AppValidation.validatesEmail,
                          hint: "Your Email",
                          hintTextColor: lightWhiteTextColor,
                          focusedBorderColor: buttonLightPurple,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: const Icon(
                            Icons.check,
                            color: white,
                          ),
                        ),
                        const DividerWidget(height: 20),
                        AppInputTextField(
                          controller: signupController.passwordController,
                          validator: AppValidation.validatesPassword,
                          hint: "Password",
                          hintTextColor: lightWhiteTextColor,
                          focusedBorderColor: buttonLightPurple,
                          isObscure: signupController.showPwd,
                          suffixIcon: IconButton(
                            onPressed: signupController.showHidePwd(),
                            icon:   Icon(
                            signupController.showPwd?  Icons.remove_red_eye:Icons.visibility_off,
                              color: white,
                            ),
                          ),
                        ),
                        const DividerWidget(height: 20),
                        AppInputTextField(
                          controller: signupController.cnfPasswordController,
                          validator: AppValidation.validatesPassword,
                          hint: "Confirm Password",
                          isObscure: signupController.showConfirmPwd,
                          hintTextColor: lightWhiteTextColor,
                          focusedBorderColor: buttonLightPurple,
                          suffixIcon: GestureDetector(
                            onTap: signupController.showHideConfirmPwd(),
                            child:   Icon(
                             signupController.showConfirmPwd?  Icons.remove_red_eye:Icons.visibility_off,
                              color: white,
                            ),
                          ),
                        ),
                        DividerWidget(
                            height: getDeviceSize(context).height * 0.031),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     CupertinoButton(
                        //       padding: EdgeInsets.zero,
                        //       onPressed: () {
                        //         Future.delayed(
                        //           const Duration(milliseconds: 50),
                        //           () {
                        //             Navigator.pushNamed(
                        //                 context, ForgotPasswordScreen.routeName);
                        //           },
                        //         );
                        //       },
                        //       child: Text(
                        //         "Forgot passsword?",
                        //         style: TextStyles.smallestText.copyWith(
                        //             fontWeight: FontWeight.normal,
                        //             color: white.withOpacity(0.6)),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const DividerWidget(height: 10),
                        signupController.isLoading
                            ? AppWidgets.getLoadingView()
                                .paddingOnly(top: 20, bottom: 20)
                            : PrimaryBtn(
                                labelString: "Sign Up",
                                onTap: () {
                                  if (signupController.formKey.currentState!
                                      .validate()) {
                                    StorageHelper().selectedUser == "business"
                                        ? signupController.businessRegister()
                                        : signupController.userRegister();
                                  }
                                },
                              ),
                        const DividerWidget(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(
                                context, SigninScreen.routeName);
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Already have an account?',
                              style: TextStyles.smallText,
                              children: [
                                TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(color: purpleColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const DividerWidget(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
