import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class StaggerRoute extends StatefulWidget {
  StaggerRoute({Key key}) : super(key: key);

  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin {

  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      
    }
  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "StaggerRoute",
      bodyWidget: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },

        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1), 
              border: Border.all(color: Colors.black.withOpacity(0.5)), 
            ),

            child: StaggerAnimation(controller: _controller,),
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {

  final Animation<double> controller;
  
  Animation<double> heightAnim;
  Animation<EdgeInsets> paddingAnim;
  Animation<Color> colorAnim;

  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    heightAnim = new Tween<double>(begin: 0.0, end: 300.0)
      .animate(
        CurvedAnimation(
          parent: controller, 
          curve: Interval(
            0.0, 
            0.6, 
            curve: Curves.ease, 
          ), 
        )
      );

    colorAnim = new ColorTween(begin: Colors.green, end: Colors.red)
      .animate(
        CurvedAnimation(
          parent: controller, 
          curve: Interval(0.0, 0.6, curve: Curves.ease), 
        )
      );

    paddingAnim = new Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: 0), 
      end: EdgeInsets.only(left: 100)
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Interval(
          0.6, 1.0,
          curve: Curves.ease 
        ), 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller, 
      builder: (context, child) {
        return Container(
          alignment: Alignment.bottomCenter,
          padding: paddingAnim.value,
          child: Container(
            color: colorAnim.value, 
            width: 50, 
            height: heightAnim.value,
          ),
        );
      },  
    );
  }
}