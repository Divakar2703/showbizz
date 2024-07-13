import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/auth/forgot_password.dart';
import 'package:showbiz/presentation/screen/auth/signup.dart';
import 'package:showbiz/presentation/screen/UserScreens/user_intro/intro_two.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/button/tertiary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

import '../../../constant/constant.dart';
import '../../../constant/size_constant.dart';
import '../../../widget/text_input_widget.dart';
import '../base_screen.dart';

class MySubscription extends StatelessWidget {
  static const String routeName = "edit_profile";

  const MySubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset("asset/images/icon/Arrow_Left.png"),
            )),
        titleSpacing: 2.0,
        centerTitle: true,
        titleTextStyle: TextStyles.mediumText
            .copyWith(color: white, fontWeight: FontWeight.w600),
        shadowColor: Colors.transparent,
        backgroundColor: darkBlack,
        title: Text(
          "My Subscription",
          style: TextStyles.mediumText,
        ),
      ),
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
                DividerWidget(height: 30),
                Text(
                  "Go Ads Free",
                  style: TextStyles.mediumText,
                ),
                /// Monthly
                Container(
                  decoration: BoxDecoration(
                    gradient: linearGradientBlue,
                    borderRadius: BorderRadius.circular(card_radius),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Monthly",
                          style: TextStyles.smallText,
                        ),
                      ),
                      Text(
                        "\$3",
                        style: TextStyles.mediumText,
                      ),
                    ],
                  ),
                ),
                DividerWidget(height: 20),
                AppInputTextField(
                  hint: "thomaswhite@gmail.com",
                  fillColor: gradientTextBlue1,
                  focusedBorderColor: buttonLightPurple,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },

                      child: RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          text: 'Send OTP',
                          style: TextStyles.smallerText,
                        ),
                      ),
                    ),
                  ],
                ),

                AppInputTextField(
                  hint: "+1 (456) 956 7554",
                  fillColor: gradientTextBlue1,
                  focusedBorderColor: buttonLightPurple,
                ),
                DividerWidget(height: 20),


                TertiaryBtn(
                    btnColor: [
                      containerBrown,
                      containerBrownDark
                    ],
                    labelString: "Update Profile",
                    onTap: () {
                      Navigator.pushNamed(context, BaseScreen.routeName);
                    }),
                DividerWidget(height: 40),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
