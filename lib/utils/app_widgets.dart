import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppWidgets {
  static Widget getLoadingView() => const Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 35,
        ),
      );
}
