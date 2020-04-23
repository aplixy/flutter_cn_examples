import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/common/GradientButton.dart';

class GradientButtonRoute extends StatefulWidget {
  GradientButtonRoute({Key key}) : super(key: key);

  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "GradientButtonRoute",
      bodyWidget: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              child: Text("Submit"), 
              height: 50,
              onPressed: () {},
              colors: [Colors.orange, Colors.red],
            ), 
            GradientButton(
              child: Text("Submit"), 
              height: 50,
              onPressed: () {},
              colors: [Colors.lightGreen, Colors.green[700]],
            ), 
            GradientButton(
              child: Text("Submit"), 
              height: 50,
              onPressed: () {},
              colors: [Colors.lightBlue[300], Colors.blueAccent],
            ), 
          ],
        ),
      ),
    );
  }
}