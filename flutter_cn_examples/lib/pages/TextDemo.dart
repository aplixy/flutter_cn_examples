import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/ToastTools.dart';

class TextDemo extends StatefulWidget {
  TextDemo({Key key}) : super(key: key);

  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {

  TextEditingController _userNameController;

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    //_userNameController.addListener(() {});

    _userNameController.text = "选中效果测试";
    _userNameController.selection=TextSelection(
      baseOffset: 2, 
      extentOffset: _userNameController.text.length
    );

    _focusNode2.addListener(() {
      showToast(_focusNode2.hasFocus ? "获取焦点" : "失去焦点");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextDemo"),
      ), 

      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名",
              prefixIcon: Icon(Icons.people)
            ),
            controller: _userNameController,
          ), 

          RaisedButton(
            child: Text("获取用户名"),
            onPressed: () {
              showToast(_userNameController.text);
            },
          ), 

          SizedBox(height: 20), 

          TextField(
            decoration: InputDecoration(
              labelText: "Focus Node 1",
              hintText: "Focus Node 1",
              prefixIcon: Icon(Icons.people)
            ),
            focusNode: _focusNode1,
            autofocus: true,
          ), 

          TextField(
            decoration: InputDecoration(
              labelText: "Focus Node 2",
              hintText: "Focus Node 2",
              prefixIcon: Icon(Icons.people)
            ),
            controller: _userNameController,
            focusNode: _focusNode2,
          ), 

          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    if (null == _focusScopeNode) {
                      _focusScopeNode = FocusScope.of(context);
                    }
                    _focusScopeNode.requestFocus(_focusNode2);
                  },
                ), 
              ),
              SizedBox(width: 10), 
              Expanded(
                flex: 1,
                child: RaisedButton(
                  child: Text("关闭键盘"),
                  onPressed: () {
                    print(_userNameController.text);
                    _focusNode1.unfocus();
                    _focusNode2.unfocus();
                  },
                ), 
              ),
            ],
          ), 

          SizedBox(height: 20), 

          Container(
            width: double.infinity,
            child: Theme(
              data: Theme.of(context).copyWith(
                hintColor: Colors.grey[200],
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.amber), 
                  hintStyle: TextStyle(color: Colors.red, fontSize: 14.0)
                )
              ), 
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Theme test", 
                  hintText: "Theme test", 
                ),
              ), 
            ),
          ), 
          SizedBox(height: 20), 

          Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "电子邮件地址",
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none,
              ),
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.green[200], width: 1.0))
            ),
          ),
        ],
      ),
    );
  }
}