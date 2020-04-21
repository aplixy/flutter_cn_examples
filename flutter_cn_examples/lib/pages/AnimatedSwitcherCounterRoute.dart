import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/common/SlideTransitionX.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "AnimatedSwitcherCounterRoute",
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //return ScaleTransition(scale: animation, child: child);
                return SlideTransitionX(
                  child: child,
                  direction: AxisDirection.up,
                  animation: animation, 
                );
              }, 

              child: Text(
                "$_count", 
                key: ValueKey<int>(_count), 
                style: Theme.of(context).textTheme.display1,
              ),
            ), 

            RaisedButton(
              child: const Text("+1"),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              }, 
            ), 
          ],
        ),
      ),
    );
  }
}