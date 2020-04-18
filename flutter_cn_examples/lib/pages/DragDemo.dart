import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class DragDemo extends StatefulWidget {
  DragDemo({Key key}) : super(key: key);

  @override
  _DragDemoState createState() => _DragDemoState();
}

class _DragDemoState extends State<DragDemo> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "DragDemo",
      bodyWidget: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),

              onPanDown: (DragDownDetails e) {
                print("用户手指按下：${e.globalPosition}");
              },

              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },

              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ), 
          )
        ],
      ),
    );
  }
}