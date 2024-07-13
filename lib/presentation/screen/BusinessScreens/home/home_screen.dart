import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/controllers/business/home_controller.dart';
import 'package:showbiz/presentation/widget/button/primary_btn.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/text_input_widget.dart';
import 'package:showbiz/utils/app_widgets.dart';

import '../../../constant/constant.dart';

class BusinessHomeScreen extends StatefulWidget {
  static const String routeName = "business_home_screen";
  const BusinessHomeScreen({super.key});

  @override
  State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: screenPadding),
            child: Column(
              children: [
                const DividerWidget(
                  height: 10,
                ),
                const DividerWidget(
                  height: 20,
                ),
                Container(
                    width: getDeviceWidth(context),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                        color: buttonGreen,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(buttonRadius))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Live Feed",
                            style: TextStyles.buttonText,
                          ),
                        )),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "OFF",
                                style: TextStyles.buttonText,
                              ),
                            ),
                            Switch(
                              value: homeController.liveFeed,
                              onChanged: (s) =>
                                  homeController.changeLiveFeed(s),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "ON",
                                style: TextStyles.buttonText,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                DividerWidget(
                  height: getDeviceHeight(context) * 0.05,
                ),
                Container(
                    width: getDeviceWidth(context),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                        color: buttonGreen,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(buttonRadius))),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Available Wi-Fi Cam",
                            style: TextStyles.buttonText,
                          ),
                        )),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  "0",
                                  style: TextStyles.buttonText,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                DividerWidget(
                  height: getDeviceHeight(context) * 0.05,
                ),
                Expanded(
                  child: homeController.isLoading
                      ? AppWidgets.getLoadingView()
                      : homeController.nonInteractiveSessions.isEmpty
                          ? Image.asset("asset/images/cctv.png")
                          : GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 9 / 11,
                              ),
                              itemCount:
                                  homeController.nonInteractiveSessions.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("asset/images/cctv.png"),
                                    Text(
                                      homeController
                                              .nonInteractiveSessions[index]
                                              .url ??
                                          "",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                    )
                                  ],
                                );
                              },
                            ),
                ),
                // DividerWidget(
                //   height: getDeviceHeight(context) * 0.2,
                // ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30.0),
                        ),
                      ),
                      backgroundColor: Colors.transparent, // Color(0xff101213),
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: IntrinsicHeight(
                            child: BlurryContainer.expand(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff101213).withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 30),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        height: 5,
                                        width: 100,
                                      ),
                                    ).paddingOnly(bottom: 20),
                                    const Text(
                                      "Add Non Interactive Session",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ).paddingOnly(bottom: 20),
                                    AppInputTextField(
                                      controller: homeController.url,
                                      hint: "Camera Link",
                                      focusedBorderColor: buttonLightPurple,
                                      suffixIcon: const Icon(
                                        Icons.video_call_outlined,
                                        color: white,
                                      ),
                                    ).paddingOnly(
                                      bottom: 30,
                                    ),
                                    homeController.isLoading
                                        ? AppWidgets.getLoadingView()
                                        : PrimaryBtn(
                                            labelString: "Add",
                                            onTap: () {
                                              Get.back();
                                              homeController
                                                  .addNonInteractiveSessions();
                                              // loginController.login();
                                            },
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: getDeviceWidth(context),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: buttonDarkPurple,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(buttonRadius))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Add Wi-Fi Cam",
                              style: TextStyles.buttonText,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset("asset/images/icon/plus.png"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ).paddingOnly(bottom: 10, top: 5)
              ],
            ),
          );
        });
  }
}
