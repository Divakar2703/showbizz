import 'package:flutter/material.dart';
import 'package:showbiz/presentation/screen/auth/signin.dart';
import 'package:showbiz/presentation/screen/auth/signup.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

import '../../constant/constant.dart';

class SelectSigningProcess extends StatelessWidget {
  static const String routeName = "select_signing_process";

  const SelectSigningProcess({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Hero(
                          tag: logoHeroString,
                          child: LogoWidget(
                            imageHeight: 100,
                            textHeight: 20,
                          ))),
                ),
                const Spacer(),
                PrimaryBtn(
                    labelString: "SIGN IN",
                    onTap: () {
                      Navigator.pushNamed(context, SigninScreen.routeName);
                    }),
                const DividerWidget(height: 20),
                SecondaryBtn(
                  labelString: "CREATE A NEW ACCOUNT",
                  onTap: () {
                    Navigator.popAndPushNamed(context, SignUpScreen.routeName);
                  },
                ),
                const DividerWidget(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
