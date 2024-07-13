import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/constant.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/widget/divider_widget.dart';
import 'package:showbiz/presentation/widget/popup/flag_dialog.dart';

class CalendarBusiness extends StatefulWidget {
  static const String routeName = "calendar_business";

  const CalendarBusiness({super.key});

  @override
  State<CalendarBusiness> createState() => _CalendarBusinessState();
}

enum InputType { search, location }

class _CalendarBusinessState extends State<CalendarBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlack,
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   leading: InkWell(
      //       onTap: () {
      //         Navigator.pop(context);
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: Image.asset("asset/images/icon/Arrow_Left.png"),
      //       )),
      //   titleSpacing: 2.0,
      //   centerTitle: true,
      //   titleTextStyle: TextStyles.mediumText
      //       .copyWith(color: white, fontWeight: FontWeight.w600),
      //   shadowColor: Colors.transparent,
      //   backgroundColor: darkBlack,
      //   title: Text(
      //     "Interact with Business",
      //     style: TextStyles.mediumText,
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10.0),
      //       child: InkWell(
      //           onTap: () {
      //             showGeneralDialog(
      //               context: context,
      //               pageBuilder: (ctx, a1, a2) {
      //                 return Container(
      //                   child: Text("Hey"),
      //                 );
      //               },
      //               transitionBuilder: (ctx, a1, a2, child) {
      //                 var curve = Curves.easeInOut.transform(a1.value);
      //                 return Transform.scale(
      //                   scale: curve,
      //                   child: InteractWithBizFlagAlert(),
      //                 );
      //               },
      //               transitionDuration: const Duration(milliseconds: 400),
      //             );
      //           },
      //           child: Icon(
      //             Icons.info,
      //             color: lightWhiteTextColor,
      //           )),
      //     ),
      //   ],
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/bg_repeat.png"),
              repeat: ImageRepeat.repeat),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                "asset/images/calendar.png", 
              )),
              DividerWidget(
                height: getDeviceHeight(context) * 0.05,
              ),
              Container(
                  width: getDeviceWidth(context),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                          "Add Schedule",
                          style: TextStyles.buttonText,
                        ),
                      )),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset("asset/images/icon/plus.png"),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
