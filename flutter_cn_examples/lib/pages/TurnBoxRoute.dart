import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/common/TurnBox.dart';
import 'package:fluttercnexamples/common/TurnBoxImplicitly.dart';

class TurnBoxRoute extends StatefulWidget {
  TurnBoxRoute({Key key}) : super(key: key);

  @override
  _TurnBoxRouteState createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "TurnBoxRoute",
      bodyWidget: Center(
        child: Column(
          children: <Widget>[
            TurnBoxImplicitly(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh, size: 50, ),
            ), 
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh, size: 150, ),
            ), 

            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns += .2;
                });
              }, 
            ), 

            RaisedButton(
              child: Text("逆时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns -= .2;
                });
              }, 
            ), 
          ],
        ),
      ),
    );
    
    
  }
}