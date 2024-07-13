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

import '../../../../constant/constant.dart';
import '../../../../widget/popup/flag_dialog.dart';

class NonInteractWithBiz extends StatefulWidget {
  static const String routeName = "non_interact_with_biz";

  const NonInteractWithBiz({super.key});

  @override
  State<NonInteractWithBiz> createState() => _NonInteractWithBizState();
}

enum InputType { search, location }

class _NonInteractWithBizState extends State<NonInteractWithBiz> {
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
          "Non-Interactive Live Feed",
          style: TextStyles.smallText,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                // onTap: () {
                //   showGeneralDialog(
                //     context: context,
                //     pageBuilder: (ctx, a1, a2) {
                //       return Container();
                //     },
                //     transitionBuilder: (ctx, a1, a2, child) {
                //       var curve =
                //       Curves.easeInOut.transform(a1.value);
                //       return Transform.scale(
                //         scale: curve,
                //         child: NonInteractWithBizFlagAlert(
                //             ),
                //       );
                //     },
                //     transitionDuration:
                //     const Duration(milliseconds: 400),
                //   );
                // },
                child: Icon(Icons.info, color: lightWhiteTextColor,)),
          ),
        ],
      ),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/bg_repeat.png"),
              repeat: ImageRepeat.repeat),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("asset/images/No data.png", height: 150,)),
            Center(
              child: Text(
                "Today, Saturday 27 Jan, 2024",
                style: TextStyles.smallestText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
