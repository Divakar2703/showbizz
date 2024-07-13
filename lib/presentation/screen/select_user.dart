import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showbiz/helpers/storage_helper.dart';
import 'package:showbiz/presentation/constant/app_hive.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/UserScreens/user_intro/intro_one.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

import '../constant/constant.dart';
import '../constant/size_constant.dart';

class SelectUser extends StatelessWidget {
  static const String routeName = "select_user";

  const SelectUser({super.key});

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
                const DividerWidget(height: 30),
                Center(
                    child: Hero(
                        tag: "logo_widget",
                        child: LogoWidget(
                          imageHeight: getDeviceSize(context).height * 0.3,
                        ))),
                const Spacer(),
                PrimaryBtn(
                  labelString: "User",
                  onTap: () {
                    StorageHelper().selectedUser = "user";

                    Navigator.pushNamed(context, IntroOne.routeName);
                  },
                ),
                const DividerWidget(height: 20),
                SecondaryBtn(
                    labelString: "Business",
                    onTap: () {
                      StorageHelper().selectedUser = "business";
                      Navigator.pushNamed(context, IntroOne.routeName);
                    }),
                const DividerWidget(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
