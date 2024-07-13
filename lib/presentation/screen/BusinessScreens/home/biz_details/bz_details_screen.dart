import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/review/add_review_sheet.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/biz_details/interact_with_biz_screen.dart';

import 'package:showbiz/presentation/screen/UserScreens/home/review/review_listing_screen.dart';
import 'package:showbiz/presentation/widget/button/tertiary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';

import '../../../../constant/constant.dart';
import 'non_interact_with_biz_screen.dart';

class BizDetails extends StatefulWidget {
  static const String routeName = "biz_details";

  const BizDetails({super.key});

  @override
  State<BizDetails> createState() => _BizDetailsState();
}

enum InputType { search, location }

class _BizDetailsState extends State<BizDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset("asset/images/icon/Arrow_Left.png"),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ReviewList.routeName);
              },
              child: Container(
                decoration: BoxDecoration(
                    gradient: linearGradientRed,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(card_radius / 2),
                    )),
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "asset/images/icon/Call.png",
                  height: 18,
                ),
              ),
            ),
          ),
        ],
        titleSpacing: 2.0,
        centerTitle: true,
        titleTextStyle: TextStyles.mediumText
            .copyWith(color: white, fontWeight: FontWeight.w600),
        shadowColor: Colors.transparent,
        backgroundColor: darkBlack,
        title: Text(
          "Aplha Biz",
          style: TextStyles.mediumText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: screenPadding),
        child: ListView(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          // padding: const EdgeInsets.symmetric(horizontal: screenPadding),
          children: [
            ///
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showModalBottomSheet<void>(
                  // showDragHandle: true,
                  isDismissible: true,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  isScrollControlled: true,
                  context: context,
                  // enableDrag: true,
                  useSafeArea: true,
                  // useSafeArea: true,
                  // isDismissible: true,
                  // backgroundColor: bottomSheetBlackBackground,
                  // isScrollControlled: true,
                  // context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddReviewSheet(),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  SizedBox(
                    // height: 200,
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,

                      child: Opacity(
                        opacity: 0.8,
                        child: Image.asset(
                          "asset/images/bg-image.png",
                          // height: 18,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 1,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 7),
                          child: RichText(
                            // Controls visual overflow
                            overflow: TextOverflow.clip,
                            // Controls how the text should be aligned horizontally
                            textAlign: TextAlign.start,
                            // Whether the text should break at soft line breaks
                            softWrap: true,
                            // Maximum number of lines for the text to span
                            maxLines: 2,
                            text: TextSpan(
                              text: 'Alpha Biz Inc\n',
                              style: TextStyles.smallText.copyWith(
                                  color: white, fontWeight: FontWeight.w700),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: '+1 (554) 684 9654',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          )))
                ],
              ),
            ),

            ///
            const DividerWidget(
              height: 20,
            ),

            Text(
              "Description",
              style: TextStyles.smallerText,
            ),
            const DividerWidget(
              height: 5,
            ),
            Text(
              "Hard Rock Cafe, Inc. is a chain of theme bar-restaurants, memorabilia shops, casinos and museums founded in 1971 by Isaac Tigrett and Peter Morton in London. In 1979, the cafe began covering its walls with rock and roll memorabilia, a tradition which expanded to others.",
              style: TextStyles.smallestText.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                  fontSize: smallestFontSize - 1),
              textAlign: TextAlign.justify,
            ),

            ///
            const DividerWidget(
              height: 10,
            ),

            Text(
              "Photos",
              style: TextStyles.smallerText,
            ),
            const DividerWidget(
              height: 5,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("asset/images/bg-image.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(card_radius / 2)),
                );
              },
            ),

            ///
            const DividerWidget(
              height: 10,
            ),

            TertiaryBtn(
                labelString: "INTERACT WITH BUSINESS",
                btnColor: [
                  gradientTextBlue1.withOpacity(0.8),
                  gradientTextBlue2.withOpacity(0.8)
                ],
                onTap: () {
                  Navigator.pushNamed(context, InteractWithBiz.routeName);
                }),
            const DividerWidget(
              height: 10,
            ),
            TertiaryBtn(
                labelString: "NON-INTERACTIVE LIVE FEED",
                btnColor: [
                  gradientTextBlue1.withOpacity(0.8),
                  gradientTextBlue2.withOpacity(0.8)
                ],
                onTap: () {
                  Navigator.pushNamed(context, NonInteractWithBiz.routeName);
                })
          ],
        ),
      ),
    );
  }
}
