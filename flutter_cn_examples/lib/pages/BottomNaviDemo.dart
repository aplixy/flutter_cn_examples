import 'package:flutter/material.dart';

class BottomNaviDemo extends StatelessWidget {
  const BottomNaviDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNaviDemo"),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){}), 
            SizedBox(),
            IconButton(icon: Icon(Icons.business), onPressed: (){}), 
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton( //悬浮按钮
        child: Icon(Icons.add),
        onPressed: (){},
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked

    );
  }
}