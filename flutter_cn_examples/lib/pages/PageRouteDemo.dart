import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:fluttercnexamples/pages/PageRouteDemo2.dart';

class PageRouteDemo extends StatelessWidget {
  const PageRouteDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "PageRouteDemo",
      bodyWidget: Center(
        child: Padding(
          padding: EdgeInsets.all(10), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Navigate"),
                onPressed: () {
                  Navigator.push(
                    context, 
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation, 
                          child: PageRouteDemo2(), 
                        );
                      }
                    )
                  );
                }, 
              ),
              
              SizedBox(height: 20), 

              RaisedButton(
                child: Text("Navigate Rotate"),
                onPressed: () {
                  Navigator.push(
                    context, 
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                        return RotationTransition(
                          child: PageRouteDemo2(), 
                          turns: animation,
                        );
                      }
                    )
                  );
                }, 
              ),

              SizedBox(height: 20), 

              RaisedButton(
                child: Text("FadeRoute"),
                onPressed: () {
                  Navigator.push(
                    context, 
                    FadeRoute(
                      builder: (BuildContext context) {
                        return PageRouteDemo2();
                      }, 
                    )
                  );
                }, 
              ),
            ],
          ),
        ), 
        
      ),
    );
  }
}

class FadeRoute extends PageRoute {

  FadeRoute({
    @required this.builder, 
    this.transitionDuration = const Duration(milliseconds: 500), 
    //this.opaque = true ,
    this.barrierColor, 
    this.barrierLabel, 
    this.maintainState = true, 
  });

  final WidgetBuilder builder;


  @override
  Color barrierColor;
  @override
  String barrierLabel;
  @override
  bool maintainState;
  @override
  Duration transitionDuration;
  // @override
  // bool opaque;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    
    if (isActive) {
      return FadeTransition(
        opacity: animation, 
        child: builder(context), 
        //turns: animation,
      );
    } else {
      return RotationTransition(
        turns: animation, 
        child: PageRouteDemo(),
      );
    }

    
  }
  
}