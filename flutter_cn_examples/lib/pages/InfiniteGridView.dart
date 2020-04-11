import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class InfiniteGridView extends StatefulWidget {
  InfiniteGridView({Key key}) : super(key: key);

  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = [];

  bool loading = true;

  @override
  void initState() { 
    super.initState();
    _retrieveIcons();
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 2000)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit, 
          Icons.airport_shuttle, 
          Icons.all_inclusive, 
          Icons.beach_access, 
          Icons.cake, 
          Icons.free_breakfast, 
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "InfiniteGridView",
      bodyWidget: GridView.builder(
        shrinkWrap: true, 
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, 
          childAspectRatio: 1.0, 
        ), 
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 20) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        }, 
      ),
    );
  }
}