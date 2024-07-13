import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/controllers/auth/login_controller.dart';
import 'package:showbiz/presentation/screen/auth/forgot_password.dart';
import 'package:showbiz/presentation/screen/auth/signup.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';
import 'package:showbiz/utils/app_decoration.dart';
import 'package:showbiz/utils/app_widgets.dart';

import '../../constant/constant.dart';
import '../../constant/size_constant.dart';
import '../../widget/text_input_widget.dart';

class SigninScreen extends StatelessWidget {
  static const String routeName = "signing";

  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (loginController) {
          return Scaffold(
            backgroundColor: darkBlack,
            body: Container(
              decoration:
                  AppDecoration.imgDecoration("asset/images/bg_repeat.png"),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const DividerWidget(height: 40),
                      Center(
                          child: Hero(
                              tag: logoHeroString,
                              child: LogoWidget(
                                imageHeight:
                                    getDeviceSize(context).height * 0.2,
                                textHeight: 18,
                              ))),
                      DividerWidget(
                          height: getDeviceSize(context).height * 0.1),
                      Text("Sign In",
                          style: TextStyles.largerText.copyWith(
                              color: lightWhiteTextColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      DividerWidget(
                          height: getDeviceSize(context).height * 0.05),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        buttonDarkPurple,
                                        buttonLightPurple
                                      ],
                                    ),
                                    color: buttonGreen,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(buttonRadius))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "asset/images/google.png",
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Sign In with Google ",
                                        textAlign: TextAlign.center,
                                        style: TextStyles.smallestText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5, right: 5),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        buttonDarkPurple,
                                        buttonLightPurple
                                      ],
                                    ),
                                    color: buttonGreen,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(buttonRadius))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "asset/images/fb.png",
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 5),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        buttonDarkPurple,
                                        buttonLightPurple
                                      ],
                                    ),
                                    color: buttonGreen,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(buttonRadius))),
                                child: Center(
                                  child: Image.asset(
                                    "asset/images/apple.png",
                                    height: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const DividerWidget(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Or with Email",
                              style: TextStyles.smallestText
                                  .copyWith(color: lightWhiteTextColor),
                              textAlign: TextAlign.center),
                        ],
                      ),
                      const DividerWidget(height: 20),
                      AppInputTextField(
                        controller: loginController.emailController,
                        hint: "Your Email",
                        focusedBorderColor: buttonLightPurple,
                        suffixIcon: const Icon(
                          Icons.check,
                          color: white,
                        ),
                      ),
                      const DividerWidget(),
                      AppInputTextField(
                          controller: loginController.passwordController,
                          hint: "Password",
                          focusedBorderColor: buttonLightPurple,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ForgotPasswordScreen.routeName);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    "Forgot?",
                                    style: TextStyles.smallestText,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const DividerWidget(height: 20),
                      loginController.isLoading
                          ? AppWidgets.getLoadingView()
                              .paddingOnly(top: 20, bottom: 20)
                          : PrimaryBtn(
                              labelString: "Sign In",
                              onTap: () {
                                loginController.login();
                              },
                            ),
                      const DividerWidget(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(
                              context, SignUpScreen.routeName);
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'New User?',
                            style: TextStyles.smallText,
                            children: [
                              TextSpan(
                                text: ' Sign Up',
                                style: TextStyle(
                                    color: purpleColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
