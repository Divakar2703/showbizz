import 'package:flutter/material.dart';
import 'package:showbiz/presentation/constant/constant.dart';
import 'package:showbiz/presentation/screen/select_user.dart';
import 'package:showbiz/presentation/widget/logo_widget.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 900)).then((value) {
      Navigator.pushNamed(context, SelectUser.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkBlack,
        body: Container(

            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/bg_repeat.png"),
                  repeat: ImageRepeat.repeat),
            ),
            child: const Center(child: Hero(
                tag: "logo_widget",
                child: LogoWidget()),))
    );
  }
}
