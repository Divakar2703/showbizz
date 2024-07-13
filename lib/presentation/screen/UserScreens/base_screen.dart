import 'package:flutter/material.dart';
import 'package:showbiz/presentation/screen/UserScreens/home/home_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/notification/notification_screen.dart';
import 'package:showbiz/presentation/screen/UserScreens/setting/setting_screen.dart';
import 'package:showbiz/presentation/widget/appbar_widget.dart';
import '../../constant/constant.dart';
import 'interactive_session_request/interactive_session_request_Screen.dart';

class BaseScreen extends StatefulWidget {
  static const String routeName = "base_screen";

  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<String> _titleName = [
    "Home",
    "Interactive Session Requests",
    "Notifications",
    "Settings"
  ];
  int currentIndex = 0;
  final List _screenList = [
    const HomeScreen(),
    const InteractiveSessionRequest(),
    const NotificationScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlack,
      appBar: AppbarWidget(
          title: Text(_titleName[currentIndex]),
          appBar: AppBar(),
          
          trailingWidget:  Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("asset/images/users/user1.png"))),
                )),
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
                      "asset/images/bottom_nav/Home_dark.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/bottom_nav/Home.png",
                      height: 20,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Image.asset(
                      "asset/images/bottom_nav/Calendar_dark.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/bottom_nav/Calendar.png",
                      height: 20,
                    ),
              label: "Session"),
          BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? Image.asset(
                      "asset/images/bottom_nav/Notification_dark.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/bottom_nav/Notification.png",
                      height: 20,
                    ),
              label: "Notificaion"),
          BottomNavigationBarItem(
              icon: currentIndex == 3
                  ? Image.asset(
                      "asset/images/bottom_nav/Setting_dark.png",
                      height: 20,
                    )
                  : Image.asset(
                      "asset/images/bottom_nav/Setting.png",
                      height: 20,
                    ),
              label: "Setting"),
        ],
      ),
    );
  }
}
