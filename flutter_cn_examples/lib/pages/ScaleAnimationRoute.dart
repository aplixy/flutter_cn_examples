import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/res/LocalImagesUri.dart';

class ScaleAnimationRoute extends StatefulWidget {
  ScaleAnimationRoute({Key key}) : super(key: key);

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with TickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  Animation<double> animation1;
  AnimationController controller1;

  Animation<double> animation2;
  AnimationController controller2;

  Animation<double> animation3;
  AnimationController controller3;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(duration: Duration(seconds: 3), vsync: this, );
    animation = new CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addListener(() => setState(() {}));

    controller1 = new AnimationController(duration: Duration(seconds: 3), vsync: this, );
    animation1 = new CurvedAnimation(parent: controller1, curve: Curves.easeIn);
    animation1 = new Tween(begin: 0.0, end: 300.0).animate(animation1);

    controller2 = new AnimationController(duration: Duration(seconds: 3), vsync: this, );
    animation2 = new CurvedAnimation(parent: controller2, curve: Curves.easeInOutQuart);
    animation2 = new Tween(begin: 0.0, end: 300.0).animate(animation2);

    controller3 = new AnimationController(duration: Duration(seconds: 3), vsync: this, );
    animation3 = new CurvedAnimation(parent: controller3, curve: Curves.bounceInOut);
    animation3 = new Tween(begin: 0.0, end: 300.0).animate(animation3);

    controller.forward();

    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller1.forward();
      }
    });

    animation1.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller2.forward();
      }
    });

    animation2.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller3.forward();
      }
    });

    animation3.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller2.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "ScaleAnimationRoute",
      bodyWidget: ListView(
        children: <Widget>[
          Image.asset(
            localImages[0], 
            width: animation.value,
            height: animation.value,
          ),

          Divider(height: 10,), 

          AnimatedImage(animation: animation1),

          Divider(height: 10,), 

          AnimatedBuilder(
            animation: animation2, 
            child: Image.asset(localImages[2], ),
            builder: (context, child) {
              return Container(
                child: child,
                height: animation2.value,
                width: animation2.value,
              );
            }, 
          ), 

          Divider(height: 10,), 

          GrowTransition(
            animation: animation3,
            child: Image.asset(localImages[3], ),
          ),
        ],
      ), 
    );
  }
}

class AnimatedImage extends AnimatedWidget {

  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Center(
      child: Image.asset(
        localImages[1], 
        width: animation.value,
        height: animation.value,
      ),
    );
  }
  
}

class GrowTransition extends StatelessWidget {
  GrowTransition({Key key, this.animation, this.child}) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation, 
        child: child,
        builder: (BuildContext context, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ), 
    );
  }
}