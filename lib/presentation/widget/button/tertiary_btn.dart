import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constant/size_constant.dart';
import '../../constant/text_style.dart';

class TertiaryBtn extends StatelessWidget {
  final String labelString;
  final List<Color> btnColor;
  Function onTap;

   TertiaryBtn({super.key, required this.labelString,required this.btnColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
            child: InkWell(
              onTap: () {
                onTap();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: btnColor,
                    ),
                    color: buttonGreen,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(buttonRadius))),
                child: Text(
                  labelString,

                  textAlign: TextAlign.center,
                  style: TextStyles.buttonText.copyWith(color: lightWhiteTextColor),
                ),
              ),
            )),
      ],
    );
  }
}
