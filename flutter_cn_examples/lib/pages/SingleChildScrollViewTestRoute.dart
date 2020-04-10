import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {

  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  
  SingleChildScrollViewTestRoute({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "SingleChildScrollViewTestRoute",
      bodyWidget: Scrollbar(
        child: SingleChildScrollView(
          //physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: str.split("").map((c) => Text(c, textScaleFactor: 2,)).toList() ,
            ),
          ),
        ), 
      ),
    );
  }
}