import 'package:flutter/cupertino.dart';

class SlideTransitionX extends AnimatedWidget {

  Animation<double> get animation =>listenable;

  final bool transformHitTests;
  final Widget child;
  
  final AxisDirection direction;

  Tween<Offset> _tween;



  SlideTransitionX({
    Key key, 
    @required Animation<double> animation, 
    this.transformHitTests = true, 
    this.direction = AxisDirection.down, 
    this.child
  }) : assert(animation != null), super(key: key, listenable: animation) {

    switch (direction) {
      case AxisDirection.up: // 向上滑，滑进来，滑之前在下边
        _tween = new Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right: // 向右滑，滑进来
        _tween = new Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = new Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = new Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
      default:
    }
  }

  

  

  @override
  Widget build(BuildContext context) {

    Offset offset = _tween.evaluate(animation);

    if (animation.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
        case AxisDirection.down:
          offset = new Offset(offset.dx, -offset.dy);
          break;

        case AxisDirection.right:
        case AxisDirection.left:
          offset = new Offset(-offset.dx, offset.dy);
          break;
        default:
      }
    }

    
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: FadeTransition(
        opacity: animation, 
        child: child,
      ), 
    );
  }
  
}