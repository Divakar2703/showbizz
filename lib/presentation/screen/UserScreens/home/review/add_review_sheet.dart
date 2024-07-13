import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showbiz/presentation/constant/constant.dart';
import 'package:showbiz/presentation/widget/button/tertiary_btn.dart';

import '../../../../constant/size_constant.dart';
import '../../../../constant/text_style.dart';
import '../../../../widget/divider_widget.dart';
import '../../../../widget/text_input_widget.dart';

class AddReviewSheet extends StatefulWidget {
  AddReviewSheet({Key? key}) : super(key: key);

  @override
  State<AddReviewSheet> createState() => _AddReviewSheetState();
}

class _AddReviewSheetState extends State<AddReviewSheet> {
  int selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: linearGradientPurple,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(card_radius),
            topRight: Radius.circular(card_radius),
          )),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10),
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DividerWidget(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rating & Reviews",
                style:
                    TextStyles.smallText.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          DividerWidget(height: 8),
          Text(
            "Select Your Rating",
            style:
                TextStyles.smallestText.copyWith(fontWeight: FontWeight.normal),
          ),
          DividerWidget(height: 5),

          /// star
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < selectedStar; i++)
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedStar = i++;
                      });
                    },
                    // padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(Icons.star_rate_rounded,
                        color: Colors.amber, size: 25)),
              for (int i = selectedStar + 1; i <= 5; i++)
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedStar = i++;
                      });
                    },
                    // padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(Icons.star_rate_rounded,
                        color: Colors.grey, size: 25)),
            ],
          ),
          DividerWidget(height: 5),

          AppInputTextField(
              fillColor: gradientTextPurple1.withOpacity(0.8),
              hint: "",
              hintTextColor: Colors.grey,
              // hintStyle: FontStyle.italic,
              maxLine: 5),

          DividerWidget(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: greyButton,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(buttonRadius))),
                    child: Text(
                      "Cancel",
                      textAlign: TextAlign.center,
                      style: TextStyles.smallerText
                          .copyWith(color: lightWhiteTextColor),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        gradient: linearGradientBlue,
                        color: buttonGreen,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(buttonRadius))),
                    child: Text(
                      "Post Review",
                      textAlign: TextAlign.center,
                      style: TextStyles.smallerText
                          .copyWith(color: lightWhiteTextColor),
                    ),
                                    ),
                                  ),
                  )),
            ],
          ),
          DividerWidget(height: 30),
        ],
      ),
      // ),
      // ),
    );
  }
}
