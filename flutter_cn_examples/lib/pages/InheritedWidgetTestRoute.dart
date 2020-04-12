import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
  InheritedWidgetTestRoute({Key key}) : super(key: key);

  @override
  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "InheritedWidgetTestRoute",
      bodyWidget: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _TestWidget(), 
              ),

              RaisedButton(
                child: Text("increment"),
                onPressed: () {
                  setState(() {
                    ++count;
                  });

                  //++count;
                }, 
              )
            ],
          ),
        ), 
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  _TestWidget({Key key}) : super(key: key);

  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      ShareDataWidget.of(context).data.toString()
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("Dependencies change");
  }
}

class ShareDataWidget extends InheritedWidget {

  final int data;

  ShareDataWidget({
    @required this.data, 
    Widget child, 
  }): super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
  
}