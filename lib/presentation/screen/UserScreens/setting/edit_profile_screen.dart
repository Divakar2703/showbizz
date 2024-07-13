import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/auth/add_business_cover_image.dart';
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
import '../../auth/add_business_logo.dart';
import '../base_screen.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = "edit_profile";

  const EditProfile({super.key});

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
          "Edit Profile",
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
                DividerWidget(height: 10),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("asset/images/users/user1.png"),
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: lightWhiteTextColor, width: 0.2)),
                      ),
                      Positioned(
                          bottom: -1,
                          right: 5,
                          child: Image.asset(
                            "asset/images/icon/Image.png",
                            height: 20,
                          )),
                    ],
                  ),
                ),
                DividerWidget(height: 30),
                AppInputTextField(
                  hint: "Thomas White",
                  fillColor: gradientTextBlue1,
                  focusedBorderColor: buttonLightPurple,
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
                      Navigator.pushNamed(context, AddBusinessCoverImage.routeName);
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
