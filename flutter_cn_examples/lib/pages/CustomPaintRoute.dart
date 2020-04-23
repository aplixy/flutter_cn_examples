import 'package:flutter/material.dart';
import 'package:fluttercnexamples/assist/MyPaint.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class CustomPaintRoute extends StatefulWidget {
  CustomPaintRoute({Key key}) : super(key: key);

  @override
  _CustomPaintRouteState createState() => _CustomPaintRouteState();
}

class _CustomPaintRouteState extends State<CustomPaintRoute> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "CustomPaintRoute",
      bodyWidget: Center(
        child: MyPaint(),
      ),
    );
  }
}