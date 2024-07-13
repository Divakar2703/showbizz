import 'package:flutter/material.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/home/home_screen.dart';
import 'package:showbiz/presentation/screen/BusinessScreens/calendar_business/calendar_business.dart';
import 'package:showbiz/presentation/screen/UserScreens/notification/notification_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/setting/setting_screen.dart';
import 'package:showbiz/presentation/widget/appbar_widget.dart';
import '../../constant/constant.dart';
import 'interactive_session_request/interactive_session_request_Screen.dart';

class BaseBusinessScreen extends StatefulWidget {
  static const String routeName = "base_business_screen";

  const BaseBusinessScreen({super.key});

  @override
  State<BaseBusinessScreen> createState() => _BaseBusinessScreenState();
}

class _BaseBusinessScreenState extends State<BaseBusinessScreen> {
  List<String> _titleName = [
    "Home",
    "Interactive Session Requests",
    "Calender",
    "Settings"
  ];
  int currentIndex = 0;
  final List _screenList = [
    const BusinessHomeScreen(),
    const InteractiveSessionRequestBusiness(),
    const CalendarBusiness(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppbarWidget(
          title: Text(_titleName[currentIndex]),
          appBar: AppBar(),
          trailingWidget: currentIndex == 0
              ? Container(
                  // height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("asset/images/users/user1.png"))),
                )
              : null),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/bg_repeat.png"),
              repeat: ImageRepeat.repeat),
        ),
        child: _screenList[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: purpleColor,
        unselectedItemColor: lightWhiteTextColor,
        backgroundColor: darkBlack,
        type: BottomNavigationBarType.fixed,
        // for applying color we have to give type fix
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Image.asset(
                      "asset/images/icon/PTZ.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/icon/PTZ.png",
                      height: 20,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Image.asset(
                      "asset/images/icon/Webcam.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/icon/Webcam.png",
                      height: 20,
                    ),
              label: "Session"),
          BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? Image.asset(
                      "asset/images/icon/Calendar.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/icon/Calendar.png",
                      height: 20,
                    ),
              label: "Notificaion"),
          BottomNavigationBarItem(
              icon: currentIndex == 3
                  ? Image.asset(
                      "asset/images/icon/Profile.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/icon/Profile.png",
                      height: 20,
                    ),
              label: "Setting"),
        ],
      ),
    );
  }
}
