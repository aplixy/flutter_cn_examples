import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class HttpTestRoute extends StatefulWidget {
  HttpTestRoute({Key key}) : super(key: key);

  @override
  _HttpTestRouteState createState() => _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {

  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "HttpTestRoute",
      bodyWidget: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("get"),
                onPressed: _loading ? null : get, 
              ), 

              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(_text),
              ), 
            ],
          ),
        ), 
      ),
    );
  }


  void get() async {
    setState(() {
      _loading = true;
      _text = "正在请求...";
    });

    HttpClient httpClient;
    HttpClientRequest request;

    try {
      httpClient = new HttpClient();
      request = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");

      HttpClientResponse response = await request.close();

      _text = await response.transform(utf8.decoder).join();

      print(response.headers);


    } catch (e) {
      _text = "请求失败：$e";
    } finally {
      setState(() {
        _loading = false;
      });

      if (request != null) {
        try {
          request.close();
        } catch (e) {
          print("request close exception: $e");
        }
      }

      if (httpClient != null) {
        try {
          httpClient.close();
        } catch (e) {
          print("httpClient close exception: $e");
        }
      }
    }
  }
}