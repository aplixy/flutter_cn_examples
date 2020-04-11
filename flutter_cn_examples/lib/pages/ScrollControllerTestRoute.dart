import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  ScrollControllerTestRoute({Key key}) : super(key: key);

  @override
  _ScrollControllerTestRouteState createState() => _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);

      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "滚动控制",
      bodyWidget: Scrollbar(
        child: ListView.builder(
          itemCount: 100, 
          itemExtent: 50.0, 
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(title: Text("$index"));
          }, 
        ), 
      ),

      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(
            .0, 
            duration: Duration(milliseconds: 10000), 
            curve: Curves.ease, 
          );
        }, 
      ),
    );
  }
}