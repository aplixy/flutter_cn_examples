import 'package:flutter/material.dart';
import 'package:fluttercnexamples/home/Home.dart';
import 'package:fluttercnexamples/pages/BottomNaviDemo.dart';
import 'package:fluttercnexamples/pages/CounterLabel.dart';
import 'package:fluttercnexamples/pages/CustomScrollViewTestRoute.dart';
import 'package:fluttercnexamples/pages/FormTestRoute.dart';
import 'package:fluttercnexamples/pages/InfiniteGridView.dart';
import 'package:fluttercnexamples/pages/InfiniteListView.dart';
import 'package:fluttercnexamples/pages/InfiniteListView2.dart';
import 'package:fluttercnexamples/pages/InheritedWidgetTestRoute.dart';
import 'package:fluttercnexamples/pages/MyFadeTest.dart';
import 'package:fluttercnexamples/pages/ProgressRoute.dart';
import 'package:fluttercnexamples/pages/ProviderRoute.dart';
import 'package:fluttercnexamples/pages/ScrollControllerTestRoute.dart';
import 'package:fluttercnexamples/pages/ScrollNotificationTestRoute.dart';
import 'package:fluttercnexamples/pages/Signature.dart';
import 'package:fluttercnexamples/pages/SingleChildScrollViewTestRoute.dart';
import 'package:fluttercnexamples/pages/TextDemo.dart';
import 'package:fluttercnexamples/pages/ThemeTestRoute.dart';
import 'package:fluttercnexamples/pages/UserModelProviderDemo.dart';
import 'package:fluttercnexamples/pages/WillPopScopeTestRoute.dart';
import '../common/ToastTools.dart';

final routes = {
  "/": (context) => Home(),
  "/MyFadeTest": (context) => MyFadeTest(),
  "/Signature": (context) => Signature(),
  "/TextDemo": (context) => TextDemo(),
  "/FormTestRoute": (context) => FormTestRoute(),
  "/ProgressRoute": (context) => ProgressRoute(),
  "/BottomNaviDemo": (context) => BottomNaviDemo(),
  "/SingleChildScrollViewTestRoute": (context) => SingleChildScrollViewTestRoute(),
  "/InfiniteListView": (context) => InfiniteListView(),
  "/InfiniteGridView": (context) => InfiniteGridView(),
  "/CustomScrollViewTestRoute": (context) => CustomScrollViewTestRoute(),
  "/ScrollControllerTestRoute": (context) => ScrollControllerTestRoute(),
  "/ScrollNotificationTestRoute": (context) => ScrollNotificationTestRoute(),
  "/InfiniteListView2": (context) => InfiniteListView2(),
  "/WillPopScopeTestRoute": (context) => WillPopScopeTestRoute(),
  "/InheritedWidgetTestRoute": (context) => InheritedWidgetTestRoute(),
  "/CounterLabel": (context) => CounterLabel(),
  "/UserModelProviderDemo": (context) => UserModelProviderDemo(),
  "/ProviderRoute": (context) => ProviderRoute(),
  "/ThemeTestRoute": (context) => ThemeTestRoute(),

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


