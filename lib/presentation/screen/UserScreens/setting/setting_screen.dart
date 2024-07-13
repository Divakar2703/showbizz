import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/UserScreens/setting/edit_profile_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/setting/my_subscription.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

import '../../../constant/constant.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "setting";

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

enum InputType { search, location }

class _SettingScreenState extends State<SettingScreen> {
  bool notificationToggleValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("asset/images/bg_repeat.png"),
            repeat: ImageRepeat.repeat),
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          DividerWidget(
            height: 10,
          ),

          ///
          Container(
            decoration: BoxDecoration(
              gradient: linearGradientBlue,
              borderRadius: BorderRadius.circular(card_radius),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("asset/images/users/user1.png"),
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: lightWhiteTextColor, width: 0.5)),
                        ),
                      ),
                    ),
                    InkWell(
                      // padding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.pushNamed(context, EditProfile.routeName);
                      },
                      child: Image.asset(
                        "asset/images/icon/Edit.png",
                        height: 15,
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),

                ///
                DividerWidget(
                  height: 10,
                ),
                Text(
                  "Thomas White",
                  style: TextStyles.mediumText.copyWith(
                      fontWeight: FontWeight.bold, color: lightWhiteTextColor),
                ),

                ///
                DividerWidget(height: 5),
                Text(
                  "thomaswhite@gmail.com",
                  style:
                      TextStyles.smallText.copyWith(color: lightWhiteTextColor),
                ),

                ///
                DividerWidget(
                  height: 5,
                ),
                Text(
                  "+1 (456) 956 7554",
                  style:
                      TextStyles.smallText.copyWith(color: lightWhiteTextColor),
                ),
              ],
            ),
          ),

          ///
          DividerWidget(
            height: 20,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Future.delayed(
                Duration(milliseconds: 100),
                () {
                  Navigator.pushNamed(context, MySubscription.routeName);
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: linearGradientBrown,
                borderRadius: BorderRadius.circular(card_radius),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Subscription",
                      style: TextStyles.smallText,
                    ),
                  ),
                  LogoWidget(
                    showName: false,
                    imageHeight: 30,
                    textHeight: 0,
                  )
                ],
              ),
            ),
          ),

          ///
          DividerWidget(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                gradient: linearGradientBlue,
                borderRadius: BorderRadius.circular(card_radius),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  /// Contact Us
                  Container(
                    decoration: BoxDecoration(
                      gradient: linearGradientBlue,
                      borderRadius: BorderRadius.circular(card_radius),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Contact Us",
                            style: TextStyles.smallText,
                          ),
                        ),
                        Image.asset(
                          "asset/images/icon/contact_us.png",
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  DividerWidget(
                    height: 10,
                  ),

                  /// About Us
                  Container(
                    decoration: BoxDecoration(
                      gradient: linearGradientBlue,
                      borderRadius: BorderRadius.circular(card_radius),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "About Us",
                            style: TextStyles.smallText,
                          ),
                        ),
                        Image.asset(
                          "asset/images/icon/info.png",
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  DividerWidget(
                    height: 10,
                  ),

                  /// faq
                  Container(
                    decoration: BoxDecoration(
                      gradient: linearGradientBlue,
                      borderRadius: BorderRadius.circular(card_radius),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "FAQs",
                            style: TextStyles.smallText,
                          ),
                        ),
                        Image.asset(
                          "asset/images/icon/faq.png",
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  DividerWidget(
                    height: 10,
                  ),

                  /// rate us
                  Container(
                    decoration: BoxDecoration(
                      gradient: linearGradientBlue,
                      borderRadius: BorderRadius.circular(card_radius),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Rate Us",
                            style: TextStyles.smallText,
                          ),
                        ),
                        Image.asset(
                          "asset/images/icon/Star.png",
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  DividerWidget(
                    height: 10,
                  ),
                ],
              )),

          ///
          DividerWidget(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                gradient: linearGradientBlue,
                borderRadius: BorderRadius.circular(card_radius),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  /// Notifications
                  Container(
                    decoration: BoxDecoration(
                      gradient: linearGradientBlue,
                      borderRadius: BorderRadius.circular(card_radius),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Notifications",
                            style: TextStyles.smallText,
                          ),
                        ),
                        SizedBox(
                          // color: Colors.red,
                          height: 5,
                          child: Transform.scale(scale: 0.8,
                            child: Switch(
                              // splashRadius: 4,

                              onChanged: (val) {
                                setState(() {
                                  notificationToggleValue = val;
                                });
                              },
                              value: notificationToggleValue,
                              activeColor: lightWhiteTextColor,
                              activeTrackColor: sliderGreen,
                              inactiveThumbColor: lightWhiteTextColor,
                              inactiveTrackColor: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  DividerWidget(
                    height: 10,
                  ),

                  /// About Us
                  Container(
                    decoration: BoxDecoration(
                      gradient: linearGradientBlue,
                      borderRadius: BorderRadius.circular(card_radius),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyles.smallText,
                          ),
                        ),
                        Icon(
                          Icons.sticky_note_2_outlined,
                          size: 25,
                          color: lightWhiteTextColor,
                        )
                      ],
                    ),
                  ),
                  DividerWidget(
                    height: 10,
                  ),

                  /// Privacy Policy
                  Container(
                    decoration: BoxDecoration(
                      gradient: linearGradientBlue,
                      borderRadius: BorderRadius.circular(card_radius),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Privacy Policy",
                            style: TextStyles.smallText,
                          ),
                        ),
                        Icon(
                          Icons.shield_outlined,
                          size: 25,
                          color: lightWhiteTextColor,
                        )
                      ],
                    ),
                  ),
                  DividerWidget(
                    height: 10,
                  ),
                ],
              )),

          ///
          DividerWidget(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                gradient: linearGradientRed,
                borderRadius: BorderRadius.circular(card_radius),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Logout",
                      style: TextStyles.smallText,
                    ),
                  ),
                ],
              )),

          ///
          DividerWidget(
            height: 20,
          ),
          Container(
              decoration: BoxDecoration(
                gradient: linearGradientRed,
                borderRadius: BorderRadius.circular(card_radius),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Delete Account",
                      style: TextStyles.smallText,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
