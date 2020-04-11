import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  ScrollNotificationTestRoute({Key key}) : super(key: key);

  @override
  _ScrollNotificationTestRouteState createState() => _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState extends State<ScrollNotificationTestRoute> {

  String _progress = "0%";
  @override
  Widget build(BuildContext context) {

    

    
    return CommonScaffold(
      titleStr: "ScrollNotificationTestRoute",
      bodyWidget: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            ScrollMetrics metrics = notification.metrics;
            double progress = metrics.pixels / metrics.maxScrollExtent;

            //print("${metrics.pixels} / ${metrics.maxScrollExtent}");
            //print("$progress");
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
              //print(_progress);
            });
            print("BottomEdge: ${metrics.extentAfter == 0}");
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"),);
                }
              ),

              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ), 
        )
      ),
    );
  }
}