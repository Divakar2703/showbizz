import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/auth/signup.dart';
import 'package:showbiz/presentation/screen/UserScreens/user_intro/intro_two.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

import '../../constant/constant.dart';
import '../../constant/size_constant.dart';
import '../../widget/text_input_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "forgot_password";

  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlack,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/bg_repeat.png"),
              repeat: ImageRepeat.repeat),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DividerWidget(height: 10),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Hero(
                          tag: logoHeroString,
                          child: LogoWidget(
                            imageHeight: 60,
                            textHeight: 14,
                          ))),
                ),
                DividerWidget(height: 40),
                Text("Forgot Password",
                    style: TextStyles.largerText
                        .copyWith(fontWeight: FontWeight.bold, color: lightWhiteTextColor),
                    textAlign: TextAlign.center),
                DividerWidget(),
                Text("Enter email associated with your account",
                    style: TextStyles.smallText.copyWith( color: lightWhiteTextColor), textAlign: TextAlign.center),
                DividerWidget(height: 30),
                DividerWidget(height: 20),
                AppInputTextField(
                  hint: "Your Email",
                  hintTextColor: lightWhiteTextColor,

                  focusedBorderColor: buttonLightPurple,
                  suffixIcon: Icon(
                    Icons.check,
                    color: white,
                    size: 15,
                  ),
                ),
                DividerWidget(),
                DividerWidget(height: 20),
                PrimaryBtn(
                    labelString: "Send",
                    onTap: () {
                      // Navigator.pushNamed(context, IntroTwo.routeName);
                    }),
                DividerWidget(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'New User?',
                      style: TextStyles.smallText.copyWith(color: lightWhiteTextColor),
                      children: [
                        TextSpan(
                          text: ' Sign Up',
                          style: TextStyle(color: purpleColor, fontWeight: FontWeight.bold ),
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
  }
}
