import 'package:flutter/material.dart';

abstract class DefAdapter {
  

  int getCount();

  Widget convertView(int index);

  List<Widget> getWidgetList() {
    int count = getCount();
    if (count <= 0) return null;

    List<Widget> widgetList = new List<Widget>();

    for (var i = 0; i < count; i++) {
      widgetList.add(convertView(i));
    }

    return widgetList;
  }
}