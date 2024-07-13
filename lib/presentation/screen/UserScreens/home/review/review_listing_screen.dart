import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';

import '../../../../constant/constant.dart';

class ReviewList extends StatefulWidget {
  static const String routeName = "review_list";

  const ReviewList({super.key});

  @override
  State<ReviewList> createState() => _ReviewListState();
}

enum InputType { search, location }

class _ReviewListState extends State<ReviewList> {
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
        titleSpacing: 2.0,
        centerTitle: true,
        titleTextStyle: TextStyles.mediumText
            .copyWith(color: white, fontWeight: FontWeight.w600),
        shadowColor: Colors.transparent,
        backgroundColor: darkBlack,
        title: Text(
          "Reviews",
          style: TextStyles.mediumText,
        ),
      ),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/bg_repeat.png"),
              repeat: ImageRepeat.repeat),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenPadding),
          child: ListView(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            // padding: const EdgeInsets.symmetric(horizontal: screenPadding),
            children: [
              const DividerWidget(
                height: 5,
              ),

              /// recent search
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.only(bottom: 15, left: 12, right: 12),
                        decoration: BoxDecoration(
                          gradient: linearGradientPurple,
                          borderRadius:
                              BorderRadius.all(Radius.circular(card_radius)),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(

                                child: Image.asset(
                                  "asset/images/users/user1.png",
                                  // fit: BoxFit.cover,
                                  height: 50,
                                ),
                                // backgroundImage: AssetImage("asset/images/users/user1.png", ),
                              ),
                              title: Text(
                                "Lisa Marquez",
                                style: TextStyles.smallerText
                                    .copyWith(color: lightWhiteTextColor),
                              ),
                              subtitle: Text(
                                "lisamarquez@gmail.com",
                                style: TextStyles.smallestText
                                    .copyWith(color: lightWhiteTextColor),
                              ),

                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        for (int i = 0; i < 5; i++)
                                          InkWell(
                                              onTap: () {},
                                              // padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                              child: Icon(Icons.star_rate_rounded,
                                                  color: Colors.amber, size: 15)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              contentPadding: EdgeInsets.zero,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam  incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                              style: TextStyles.smallestText
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ));
                },
              ),
              const DividerWidget(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
