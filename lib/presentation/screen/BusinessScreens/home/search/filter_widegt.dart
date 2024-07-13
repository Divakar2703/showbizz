import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/button/secondary_btn.dart';
import 'package:showbiz/presentation/widget/button/tertiary_btn.dart';

import '../../../../constant/constant.dart';
import '../../../../constant/size_constant.dart';
import '../../../../constant/text_style.dart';
import '../../../../widget/divider_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 65);
  double start = 20.0;
  double end = 60.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bottomSheetBlackBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(card_radius * 2),
          topRight: Radius.circular(card_radius * 2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///
            Row(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  child: Text(
                    "Filter",
                    style: TextStyles.smallText,
                  ),
                ),
                CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                  onPressed: () {
                    Future.delayed(
                      Duration(
                        milliseconds: 100,
                      ),
                      () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Icon(
                    Icons.close,
                    color: white,
                    size: 20,
                  ),
                ),
              ],
            ),

            ///
            const DividerWidget(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Location Radius",
                  style: TextStyles.smallerText
                      .copyWith(color: lightWhiteTextColor),
                ),
              ],
            ),

            ///
            const DividerWidget(
              height: 15,
            ),

            ///
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 25,
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 1,
                      ),
                      child: RangeSlider(
                        values: RangeValues(start, end),
                        labels: RangeLabels(start.toString(), end.toString()),
                        onChanged: (value) {
                          setState(() {
                            start = value.start;
                            end = value.end;
                          });
                        },
                        min: 0.0,
                        max: 100.0,
                        activeColor: sliderGreen,
                        inactiveColor: lightWhiteTextColor,
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${start.ceil().toString()}",
                    style: TextStyles.smallerText
                        .copyWith(color: lightWhiteTextColor),
                  ),
                  Text(
                    "${end.ceil().toString()}",
                    style: TextStyles.smallerText
                        .copyWith(color: lightWhiteTextColor),
                  ),
                ],
              ),
            ),

            ///
            const DividerWidget(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyles.smallerText
                        .copyWith(color: lightWhiteTextColor),
                  ),
                ],
              ),
            ),

            /// category list
            const DividerWidget(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 30, right: 15),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Coffee Shop",
                              style: TextStyles.smallestText.copyWith(
                                  color: lightWhiteTextColor,
                                  fontSize: smallestFontSize + 1,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          Checkbox(
                              side: BorderSide(color: lightWhiteTextColor),
                              value: false,
                              onChanged: (value) {})
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            /// category list
            const DividerWidget(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TertiaryBtn(
                    labelString: "RESET",
                    onTap: () {
                      Future.delayed(
                        Duration(
                          milliseconds: 100,
                        ),
                        () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    btnColor: [buttonLightBlack, buttonLightBlack],
                  ),
                )),
                Expanded(
                    child: SecondaryBtn(
                        labelString: "APPLY",
                        onTap: () {
                          Future.delayed(
                            Duration(
                              milliseconds: 100,
                            ),
                            () {
                              Navigator.pop(context);
                            },
                          );
                        }))
              ],
            )
          ],
        ),
      ),
    );
  }
}
