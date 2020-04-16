import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/DefAdapter.dart';
import 'package:fluttercnexamples/common/MyListViewBuilder.dart';

List<ItemData> _dataList = [
  ItemData("DialogDemo", "/DialogDemo"), 
  ItemData("AsyncUiDemo", "/AsyncUiDemo"), 
  ItemData("ThemeTestRoute", "/ThemeTestRoute"), 
  ItemData("ProviderRoute", "/ProviderRoute"), 
  ItemData("UserModelProviderDemo", "/UserModelProviderDemo"), 
  ItemData("CounterLabel", "/CounterLabel"), 
  ItemData("InheritedWidgetTestRoute", "/InheritedWidgetTestRoute"), 
  ItemData("WillPopScopeTestRoute", "/WillPopScopeTestRoute"), 
  ItemData("InfiniteListView2", "/InfiniteListView2"), 
  ItemData("ScrollNotificationTestRoute", "/ScrollNotificationTestRoute"), 
  ItemData("ScrollControllerTestRoute", "/ScrollControllerTestRoute"), 
  ItemData("CustomScrollViewTestRoute", "/CustomScrollViewTestRoute"), 
  ItemData("InfiniteGridView", "/InfiniteGridView"), 
  ItemData("InfiniteListView", "/InfiniteListView"), 
  ItemData("SingleChildScrollViewTestRoute", "/SingleChildScrollViewTestRoute"), 
  ItemData("BottomNaviDemo", "/BottomNaviDemo"), 
  ItemData("ProgressRoute", "/ProgressRoute"), 
  ItemData("FormTestRoute", "/FormTestRoute"), 
  ItemData("TextDemo", "/TextDemo"), 
  ItemData("Signature", "/Signature"), 
  ItemData("MyFadeTest", "/MyFadeTest"), 
];

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeAdapter _adapter;

  @override
  void initState() {
    super.initState();
    _adapter = HomeAdapter(context, _dataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home页"),
      ),
      body: MyListViewBuilder(_adapter).builder(),
    );
  }
}





// ======================================

class HomeAdapter extends DefAdapter {
  BuildContext _context;

  List<ItemData> _dataList;
  HomeAdapter(this._context, this._dataList);

  @override
  Widget convertView(int index) {
    ItemData data = _dataList[index];

    return Column(
      children: <Widget>[
        ListTile(
          title: Text(data.title),
          onTap: () {
            try {
              if (data.arguments == null) {
                Navigator.pushNamed(_context, data.naviName);
              } else {
                Navigator.pushNamed(_context, data.naviName, arguments: data.arguments);
              }
            } catch (e) {
              print("路由错误：$e");
              //showToast("路由错误");
            }
          },
        ),
        Divider(),
      ],
    );
  }

  @override
  int getCount() {
    return _dataList.length;
  }
  
}

class ItemData {
  String title;
  String naviName;
  var arguments;

  ItemData(this.title, this.naviName, {this.arguments});
}