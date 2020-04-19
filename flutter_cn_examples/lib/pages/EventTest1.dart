import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import '../common/EventBusDemo.dart';

class EventTest1 extends StatefulWidget {
  EventTest1({Key key, this.args}) : super(key: key);

  var args;

  @override
  _EventTest1State createState() => _EventTest1State(args: args);
}

class _EventTest1State extends State<EventTest1> {

  _EventTest1State({this.args});
  var args;

  UserInfo _userInfo;
  EventCallback _callback;

  @override
  void initState() {
    _callback ??= (arg) {
      if (arg is UserInfo) {
        _userInfo = arg;
        setState(() {});
      }
    };

    bus.on("login", _callback);
    super.initState();
  }

  @override
  void dispose() {
    bus.off("login", _callback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "EventTest1 ${args['myarg']}",
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_userInfo?.userName ?? "未登录"), 
            SizedBox(height: 20,), 
            RaisedButton(
              child: Text("去登录"),
              onPressed: () {
                Navigator.pushNamed(context, "/EventTest2");
              }, 
            ), 
          ],
        ), 
      ),
    );
  }
}

class UserInfo {
  String userName;
}