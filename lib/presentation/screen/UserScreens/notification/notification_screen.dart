import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/text_style.dart';

import '../../../constant/constant.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = "notification";

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

enum InputType { search, location }

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("asset/images/bg_repeat.png"),
            repeat: ImageRepeat.repeat),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "asset/images/No data.png",
            height: 150,
          )),
          Center(
            child: Text(
              "Today, Saturday 27 Jan, 2024",
              style: TextStyles.smallestText,
            ),
          ),
        ],
      ),
    );
  }
}
