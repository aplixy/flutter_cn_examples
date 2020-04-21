import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class PageRouteDemo2 extends StatelessWidget {
  const PageRouteDemo2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "PageRouteDemo2",
      bodyWidget: Center(
        child: Text("This is PageRouteDemo2"),
      ),
    );
  }
}