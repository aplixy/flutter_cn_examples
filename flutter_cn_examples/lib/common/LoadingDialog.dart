
import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {

  BuildContext _context;

  LoadingDialog(this._context);



  void show() {
    showDialog(
      context: _context, 

      builder: (context) {
        return this;
      },
    );
  }

  void dismiss() {
    try {
      Navigator.pop(_context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      type: MaterialType.transparency,
      child: Center(// 不用Center的话Container的宽高设置失效，导致全屏显示
        child: Container(
          height: 150,
          width: 150,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(30), 
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
            ),  
          )
        ),
      ),
    );
  }
}