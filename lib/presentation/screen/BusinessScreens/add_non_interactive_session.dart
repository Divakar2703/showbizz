import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showbiz/presentation/controllers/auth/login_controller.dart';
import 'package:showbiz/presentation/widget/appbar_widget.dart';
import 'package:showbiz/utils/app_decoration.dart';

import '../../constant/constant.dart';

class AddNonInteractiveSessionScreen extends StatelessWidget {
  static const String routeName = "signing";

  const AddNonInteractiveSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (loginController) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Non Interactive Session",
              ),
            ),
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
                    children: [],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
