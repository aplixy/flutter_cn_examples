import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/res/LocalImagesUri.dart';

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "HeroAnimationRouteB",
      bodyWidget: Center(
        child: Hero(
          tag: "avatar",
          child: GestureDetector(
            child: Image.asset(localImages[3]),
            onTap: () {
              Navigator.of(context).pop();
            },
          ), 
          
        ),
      ),
    );
  }
}