import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class AsyncUiDemo extends StatelessWidget {
  const AsyncUiDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "AsyncUiDemo",
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyFutureBuilder(), 
            MyStreamBuilder(),
          ],
        ),
      ),
    );
  }
}

class MyFutureBuilder extends StatelessWidget {
  const MyFutureBuilder({Key key}) : super(key: key);

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockNetworkData(), 
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return Text("Contents: ${snapshot.data}");
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class MyStreamBuilder extends StatelessWidget {
  const MyStreamBuilder({Key key}) : super(key: key);

  Stream<int> counter() {
    return Stream.periodic(
      Duration(seconds: 1), 
      (i) {
        return i;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: counter(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("没有stream");
            break;
          case ConnectionState.waiting:
            return Text("等待数据...");
            break;
          case ConnectionState.active:
            return Text("active: ${snapshot.data}");
            break;
          case ConnectionState.done:
            return Text("Stream已关闭");
            break;
          default: return null;
        }
      },
    );
  }
}