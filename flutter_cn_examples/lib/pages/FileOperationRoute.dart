import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationRoute extends StatefulWidget {
  FileOperationRoute({Key key}) : super(key: key);

  @override
  _FileOperationRouteState createState() => _FileOperationRouteState();
}

class _FileOperationRouteState extends State<FileOperationRoute> {
  int _count;

  Future<File> _getLocalFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dir = directory.path;
    return new File("$dir/counter.txt");
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _increamentCount() async {
    setState(() {
      _count++;
    });

    File file = await _getLocalFile();
    await file.writeAsString("$_count");
  }

  @override
  void initState() {
    super.initState();

    _readCounter().then((int value) {
      setState(() {
        _count = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "FileOperationRoute",
      bodyWidget: Center(
        child: Text("$_count"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Increament",
        child: Icon(Icons.add),
        onPressed: _increamentCount,
      ),
    );
  }
}
