import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog {

  void _showTimer(context) {

    var timer = Timer.periodic(
      Duration(
        milliseconds: 3000), 
        (t) {
          t.cancel();
          try {
            Navigator.pop(context);
          } catch (e) {
            print(e);
          }
          
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(// 不用Center的话Container的宽高设置失效，导致全屏显示
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(// 不加Column直接用Stack的话由于Container的吸附性导致Stack大小跟外层的Container一样大，Column会消耗Container在纵向上的吸附性，避免Stack在纵向上被拉伸
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text("关于我们"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),

              Divider(), 

              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text("我是内容"),
              ), 

            ],
          ),
        ),
      ),
    );
  }
}