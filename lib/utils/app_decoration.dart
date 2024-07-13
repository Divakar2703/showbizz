import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration imgDecoration(String img) => BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              img,
            ),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat),
      );
}
