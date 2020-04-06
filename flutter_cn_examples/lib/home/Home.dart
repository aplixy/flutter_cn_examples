import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/DefAdapter.dart';
import 'package:fluttercnexamples/common/MyListViewBuilder.dart';

List<ItemData> _dataList = [
  ItemData("跳转到搜索页面", "/search", arguments: {"id" : 123}), 
  ItemData("跳转到商品页面", "/product"), 
  ItemData("跳转到StackDemoPage", "/stack_demo"), 
  ItemData("跳转到AppBarDemo", "/app_bar_demo"), 
  ItemData("跳转到TabBarController", "/tabbar_controller"), 
  ItemData("跳转到ButtonDemoPage", "/button_demo"), 
  ItemData("跳转到TextFieldDemoPage", "/text_field_demo"), 
  ItemData("跳转到CheckboxDemoPage", "/checkbox_demo"), 
  ItemData("跳转到radio_demo", "/radio_demo"), 
  ItemData("跳转到form_demo", "/form"), 
  ItemData("跳转到DatePickerDemo", "/date_picker_demo"), 
  ItemData("跳转到CupertinoDatePickerDemo", "/cupertino_date_picker_demo"), 
  ItemData("跳转到SwiperDemo", "/swiper_demo"), 
  ItemData("跳转到DialogPage", "/dialog_page"), 
  ItemData("跳转到HttpDemo", "/http_demo"), 
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
            if (data.arguments == null) {
              Navigator.pushNamed(_context, data.naviName);
            } else {
              Navigator.pushNamed(_context, data.naviName, arguments: data.arguments);
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