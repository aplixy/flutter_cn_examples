import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPainter2 extends CustomPainter {


  double dx;
  double dy;

  double x, y;

  Color _color = Colors.black;

  List<Item> items;
  List<String> itemPositions;

  MyPainter2(this.dx, this.dy);



  @override
  void paint(Canvas canvas, Size size) {


    if (dx == null || dy == null) return;

    if (items == null) {
      items = [];
    }

    if (itemPositions == null) {
      itemPositions = [];
    }


    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    Paint paint = new Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    double radius = min(eWidth / 2, eHeight / 2) - 2;


    // 根据点击坐标计算落子坐标
    x = calc(dx, eWidth);
    y = calc(dy, eHeight);

    // 根据上次落子颜色确定本次落子颜色（黑、白子交替绘制）
    if (items != null && items.length > 0) {
      Item item = items.last;
      _color = item.color == Colors.black ? Colors.white : Colors.black;
    }

    Item item = new Item(x, y, _color);
    String itemPos = item.toString();
    
    // 同一位置只能落一子
    if (!itemPositions.contains(itemPos)) {
      itemPositions.add(itemPos);
      items.add(item);
    }

    // 循环绘制所有棋子
    for (var item in items) {
      item.draw(canvas, radius, paint);
    }


  }

  @override
  bool shouldRepaint(MyPainter2 oldDelegate) {
    items = oldDelegate.items;
    itemPositions = oldDelegate.itemPositions;
    return true;
  }

  
  /// 根据点击坐标`tapPos`返回落子坐标
  double calc(double tapPos, double unitLength) {
    double drawPos;

    int index = tapPos ~/ unitLength;
    drawPos = index * unitLength;

    double delta = tapPos - drawPos;
    if (delta.abs() > unitLength/ 2) {
      if (delta > 0) drawPos += unitLength;
      else drawPos += unitLength;
    }

    return drawPos;
  }
  
}

class Item {
  Item(this.x, this.y, this.color);

  double x;
  double y;
  Color color;

  void draw(Canvas canvas, double radius, Paint paint) {
    if (canvas == null || radius == null || radius <= 0 || paint == null) return;
    paint.color = color;
    canvas.drawCircle(
      Offset(x, y), 
      radius, 
      paint, 
    );
  }

  @override
  String toString() {
    return "$x,$y";
  }
}