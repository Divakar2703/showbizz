import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/controllers/user/user_home_controller.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/all_category.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/biz_details/bz_details_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/search/search_screen.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/gradient_text_widget.dart';
import 'package:showbiz/presentation/widget/recent_search_widget.dart';
import 'package:showbiz/utils/app_widgets.dart';

import '../../../constant/constant.dart';
import '../../../widget/category_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHomeController>(
        init: UserHomeController(),
        builder: (homeController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
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
                              borderRadius:
                                  BorderRadius.circular(buttonRadius)),
                          child: TextField(
                            style: TextStyles.smallText.copyWith(color: white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                prefixIcon: SizedBox(
                                  height: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      "asset/images/icon/Search.png",
                                    ),
                                  ),
                                ),
                                suffixIcon: Icon(
                                  Icons.close_rounded,
                                  color: lightWhiteTextColor.withOpacity(0.5),
                                  size: 16,
                                ),
                                border: InputBorder.none,
                                hintText: 'Search Here',
                                hintStyle: TextStyles.smallerText
                                    .copyWith(color: white.withOpacity(0.7))),
                          )),
                    ),

                    /// location container
                    CupertinoButton(
                      padding: const EdgeInsets.only(left: 10),
                      onPressed: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      child: Container(
                        height: 48,
                        width: 50,
                        decoration: BoxDecoration(
                            color: containerBrown,
                            borderRadius: BorderRadius.circular(buttonRadius)),
                        child: Center(
                          child: Image.asset(
                            "asset/images/icon/Location.png",
                            height: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const DividerWidget(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyles.smallerText.copyWith(
                          color: white,
                          fontSize: getDeviceHeight(context) * 0.020),
                    ),
                    InkWell(
                      onTap: () {
                        Future.delayed(
                          const Duration(milliseconds: 50),
                          () {
                            Navigator.pushNamed(
                                context, AllCategoryScreen.routeName);
                          },
                        );
                      },
                      child: GradientText(
                        "See More",
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              purpleColor.withOpacity(0.8),
                              gradientTextPurple1.withOpacity(0.8),
                              // gradientTextPurple2,
                            ]),
                        style: TextStyles.smallestText.copyWith(
                            fontSize: getDeviceHeight(context) * 0.018),
                      ),
                    )
                  ],
                ),
                const DividerWidget(
                  height: 10,
                ),
                homeController.isLoading
                    ? Center(
                        child: AppWidgets.getLoadingView(),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeController.categories.length > 6
                            ? 6
                            : homeController.categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.9,
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 5),
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryWidget(
                            imageString: "asset/images/icon/mug.png",
                            title: homeController.categories[index].name ?? "",
                          );
                        },
                      ),
                const DividerWidget(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Recent Search",
                      style: TextStyles.smallerText.copyWith(
                          color: white,
                          fontSize: getDeviceHeight(context) * 0.020),
                    ),
                    GradientText(
                      "Clear",
                      gradient: LinearGradient(colors: [
                        gradientTextGreen1,
                        gradientTextGreen2,
                      ]),
                      style: TextStyles.smallestText
                          .copyWith(fontSize: getDeviceHeight(context) * 0.018),
                    )
                  ],
                ),
                const DividerWidget(
                  height: 5,
                ),

                /// recent search
                homeController.isLoading
                    ? Center(
                        child: AppWidgets.getLoadingView(),
                      )
                    : Expanded(
                        child: SizedBox(
                          // height: 250,
                          child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: homeController.businesses.length,
                            itemBuilder: (context, index) {
                              return CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Future.delayed(
                                    const Duration(
                                      milliseconds: 100,
                                    ),
                                    () {
                                      Get.to(() => BizDetails(
                                          bizId: homeController
                                              .businesses[index].id
                                              .toString()));
                                      // Navigator.pushNamed(
                                      //     context, BizDetails.routeName);
                                    },
                                  );
                                },
                                child: RecentSearch(
                                  containerColor: buttonGreen,
                                  business: homeController.businesses[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                const DividerWidget(
                  height: 5,
                ),
              ],
            ),
          );
        });
  }
}
