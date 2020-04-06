import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color color = const Color(0xCC383838);
void showToast(String msg) {
  Fluttertoast.showToast(
        msg: msg == null ? "" : msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
}