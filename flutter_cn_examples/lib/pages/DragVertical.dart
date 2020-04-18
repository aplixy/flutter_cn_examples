import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class DragVertical extends StatefulWidget {
  DragVertical({Key key}) : super(key: key);

  @override
  _DragVerticalState createState() => _DragVerticalState();
}

class _DragVerticalState extends State<DragVertical> {

  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "DragVertical",
      bodyWidget: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                });
              },

              onHorizontalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                });
              },
            ), 
          )
        ],
      ),
    );
  }
}