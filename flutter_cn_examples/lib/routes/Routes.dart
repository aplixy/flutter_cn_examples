import 'package:flutter/material.dart';
import 'package:fluttercnexamples/home/Home.dart';
import 'package:fluttercnexamples/pages/MyFadeTest.dart';
import 'package:fluttercnexamples/pages/Signature.dart';
import '../common/ToastTools.dart';

final routes = {
  "/": (context) => Home(),
  "/MyFadeTest": (context) => MyFadeTest(),
  "/Signature": (context) => Signature(),

};


Route<dynamic> Function(RouteSettings) onGenerateRoute2 = (RouteSettings settings){
  String name = settings.name;
  Function myFun = routes[name];

  if (myFun == null) {
    print("找不到$name对应的路由配置");
    showToast("找不到$name对应的路由配置");
    return null;
  }

  int closureArgumentsCount = 1;

  String pattern = myFun.toString();
  pattern = pattern.split("=>")[0];
  int startIndex = pattern.indexOf("(") +1;
  if (startIndex >= 0) {
    int endIndex = pattern.lastIndexOf(")");
    if (endIndex >= startIndex) {
      pattern = pattern.substring(startIndex, endIndex);

      closureArgumentsCount = pattern.split(",").length;
    } else {
      print("!!!未找到参数闭括号");
    }
  } else {
    print("!!!未找到开括号");
  }

  return MaterialPageRoute(
    builder: (context) {
      Widget widget;
      switch (closureArgumentsCount) {
        case 1:
          widget = myFun(context);
          break;
        case 2:
          widget = myFun(context, arguments: settings.arguments);
          break;
        default:
      }

      return widget;
    }
  );
};


