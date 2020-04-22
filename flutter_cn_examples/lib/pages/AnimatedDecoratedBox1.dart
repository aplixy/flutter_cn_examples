import 'package:flutter/material.dart';

class AnimatedDecoratedBox1 extends StatefulWidget {

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Duration reverseDuration;
  final Curve curve;


  AnimatedDecoratedBox1({
    Key key, 
    @required this.decoration, 
    this.child, 
    this.curve, 
    this.duration, 
    this.reverseDuration
  }) : super(key: key);

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1> with SingleTickerProviderStateMixin {

  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> get curvedAnimation => _curvedAnimation;
  Animation<double> _curvedAnimation;

  DecorationTween _tween;

  Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this, 
    );

    _tween = new DecorationTween(begin: widget.decoration);
    _curvedAnimation = getCurvedAnimation();
    _animation = _tween.animate(_curvedAnimation);

  }

  Animation<double> getCurvedAnimation() {
    Animation<double> temp;
    if (widget.curve != null) {
      temp = new CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      temp = _controller;
    }
    return temp;
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.curve != oldWidget.curve) {
      _curvedAnimation = getCurvedAnimation();
      _animation = _tween.animate(_curvedAnimation);
    }

    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;

    BoxDecoration preDecoration = _tween.end == null ? _tween.begin : _tween.end;

    // if (widget.decoration != (_tween.end ?? _tween.begin)) {
    //   _tween
    //     ..begin = _tween.evaluate(_curvedAnimation)
    //     ..end = widget.decoration;

    //   _controller
    //     ..value = 0.0
    //     ..forward();
    // }

    if (widget.decoration != preDecoration) {
      _tween.begin = preDecoration;
      _tween.end = widget.decoration;

      _controller.value = 0.0;
      _controller.forward();
    }

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation, 
      builder: (context, child) {
        return DecoratedBox(
          decoration: _animation.value, 
          child: child,
        );
      },
      child: widget.child, 
    );
  }
}