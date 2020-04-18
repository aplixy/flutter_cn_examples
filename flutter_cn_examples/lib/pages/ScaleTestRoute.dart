import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class ScaleTestRoute extends StatefulWidget {
  ScaleTestRoute({Key key}) : super(key: key);

  @override
  _ScaleTestRouteState createState() => _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<ScaleTestRoute> {
  static const double _ORIGINAL = 200;
  static const double _MIN = 200 * 0.8;
  static const double _MAX = 2000;

  double _width = _ORIGINAL;
  double _lastUp = _ORIGINAL;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "ScaleTestRoute",
      bodyWidget: Center(
        child: GestureDetector(
          child: Image.network("http://cdn.xie2.com/a/1/31181/1.jpg", width: _width),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //_width = 200 * details.scale.clamp(.8, 10.0);

              if (_width >= _MIN && _width <= _MAX) {
                double scale = details.scale.clamp(.8, 10.0);
                _width = _lastUp * scale;
                //print(_width);
                print(scale);
              } else {
                if (_width < _MIN) _width = _MIN;
                else if (_width > _MAX) _width = _MAX;
              }
            });
          },

          onScaleEnd: (ScaleEndDetails details) {
            _lastUp = _width;
            print(_lastUp);
          },
        ),
      ),
    );
  }
}