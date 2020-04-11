import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:english_words/english_words.dart';

class InfiniteListView extends StatefulWidget {
  InfiniteListView({Key key}) : super(key: key);

  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then(
      (e) {
        _words.insertAll(
          _words.length - 1, 
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
        );
        setState(() {
          
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "InfiniteListView",
      bodyWidget: ListView.separated(
          itemCount: _words.length, 
          itemBuilder: (context, index) {
            if (_words[index] == loadingTag) {
              print("遍例到了loadingTag--->$index");
              if (_words.length - 1 < 100) {
                _retrieveData();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text("没有更多了", style: TextStyle(color: Colors.grey)),
                );
              }
            }

            return ListTile(title: Text(_words[index]),);


          }, 
          separatorBuilder: (context, index) => Divider(height: .0,), 
        ),
    );
  }
}
