import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:showbiz/core/app_helper.dart';
import 'package:showbiz/presentation/constant/constant.dart';
import 'package:showbiz/presentation/screen/splash_screen.dart';

import 'core/routes.dart';

void main() async {
  
  await AppHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShowBizness',
      theme: ThemeData(
        scaffoldBackgroundColor: buttonDarkPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: Routes.onGenerateRoute,
      home: const SplashScreen(),
    );
  }
}
