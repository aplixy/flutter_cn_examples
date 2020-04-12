import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/common/ToastTools.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  WillPopScopeTestRoute({Key key}) : super(key: key);

  @override
  _WillPopScopeTestRouteState createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {

  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WillPopScopeTestRoute"),
      ),
      body: WillPopScope(
        onWillPop: () async{
          
          if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            showToast("再按一次退出");
            return false;
          }
          return true;
        }, 
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒人连续按两次返回键退出"),
        ), 
      ),
    );
  }
}