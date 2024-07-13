import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showbiz/presentation/constant/app_hive.dart';

class AppHelper {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    //! Init Hive
    // List<String> boxNames = [
    //   'auth',
    // ];
    // await AppHive.initAllHive(boxNames);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );
  }
}
