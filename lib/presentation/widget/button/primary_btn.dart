import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constant/size_constant.dart';
import '../../constant/text_style.dart';

class PrimaryBtn extends StatelessWidget {
  final String labelString;
  Function onTap;

  PrimaryBtn({super.key, required this.labelString, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              onTap();
            },
            // onPressed:
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: buttonGreen,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(buttonRadius))),
              child: Text(
                labelString,
                textAlign: TextAlign.center,
                style: TextStyles.buttonText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
