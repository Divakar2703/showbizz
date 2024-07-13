/// merging logo image and logo text

import 'package:flutter/cupertino.dart';
import 'package:showbiz/presentation/constant/constant.dart';

import 'divider_widget.dart';

class LogoWidget extends StatelessWidget {
  final double? imageHeight;
  final double? textHeight;
  final bool? showName;

  const LogoWidget(
      {super.key,
      this.imageHeight = 130,
      this.textHeight = 40,
      this.showName = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("asset/images/logo_image.png",
            height: imageHeight),
        showName != null && showName! ? DividerWidget(height: 20) : SizedBox(),
        showName != null && showName!
            ? Image.asset(
                "asset/images/logo_name.png",
                height: textHeight,
              )
            : SizedBox(),
      ],
    );
  }
}
