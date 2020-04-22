import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/pages/AnimatedDecoratedBox1.dart';

import 'AnimatedDecoratedBox.dart';

class AnimatedDecoratedDemo extends StatefulWidget {
  AnimatedDecoratedDemo({Key key}) : super(key: key);

  @override
  _AnimatedDecoratedDemoState createState() => _AnimatedDecoratedDemoState();
}

class _AnimatedDecoratedDemoState extends State<AnimatedDecoratedDemo> {

  Color _color = Colors.blue;
  Duration _duration = new Duration(seconds: 1);
  Curve _curve = Curves.easeIn;


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "AnimatedDecoratedDemo",
      bodyWidget: Column(
        children: <Widget>[
          AnimatedDecoratedBox1(
            duration: _duration,
            curve: _curve, 
            decoration: BoxDecoration(color: _color), 
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _color = Colors.red;
                  _curve = Curves.bounceIn;
                });
              }, 
              child: Text(
                "AnimatedDecoratedBox", 
                style: TextStyle(color: Colors.white)
              ), 
            ),
          ),

          SizedBox(height: 10, ), 

          AnimatedDecoratedBox(
            duration: _duration,
            curve: _curve, 
            decoration: BoxDecoration(color: _color), 
            child: FlatButton(
              onPressed: () {
                setState(() {
                  
                  if (_color == Colors.blue) {
                    _color = Colors.red;
                    _curve = Curves.bounceIn;
                  } else {
                    _color = Colors.blue;
                    _curve = Curves.easeIn;
                  }
                });
              }, 
              child: Text(
                "AnimatedDecoratedBox", 
                style: TextStyle(color: Colors.white)
              ), 
            ),
          ),

        ],
      ), 
      
      
    );
  }
}