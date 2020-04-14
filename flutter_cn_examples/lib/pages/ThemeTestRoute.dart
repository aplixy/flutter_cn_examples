import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:provider/provider.dart';


class ThemeTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeModel(), 
        )
      ], 

      child: Consumer<ThemeModel>(builder: (BuildContext context, ThemeModel themeModel, Widget child) {
        return Theme(
          data: ThemeData(
            primarySwatch: themeModel.themeColor, 
            iconTheme: IconThemeData(color: themeModel.themeColor)
          ), 
          child: CommonScaffold(
            titleStr: "主题测试",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite), 
                    Icon(Icons.airport_shuttle), 
                    Text("颜色跟随主题"),
                  ],
                ),

                Theme(
                  data: themeData.copyWith(
                    iconTheme: themeData.iconTheme.copyWith(
                      color: Colors.black
                    ), 
                  ), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite), 
                      Icon(Icons.airport_shuttle), 
                      Text("颜色固定黑色"),
                    ],
                  ), 
                ), 
              ],
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ThemeModel tm = Provider.of<ThemeModel>(context, listen: false);
                tm.change(tm.themeColor == Colors.teal ? Colors.blue : Colors.teal);
              }, 
              child: Icon(Icons.palette),
            ),
          ), 
        );
      },),
    );
  }
}

class ThemeModel extends ChangeNotifier {
  Color _themeColor = Colors.teal;

  Color get themeColor => _themeColor;

  void change(Color color) {
    _themeColor = color;
    notifyListeners();
  }
}