import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/widget/appbar_widget.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/gradient_text_widget.dart';
import 'package:showbiz/presentation/widget/recent_search_widget.dart';
import 'package:showbiz/presentation/widget/text_input_widget.dart';

import '../../../constant/constant.dart';
import '../../../widget/category_widget.dart';

class AllCategoryScreen extends StatelessWidget {
  static const String routeName = "all_category_screen";

  const AllCategoryScreen({super.key});

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
          "All Categories",
          style: TextStyles.mediumText,
        ),
      ),
      body: ListView(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: screenPadding * 2),
        children: [
          const DividerWidget(
            height: 10,
          ),
          Row(
            children: [
              /// search field
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: buttonGreen,
                        borderRadius: BorderRadius.circular(buttonRadius)),
                    child: TextField(
                      style: TextStyles.smallText.copyWith(color: white),
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.close_rounded,
                            color: lightWhiteTextColor.withOpacity(0.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          prefixIcon: SizedBox(
                            height: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                "asset/images/icon/Search.png",
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Search Here',
                          hintStyle: TextStyles.smallerText
                              .copyWith(color: white.withOpacity(0.7))),
                    )),
              ),
            ],
          ),
          const DividerWidget(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 3,
                crossAxisSpacing: 18.0,
                mainAxisSpacing: 15.0),
            itemBuilder: (BuildContext context, int index) {
              return const CategoryWidget(
                imageString: "asset/images/icon/mug.png",
                title: "Coffee shops",
              );
            },
          ),
          const DividerWidget(
            height: 20,
          ),
        ],
      ),
    );
  }
}
