import 'package:flutter/material.dart';
import 'package:showbiz/api_helpers/api_utils.dart';
import 'package:showbiz/models/business_model.dart';

import '../constant/constant.dart';
import '../constant/size_constant.dart';
import '../constant/text_style.dart';
import 'divider_widget.dart';

class RecentSearch extends StatelessWidget {
  final LinearGradient? searchlinearGradient;
  final Color? containerColor;
  final Business business;
  const RecentSearch(
      {super.key,
      this.containerColor,
      this.searchlinearGradient,
      required this.business});

  @override
  Widget build(BuildContext context) {
    print(containerColor);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: containerColor,
        gradient: containerColor == null ? searchlinearGradient : null,
        borderRadius: const BorderRadius.all(Radius.circular(card_radius)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FittedBox(
              // fit: BoxFit.fitHeight,
              child: business.logo == null
                  ? Image.asset(
                      "asset/images/image1.png",
                      width: 120,
                      height: 120,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        ApiUtils.baseUrl + business.logo!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// first three lines in one container
                Text(
                  business.businessName ?? "Alpha Biz LLC",
                  style: TextStyles.smallerText.copyWith(
                      color: lightWhiteTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: getDeviceHeight(context) * 0.018),
                ),
                const DividerWidget(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: lightWhiteTextColor,
                      size: getDeviceHeight(context) * 0.022,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        business.phone ?? "+1 (455) 435 6754",
                        style: TextStyles.smallestText.copyWith(
                            color: lightWhiteTextColor,
                            fontSize: getDeviceHeight(context) * 0.017,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  ],
                ),
                const DividerWidget(
                  height: 8,
                ),

                /// categories
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(card_radius / 2)),
                          gradient: linearGradientPurple),
                      child: Text(
                        "Travel & Tour",
                        style: TextStyles.smallestText.copyWith(
                            fontSize: smallestFontSize - 2,
                            color: lightWhiteTextColor),
                      ),
                    )
                  ],
                ),
                const DividerWidget(
                  height: 3,
                ),

                /// last line
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(card_radius / 2)),
                          gradient: linearGradientPurple),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          Text(
                            "4.5",
                            style: TextStyles.smallestText.copyWith(
                                fontSize: smallestFontSize - 2,
                                color: lightWhiteTextColor),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    /// location container
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            gradient: linearGradientPurple,
                            color: purpleColor,
                            borderRadius: BorderRadius.circular(buttonRadius)),
                        child: Center(
                          child: Image.asset(
                            "asset/images/icon/Location.png",
                            height: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
