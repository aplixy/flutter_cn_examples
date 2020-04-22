import 'package:flutter/material.dart';

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {

  final BoxDecoration decoration;
  final Widget child;

  AnimatedDecoratedBox({
    Key key, 
    @required this.decoration, 
    this.child, 
    Curve curve = Curves.linear, 
    @required Duration duration, 
  }) : super (
    key: key, 
    curve: curve, 
    duration: duration, 
  );


  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return new _AnimatedDecoratedBoxState();
  }
  
}

class _AnimatedDecoratedBoxState extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {

  DecorationTween _tween;


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _tween.animate(animation).value, 
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _tween = visitor(
      _tween, 
      widget.decoration, 
      (value) {
        return new DecorationTween(
          begin: value
        );
      }
    );
  }
  
}