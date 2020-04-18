import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  GestureDetectorTestRoute({Key key}) : super(key: key);

  @override
  _GestureDetectorTestRouteState createState() => _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!";

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "GestureDetectorTestRoute",
      bodyWidget: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200,
            height: 100,
            child: Text(
              _operation, 
              style: TextStyle(color: Colors.white),
            ),
          ),

          onTap: () => updateText("onTap"),
          onDoubleTap: () => updateText("onDoubleTap"),
          onLongPress: () => updateText("onLongPress"),

        ),
      ),
    );
  }
}