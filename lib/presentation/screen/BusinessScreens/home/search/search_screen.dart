import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/models/business_model.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/search/filter_widegt.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/recent_search_widget.dart';

import '../../../../constant/constant.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search_screen";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

enum InputType { search, location }

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchText = TextEditingController();
  TextEditingController _locationText = TextEditingController();
  bool _showClearLocationOption = false;
  bool _showClearSearchOption = false;

  void clearText(InputType type) {
    if (type == InputType.search) {
      setState(() {
        if (_searchText.text.toString().isNotEmpty) {
          _showClearSearchOption = true;
        } else {
          _showClearSearchOption = false;
        }
      });
    } else if (type == InputType.location) {
      setState(() {
        if (_locationText.text.toString().isNotEmpty) {
          _showClearLocationOption = true;
        } else {
          _showClearLocationOption = false;
        }
      });
    }
  }

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
          InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  showDragHandle: true,
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  enableDrag: true,
                  useSafeArea: true,
                  // useSafeArea: true,
                  // isDismissible: true,
                  // backgroundColor: bottomSheetBlackBackground,
                  // isScrollControlled: true,
                  // context: context,
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                      shouldCloseOnMinExtent: true,
                      initialChildSize: 0.8,
                      expand: true,
                      snapAnimationDuration: Duration(milliseconds: 500),
                      // half screen on load
                      maxChildSize: 0.8,
                      // full screen on scroll
                      minChildSize: 0.25,
                      builder: (scrollContext, scrollController) {
                        return FilterWidget();
                      },
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset("asset/images/icon/Filter.png"),
              )),
        ],
        titleSpacing: 2.0,
        centerTitle: true,
        titleTextStyle: TextStyles.mediumText
            .copyWith(color: white, fontWeight: FontWeight.w600),
        shadowColor: Colors.transparent,
        backgroundColor: darkBlack,
        title: Text(
          "Search",
          style: TextStyles.mediumText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: screenPadding),
        child: Column(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          // padding: const EdgeInsets.symmetric(horizontal: screenPadding),
          children: [
            const DividerWidget(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Location field
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: buttonGreen,
                          borderRadius: BorderRadius.circular(buttonRadius)),
                      child: TextField(
                        controller: _locationText,
                        style: TextStyles.smallText.copyWith(color: white),
                        onChanged: (value) {
                          clearText(InputType.location);
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          prefixIcon: SizedBox(
                            height: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                "asset/images/icon/Location.png",
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Type Location',
                          hintStyle: TextStyles.smallerText
                              .copyWith(color: lightWhiteTextColor),
                          suffixIcon: _showClearLocationOption
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      _locationText.text = "";
                                      _showClearLocationOption = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: lightWhiteTextColor.withOpacity(0.5),
                                    size: 16,
                                  ),
                                )
                              : null,
                        ),
                      )),
                ),
              ],
            ),
            const DividerWidget(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Search field
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: buttonGreen,
                          borderRadius: BorderRadius.circular(buttonRadius)),
                      child: TextField(
                        controller: _searchText,
                        style: TextStyles.smallText.copyWith(color: white),
                        onChanged: (value) {
                          clearText(InputType.search);
                        },
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
                            suffixIcon: _showClearSearchOption
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        _searchText.text = "";
                                        _showClearSearchOption = false;
                                      });
                                    },
                                    child: Icon(Icons.close_rounded,
                                        color: lightWhiteTextColor),
                                  )
                                : null,
                            border: InputBorder.none,
                            hintText: 'Search Here',
                            hintStyle: TextStyles.smallerText
                                .copyWith(color: lightWhiteTextColor)),
                      )),
                ),
              ],
            ),
            const DividerWidget(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Recent Search",
                  style: TextStyles.smallerText.copyWith(color: white),
                ),
              ],
            ),

            const DividerWidget(
              height: 5,
            ),

            /// recent search
            Expanded(
              child: SizedBox(
                // height: 250,
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return RecentSearch(
                      business: Business(),
                      searchlinearGradient: linearGradientPurple,
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
      ),
    );
  }
}
