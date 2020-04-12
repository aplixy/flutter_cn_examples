import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:english_words/english_words.dart';

class InfiniteListView2 extends StatefulWidget {
  InfiniteListView2({Key key}) : super(key: key);

  @override
  _InfiniteListView2State createState() => _InfiniteListView2State();
}

class _InfiniteListView2State extends State<InfiniteListView2> {

  static const N = 100;

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() async {

    //print("_retrieveData");

    if (!_loading) {

      setState(() {
        _loading = true;
      });

      try {
        await Future.delayed(Duration(seconds: 2));
        _words.insertAll(
          _words.length - 1, 
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
        );
      } catch (e) {
        print(e.toString());
      } finally {

        print("finally");
        setState(() {
          _loading = false;
        });
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "InfiniteListView",
      bodyWidget: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {

          print("###收到通知");
          
          if (notification.metrics.extentAfter == 0) {
            print("到底了");
            if (_words.length < N) {
              if (!_loading) {
                print("获取数据");
                _retrieveData();
              } else {
                print("!!!正在获取，请稍候");
              }
            } else {
              print("数据够了：${_words.length}");
            }
          }

          return false;
        },
        
        child: ListView.separated(
          itemCount: _words.length, 
          itemBuilder: (context, index) {
            if (index  == _words.length - 1) {
              if (_loading && _words.length < N) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                  ),
                );
              } else if (_words.length >= N) {
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
      )
    );
  }
}
