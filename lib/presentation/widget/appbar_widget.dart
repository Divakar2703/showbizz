import 'package:flutter/material.dart';
import 'package:showbiz/presentation/constant/constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;
  final Widget? trailingWidget;

  /// you can add more fields that meet your needs
  AppbarWidget(
      {required this.title, required this.appBar, this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Center(
            child: Hero(
                tag: logoHeroString,
                child: LogoWidget(
                  textHeight: 0,
                  imageHeight: 35,
                  showName: false,
                ))),
      ),
      titleSpacing: 2.0,
      title: title,
      centerTitle: true,
      titleTextStyle: TextStyles.smallText
          .copyWith(color: white, fontWeight: FontWeight.w600),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("asset/images/bg_repeat.png"),
          ),
          // gradient: LinearGradient(
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //     colors: <Color>[darkBlack, darkBlack]),
        ),
      ),
      actions: [
        trailingWidget != null
            ? Container(color: white, child: trailingWidget!)
            : Container()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
