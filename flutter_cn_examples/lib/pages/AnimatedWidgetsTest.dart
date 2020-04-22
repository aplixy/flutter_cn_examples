import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/common/ToastTools.dart';

class AnimatedWidgetsTest extends StatefulWidget {
  AnimatedWidgetsTest({Key key}) : super(key: key);

  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {

  double _padding = 10;
  Alignment _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = new TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  Duration _duration = new Duration(seconds: 5);


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "AnimatedWidgetsTest",
      bodyWidget: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: AnimatedPadding(
                duration: _duration, 
                padding: EdgeInsets.all(_padding), 
                child: Text("AnimatedPadding"),
              ),
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              }, 
            ), 

            SizedBox(
              height: 50, 
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: _duration, 
                    left: _left,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      }, 
                      child: Text("AnimatedPositioned"),
                    ), 
                  ),
                ],
              ),
            ), 

            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                alignment: _align, 
                duration: _duration,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  }, 
                  child: Text("AnimatedAlign"),
                ), 
              ),
            ), 

            AnimatedContainer(
              duration: _duration,
              height: _height,
              color: _color,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _height = 150;
                    _color = Colors.blue;
                  });
                }, 
                child: Text(
                  "AnimatedContainer", 
                  style: TextStyle(color: Colors.white),
                ), 
              ), 
            ), 

            AnimatedDefaultTextStyle(
              duration: _duration, 
              style: _style, 
              child: GestureDetector(
                child: Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = new TextStyle(
                      color: Colors.blue, 
                      decorationStyle: TextDecorationStyle.solid, 
                      decorationColor: Colors.blue, 
                    );
                  });
                },
              ), 
            )
          ].map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: e, 
            );
          }).toList(),
        ),
      ),
    );
  }
}