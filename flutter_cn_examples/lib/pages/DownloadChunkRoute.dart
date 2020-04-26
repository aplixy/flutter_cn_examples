import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:path_provider/path_provider.dart';
import '../common/DownloadTools.dart';

class DownloadChunkRoute extends StatefulWidget {
  DownloadChunkRoute({Key key}) : super(key: key);

  @override
  _DownloadChunkRouteState createState() => _DownloadChunkRouteState();
}

class _DownloadChunkRouteState extends State<DownloadChunkRoute> {

  double _progress = 0;

  String _progressDisplay = "0%";

  String url = "http://download.dcloud.net.cn/HBuilder.9.0.2.macosx_64.dmg";
  var savePath = "/example/HBuilder.9.0.2.macosx_64.dmg";

  Future<String> _getLocalPath() async {
    //String dir = (await getApplicationDocumentsDirectory()).path;

    List<Directory> dirs = await getExternalCacheDirectories();
    print("length--->${dirs.length}");
    
    String dir;
    if (dirs.length > 0) {
      dir = dirs.first.path;
    } else {
      dir = (await getApplicationDocumentsDirectory()).path;
    }

    print("_getLocalPath--->$dir");
    return dir;
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "DownloadChunkRoute",
      bodyWidget: Center(
        child: Padding(
          padding: EdgeInsets.all(20), 
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: _progress, 
              ), 

              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(_progressDisplay),
                  ), 
                ],
              ), 
              SizedBox(height: 20,), 
              RaisedButton(
                child: Text("download"),
                onPressed: () async {
                  String localPath = await _getLocalPath();

                  await downloadWithChuncks(
                    url, 
                    localPath + savePath, 
                    onReceiveProgress: (int received, int total) {
                      if (total != -1 && total > 0) {
                        _progress = received / total;
                        //print("progress--->$_progress");
                        //print("${(_progress * 100).floor()}%");


                        setState(() {
                          if (_progress < 1) {
                            _progressDisplay = "${(_progress * 100).floor()}%";
                          } else {
                            _progressDisplay = "下载完成：${localPath + savePath}";
                          }
                        });
                      }
                    }, 
                  );
                }, 
              )
            ],
          ),
        ),
      ),
    );
  }
}