import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class GestureConflictTestRoute extends StatefulWidget {
  GestureConflictTestRoute({Key key}) : super(key: key);

  @override
  _GestureConflictTestRouteState createState() => _GestureConflictTestRouteState();
}

class _GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "GestureConflictTestRoute",
      bodyWidget: Stack(
        children: <Widget>[
          Positioned(
            top: 80,
            left: _left,
            child: Listener(
              onPointerDown: (PointerDownEvent e) {
                print("onPointerDown");
              },

              onPointerUp: (PointerUpEvent e) {
                print("onPointerUp");
              },

              child: GestureDetector(
                child: CircleAvatar(child: Text("A")),
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },

                onHorizontalDragEnd: (DragEndDetails details) {
                  print("onHorizontalDragEnd");
                },

                // onTapDown: (TapDownDetails details) {
                //   print("onTapDown");
                // },

                // onTapUp: (TapUpDetails details) {
                //   print("onTapUp");
                // },
              ),
            ), 
            
            
          )
        ],
      ),
    );
  }
}