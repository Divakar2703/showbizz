import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/review/add_review_sheet.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/search/filter_widegt.dart';
import 'package:showbiz/presentation/widget/button/tertiary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/recent_search_widget.dart';

import '../../../constant/constant.dart';
import '../../../widget/popup/flag_dialog.dart';

class InteractiveSessionRequestBusiness extends StatefulWidget {
  static const String routeName = "interactive_session_request_business";

  const InteractiveSessionRequestBusiness({super.key});

  @override
  State<InteractiveSessionRequestBusiness> createState() =>
      _InteractiveSeesionRequestState();
}

enum InputType { search, location }

class _InteractiveSeesionRequestState
    extends State<InteractiveSessionRequestBusiness> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DefaultTabController(
          length: 3,
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
                color: buttonGreen, borderRadius: BorderRadius.circular(15)),
            child: TabBar(
              dividerColor: Colors.transparent,
              labelColor: lightWhiteTextColor,
              padding: EdgeInsets.zero,
              automaticIndicatorColorAdjustment: false,
              labelStyle:
                  TextStyles.smallerText.copyWith(color: lightWhiteTextColor),
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: lightWhiteTextColor,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: linearGradientBrown),
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Tab(
                    child: Text(
                      "Upcoming",
                      style: TextStyle(
                          fontSize: smallerFontSize,
                          color: lightWhiteTextColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Tab(
                    child: Text(
                      "Rejected",
                      style: TextStyle(
                          fontSize: smallerFontSize,
                          color: lightWhiteTextColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Tab(
                    child: Text(
                      "Completed",
                      style: TextStyle(
                          fontSize: smallerFontSize,
                          color: lightWhiteTextColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        /// no data widget
        Expanded(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
      ],
    );
  }
}
