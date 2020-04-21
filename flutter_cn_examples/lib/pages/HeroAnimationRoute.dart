import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/res/LocalImagesUri.dart';

import 'HeroAnimationRouteB.dart';

class HeroAnimationRoute extends StatelessWidget {
  const HeroAnimationRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "HeroAnimationRoute",
      bodyWidget: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(20), 
          child: InkWell(
            child: Hero(
              tag: "avatar", 
              child: ClipOval(
                child: Image.asset(localImages[3], width: 200, height: 200, fit: BoxFit.cover,),
              ), 
            ),

            onTap: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                return FadeTransition(
                  opacity: animation, 
                  child: HeroAnimationRouteB(),
                );
              }));
            },
          ),
        ), 
      ),
    );
  }
}