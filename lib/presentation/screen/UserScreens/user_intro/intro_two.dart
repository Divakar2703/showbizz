import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/presentation/constant/app_hive.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/base_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/base_screen.dart';
import 'package:showbiz/presentation/screen/auth/select_signin_process.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

import '../../../constant/constant.dart';
import 'intro_one.dart';

class IntroTwo extends StatelessWidget {
  static const String routeName = "intro_two";

  const IntroTwo({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DividerWidget(height: 80),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Hero(
                          tag: "logo_widget",
                          child: LogoWidget(
                            imageHeight: getDeviceSize(context).height * 0.3,
                            textHeight: 18,
                          ))),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("All-in-One",
                      style: TextStyles.mediumText.copyWith(
                          fontWeight: FontWeight.bold,
                          color: lightWhiteTextColor,
                          fontSize: getDeviceHeight(context) * .025),
                      textAlign: TextAlign.center),
                ),
                DividerWidget(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Read Reviews, Share & Save \nyour Favorites",
                      style: TextStyles.smallText.copyWith(
                          color: lightWhiteTextColor,
                          fontSize: getDeviceHeight(context) * .020),
                      textAlign: TextAlign.center),
                ),
                Spacer(),
                PrimaryBtn(
                    labelString: "GET STARTED",
                    onTap: () {
                      Navigator.pushNamed(
                          context, SelectSigningProcess.routeName);
                    }),
                DividerWidget(height: 20),
                SecondaryBtn(
                    labelString: "Skip",
                    onTap: () {
                      StorageHelper().selectedUser == "business"
                          ? Navigator.pushNamed(
                              context, SelectSigningProcess.routeName)
                          : Navigator.pushNamed(
                              context, SelectSigningProcess.routeName);
                    }),
                DividerWidget(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
