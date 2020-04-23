import 'package:flutter/material.dart';

class TurnBoxImplicitly extends ImplicitlyAnimatedWidget {

  final double turns;
  final int speed;
  final Widget child;


  TurnBoxImplicitly({
    Key key, 
    Curve curve = Curves.linear, 
    this.speed = 200, 
    this.child, 
    this.turns = .0,
  }) : super(
    key: key, 
    curve: curve, 
    duration: Duration(milliseconds: speed ?? 200),
  );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _TurnBoxImplicitlyState();
  }
}

class _TurnBoxImplicitlyState extends AnimatedWidgetBaseState<TurnBoxImplicitly> {

  Tween<double> _tween;

  

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _tween.animate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _tween = visitor(
      _tween, 
      widget.turns, 
      (value) => Tween<double>(begin: value), 
    );

    print(_tween.begin);
    print(_tween.end);

    
  }
  
}