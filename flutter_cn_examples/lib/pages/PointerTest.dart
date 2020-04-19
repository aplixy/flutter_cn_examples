import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class PointerTest extends StatefulWidget {
  PointerTest({Key key}) : super(key: key);

  @override
  _PointerTestState createState() => _PointerTestState();
}

class _PointerTestState extends State<PointerTest> {

  PointerEvent _event;

  void updateState(PointerEvent e) {
    setState(() {
      _event = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "PointerTest",
      bodyWidget: ListView(
        children: <Widget>[
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300,
              height: 150,
              child: Text(_event?.toString()??"", style: TextStyle(color: Colors.white),),
            ),
            onPointerDown: (e) => updateState(e),
            onPointerMove: (e) => updateState(e),
            onPointerUp: (e) => updateState(e),
          ), 

          SizedBox(
            height: 10, 
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.amber), ),
          ), 

          Listener(
            child: Container(
              //color: Colors.tealAccent,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(
                  child: Text("Box A"),
                ),
              ),
            ), 
            

            //behavior: HitTestBehavior.opaque,
            onPointerDown: (PointerDownEvent e) {
              print("Box A onPointerDown");
            },
          ), 

          SizedBox(
            height: 10, 
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.amber), ),
          ),

          Listener(
            onPointerDown: (e) {
              /* 外层父布局总能收到点击事件，但是如果其中一个子布局hitTestChildren返回true
                则不再把点击事件传给其它子布局，只有当前一个子布局的hitTestChildren返回false时
                才会尝试把点击事件传给下一个子布局 */
              print("--->stack onPointerDown");
            },

            child: Stack(
              children: <Widget>[
                /* 先加入的子布局更靠后，在传递点击事件时先给靠前的子布局传递，后给靠后的子布局传递，
                  因此这个子布局在点击事件传递过程中属于第二个子布局 */
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300, 200)),
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue), 
                    ),
                  ),

                  onPointerDown: (PointerDownEvent e) {
                    print("blue down");
                  },
                ), 

                // 后加入的子布局更靠前，在传递点击事件时先给靠前的子布局传递，因此这个子布局在点击中属于第一个子布局
                Listener(
                  child: ConstrainedBox(
                    // 注意这里没有加任何有颜色的Container或者BoxDecoration，否则相当于HitTestBehavior.opaque
                    constraints: BoxConstraints.tight(Size(200, 100)),
                    child: Center(
                      child: Text("200 x 100范围"),
                    ),
                  ),

                  onPointerDown: (PointerDownEvent e) {
                    print("200 x 100范围 onPointerDown");
                  },
                  /* translucent：当自身和子组件都无法通过点击测试时，强行将自身加入点击列表，
                    但是hitTest依然返回false，hitTest返回false意味着父布局Stack可以将点击事件
                    继续传递给其它子组件，因此这里设置为translucent时不仅会打印"200 x 100范围 onPointerDown"，
                    还会打印下一个子布局的"blue down" */
                  behavior: HitTestBehavior.translucent,
                  /* opaque：让自身通过点击测试，hitTestSelf返回true，因此hitTest返回true，hitTest返回true
                    意味着父布局Stack不能再将点击事件继续传递给其它子组件，因此设置为opaque时只会打印
                    "200 x 100范围 onPointerDown"，不会再打印下一个子布局的"blue down" */
                  //behavior: HitTestBehavior.opaque,
                ), 
              ],
            ), 
          ), 
          

          SizedBox(
            height: 10, 
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.amber), ),
          ),

          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red, 
                  width: 200,
                  height: 100,
                ),
                onPointerDown: (PointerDownEvent e) {
                  print("in--->pointer down");
                },
              ),
            ),

            onPointerDown: (PointerDownEvent e) {
              print("out--->pointer down");
            },
          ), 
        ],
      ), 
    );
  }
}