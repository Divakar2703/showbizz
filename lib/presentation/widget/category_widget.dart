import 'package:flutter/cupertino.dart';

import '../constant/constant.dart';
import '../constant/size_constant.dart';
import '../constant/text_style.dart';
import 'divider_widget.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String imageString;

  const CategoryWidget(
      {super.key, required this.title, required this.imageString});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          // height: 150,
          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(buttonRadius)),
              gradient: linearGradientPurple),
          child: Image.asset(
            imageString,
            height: 40,
          ),
          // child: Image.asset("asset/images/icon/Location.png"),
        ),
        const DividerWidget(
          height: 5,
        ),
        Center(
            child: Text(
          title,
          style: TextStyles.smallestText.copyWith(
              color: lightWhiteTextColor,
              fontSize: getDeviceHeight(context) * 0.014),
        ))
      ],
    );
  }
}
