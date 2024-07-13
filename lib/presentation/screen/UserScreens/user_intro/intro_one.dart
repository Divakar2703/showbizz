import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/presentation/constant/app_hive.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/base_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/user_intro/intro_two.dart';
import 'package:showbiz/presentation/screen/auth/select_signin_process.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

import '../../../constant/constant.dart';
import '../base_screen.dart';

class IntroOne extends StatelessWidget {
  static const String routeName = "intro_one";

  const IntroOne({super.key});

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DividerWidget(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Hero(
                          tag: "logo_widget",
                          child: LogoWidget(
                            imageHeight: getDeviceSize(context).height * 0.3,
                            textHeight: 18,
                          ))),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("A World of Business \nConnectivity",
                      style: TextStyles.mediumText.copyWith(
                          fontWeight: FontWeight.bold,
                          color: lightWhiteTextColor,
                          fontSize: getDeviceHeight(context) * .025),
                      textAlign: TextAlign.center),
                ),
                const DividerWidget(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                      "Discover, Connect and Work with\nthe best service providers.",
                      style: TextStyles.smallText.copyWith(
                          color: lightWhiteTextColor,
                          fontSize: getDeviceHeight(context) * .020),
                      textAlign: TextAlign.center),
                ),
                const Spacer(),
                PrimaryBtn(
                    labelString: "Next",
                    onTap: () {
                      Navigator.pushNamed(context, IntroTwo.routeName);
                    }),
                const DividerWidget(height: 20),
                SecondaryBtn(
                  labelString: "Skip",
                  onTap: () {
                    StorageHelper().selectedUser == "business"
                        ? Navigator.pushNamed(
                            context, SelectSigningProcess.routeName)
                        : Navigator.pushNamed(
                            context, SelectSigningProcess.routeName);
                  },
                ),
                const DividerWidget(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
