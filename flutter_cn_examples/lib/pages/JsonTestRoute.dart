import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class JsonTestRoute extends StatefulWidget {
  JsonTestRoute({Key key}) : super(key: key);

  @override
  _JsonTestRouteState createState() => _JsonTestRouteState();
}

class _JsonTestRouteState extends State<JsonTestRoute> {

  static const String _jsonStr = 
  """[
    {
      \"name\": \"John Smith\",
      \"email\": \"john@example.com\"
    }, 
    {
      \"name\": \"Tim Cook\",
      \"email\": \"cookceo@apple.com\"
    }
  ]""";

  TextEditingController _controller = new TextEditingController();

  //User _user;
  String _encodedJsonStr = "_encodedJsonStr";

  List _list;
  List<User> _userList;

  @override
  void initState() {
    super.initState();
    _controller.text = _jsonStr;
  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "JsonTestRoute",
      bodyWidget: Padding(
        padding: EdgeInsets.all(20), 
        child: Column(
          children: <Widget>[
            TextField(
              maxLines: 7,
              controller: _controller,
            ), 

            // Text("name: ${_user?.name?? "user name"}", textAlign: TextAlign.start,), 
            // Text("email: ${_user?.email?? "email addr"}", textAlign: TextAlign.start,), 
            Container(
              height: 200,
              child: ListView.separated(
                itemCount: _userList?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  User user = _userList[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              ), 
            ), 

            

            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text("convert"),
                    onPressed: () {
                      setState(() {
                        _list = jsonDecode(_controller.text);
                        _userList = [];
                        for (var map in _list) {
                          _userList.add(User.fromJson(map));
                        }
                        //_user = User.fromJson(jsonDecode(_jsonStr));
                      });
                    }, 
                  ), 
                ), 

                SizedBox(width: 20, ), 

                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text("encode"),
                    onPressed: () {
                      setState(() {
                        //_encodedJsonStr = _user == null ? "_encodedJsonStr" : jsonEncode(_user);

                        _encodedJsonStr = jsonEncode(_userList);
                      });
                    }, 
                  ), 
                ), 
              ], 
            ), 
            Text(_encodedJsonStr), 
          ]
          .map((e) {
            return Padding(
              padding: EdgeInsets.only(top: 20),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class User {
  String name;
  String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() => <String, dynamic> {'name': name, 'email': email};

}