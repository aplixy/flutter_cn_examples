import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final String titleStr;
  final Widget bodyWidget;
  final FloatingActionButton floatingActionButton;
  const CommonScaffold({Key key, this.titleStr = "Default Route", this.bodyWidget, this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
      ),

      body: bodyWidget,

      floatingActionButton: floatingActionButton,

    );
  }
}