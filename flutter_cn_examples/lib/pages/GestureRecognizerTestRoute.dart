import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class GestureRecognizerTestRoute extends StatefulWidget {
  GestureRecognizerTestRoute({Key key}) : super(key: key);

  @override
  _GestureRecognizerTestRouteState createState() => _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState extends State<GestureRecognizerTestRoute> {

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "GestureRecognizerTestRoute",
      bodyWidget: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "你好世界"),
              TextSpan(
                text: "点我变色", 
                style: TextStyle(
                  fontSize: 30.0, 
                  color: _toggle ? Colors.blue : Colors.red, 
                ),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },  
              ),
              TextSpan(text: "你好世界"),
            ], 
          ), 
        ),
      ),
    );
  }
}