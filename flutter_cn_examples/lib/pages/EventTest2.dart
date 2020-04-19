import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/pages/EventTest1.dart';
import '../common/EventBusDemo.dart';

class EventTest2 extends StatefulWidget {
  EventTest2({Key key}) : super(key: key);

  @override
  _EventTest2State createState() => _EventTest2State();
}

class _EventTest2State extends State<EventTest2> {

  TextEditingController _controller;
  UserInfo _userInfo;

  @override
  void initState() {
    _controller = new TextEditingController();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "EventTest2",
      bodyWidget: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "用户名：${_userInfo?.userName}", 
              style: TextStyle(
                fontSize: 20.0, 
              ),
            ),

            SizedBox(height: 20), 

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "User Name", 
                hintText: "Please enter user name", 
                prefixIcon: Icon(Icons.people), 
              ),
            ), 

            SizedBox(height: 20), 

            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  "登录", 
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  _userInfo ??= new UserInfo();
                  String userName = _controller.text;
                  _userInfo.userName = userName == null || userName.length == 0 ? "缺省用户名" : userName;
                  bus.emit("login", _userInfo);
                  setState(() {
                    
                  });
                }, 
              ),
            ), 
          ],
        ), 
      ), 
    );
  }
}