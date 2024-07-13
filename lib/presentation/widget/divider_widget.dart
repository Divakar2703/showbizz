import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double height;

  const DividerWidget({Key? key, this.height = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
