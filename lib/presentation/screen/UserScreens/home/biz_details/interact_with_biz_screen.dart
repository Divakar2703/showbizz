import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:showbiz/presentation/constant/size_constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import '../../../../constant/constant.dart';
import '../../../../widget/popup/flag_dialog.dart';

class InteractWithBiz extends StatefulWidget {
  static const String routeName = "interact_with_biz";

  const InteractWithBiz({super.key});

  @override
  State<InteractWithBiz> createState() => _InteractWithBizState();
}

enum InputType { search, location }

class _InteractWithBizState extends State<InteractWithBiz> {
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
          "Interact with Business",
          style: TextStyles.mediumText,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (ctx, a1, a2) {
                      return Container(child: Text("Hey"),);
                    },
                    transitionBuilder: (ctx, a1, a2, child) {
                      var curve =
                      Curves.easeInOut.transform(a1.value);
                      return Transform.scale(
                        scale: curve,
                        child: InteractWithBizFlagAlert(
                            ),
                      );
                    },
                    transitionDuration:
                    const Duration(milliseconds: 400),
                  );
                },
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
                style: TextStyles.smallestText.copyWith(fontSize: getDeviceHeight(context)*0.018),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
