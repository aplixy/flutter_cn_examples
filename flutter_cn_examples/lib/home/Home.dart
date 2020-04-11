import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/DefAdapter.dart';
import 'package:fluttercnexamples/common/MyListViewBuilder.dart';

List<ItemData> _dataList = [
  ItemData("MyFadeTest", "/MyFadeTest"), 
  ItemData("Signature", "/Signature"), 
  ItemData("TextDemo", "/TextDemo"), 
  ItemData("FormTestRoute", "/FormTestRoute"), 
  ItemData("ProgressRoute", "/ProgressRoute"), 
  ItemData("BottomNaviDemo", "/BottomNaviDemo"), 
  ItemData("SingleChildScrollViewTestRoute", "/SingleChildScrollViewTestRoute"), 
  ItemData("InfiniteListView", "/InfiniteListView"), 
  ItemData("InfiniteGridView", "/InfiniteGridView"), 
  ItemData("CustomScrollViewTestRoute", "/CustomScrollViewTestRoute"), 
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