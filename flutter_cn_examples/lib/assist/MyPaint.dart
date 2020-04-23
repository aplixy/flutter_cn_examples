import 'package:flutter/material.dart';
import 'package:fluttercnexamples/assist/MyPainter2.dart';

import 'MyPainter.dart';

class MyPaint extends StatefulWidget {
  MyPaint({Key key}) : super(key: key);

  @override
  _MyPaintState createState() => _MyPaintState();
}

class _MyPaintState extends State<MyPaint> {

  Size _size = new Size(300, 300);
  double dx;
  double dy;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: _size, 
      painter: MyPainter(),
      child: RepaintBoundary(
        child: GestureDetector(
          child: CustomPaint(
            size: _size,
            painter: MyPainter2(dx, dy),
          ),

          onTapDown: (TapDownDetails details) {
            setState(() {
              dx = details.localPosition.dx;
              dy = details.localPosition.dy;
            });
          },
        ), 
      ),
    );
  }
}