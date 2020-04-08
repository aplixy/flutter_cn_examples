import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/LoadingDialog.dart';

class ProgressRoute extends StatefulWidget {
  ProgressRoute({Key key}) : super(key: key);

  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  LoadingDialog _loadingDialog;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(
      () => setState(
        () => {}
      )
    );

  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void showTest() {
    if (_loadingDialog == null) {
      _loadingDialog = new LoadingDialog(context);
    }

    _loadingDialog.show();
  }

  @override
  Widget build(BuildContext context) {
    //showTest();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ProgressRoute")
      ),

      body: SingleChildScrollView(
        
        child: Padding(
          padding: EdgeInsets.all(16), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController),
                value: _animationController.value,
              ),

              SizedBox(height:50),

              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),

              SizedBox(height:50),

              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ), 

              SizedBox(height:50),

              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),

              SizedBox(height:50),

              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),

              SizedBox(height:50),

              RaisedButton(
                onPressed: () {
                  showTest();
                }, 
                child: Text("test"),
              )
            ],
          ),  
        ),
      ),
    );
    
    
  }
}