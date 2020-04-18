import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';

class DialogDemo extends StatelessWidget {
  const DialogDemo({Key key}) : super(key: key);

  Future<T> showCustomDialog<T>({@required BuildContext context, bool barrierDismissable = true, WidgetBuilder builder}) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);

    return showGeneralDialog(
      context: context, 
      barrierDismissible: barrierDismissable,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black12,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOut), 
          child: child,
        );
      },


      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        final Widget pageChild = new Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null 
            ? Theme(data: theme, child: pageChild,) 
            : pageChild;
          }), 
        );
      }, 
    );
  }

  void showDeleteConfirmDialog(BuildContext context) {
    showCustomDialog<bool>(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗？"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text("取消"), 
            ), 
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              }, 
              child: Text("删除"), 
            ), 
          ],
        );
      }
    );
  }

  Future<bool> showDeleteConfirmDialog2(BuildContext context) async {
    bool withTree = false;

    return showCustomDialog<bool>(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗？"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"), 
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) setState) {
                      return Checkbox(
                        value: withTree, 
                        onChanged: (bool value) {
                          setState(() {
                            withTree = !withTree;
                          });
                        }, 
                      );
                    }, 
                  ), 
                ],
              ), 
            ],
          ), 

          actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text("取消"), 
              ), 
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                }, 
                child: Text("删除"), 
              ), 
            ],
        );
      }
    );
  }

  Future<bool> showDeleteConfirmDialog3(BuildContext context) async {
    bool withTree = false;

    return showCustomDialog<bool>(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗？"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"), 
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree, 
                        onChanged: (bool value) {
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        }, 
                      );
                    }, 
                  ), 
                ],
              ), 
            ],
          ), 

          actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text("取消"), 
              ), 
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                }, 
                child: Text("删除"), 
              ), 
            ],
        );
      }
    );
  }

  Future<int> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context, 
      builder: (context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          }, 
        );
      }, 
    );
  }

  PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
    return showBottomSheet(
      context: context, 
      builder: (context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                print("$index");
                Navigator.of(context).pop();
              },
            );
          }, 
        );
      }, 
    );
  }

  void showLoadingDialog(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280, 
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(), 
                  Padding(
                    padding: EdgeInsets.only(top: 26.0), 
                    child: Text("正在加载，请稍候..."),
                  ), 
                ],
              ),
            ),
          ),
        );
      } 
    );
  }

  Future<DateTime> showDatePicker2(BuildContext context) {
    var date = DateTime.now();

    return showCupertinoModalPopup(
      context: context, 
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            // minimumDate: date,
            // maximumDate: date.add(Duration(days: 30)),
            // maximumYear: date.year + 1,
            initialDateTime: date,
            onDateTimeChanged: (DateTime value) {
              print(value);
            }, 
          ),
        );
      }, 
    );
  }

  Future<DateTime> _showDatePicker2(BuildContext context) {
    var date = DateTime.now();
    return showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: Text("aaa"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "DialogDemo",
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                showDeleteConfirmDialog(context);
              }, 
              child: Text("ShowCustomDialog"), 
            ), 

            SizedBox(height: 20), 
            FlatButton(
              onPressed: () async {
                bool deleteTree = await showDeleteConfirmDialog2(context);

                deleteTree == null ? print("取消删除") : print("同时删除子目录：$deleteTree");
              }, 
              child: Text("ShowCustomDialog2"), 
            ), 

            SizedBox(height: 20), 
            FlatButton(
              onPressed: () async {
                bool deleteTree = await showDeleteConfirmDialog3(context);

                deleteTree == null ? print("取消删除") : print("同时删除子目录：$deleteTree");
              }, 
              child: Text("ShowCustomDialog3"), 
            ), 

            SizedBox(height: 20), 
            FlatButton(
              onPressed: () async {
                int index = await _showModalBottomSheet(context);

                print("$index");
              }, 
              child: Text("showModalBottomSheet"), 
            ), 

            SizedBox(height: 20), 
            Builder(builder: (context) {
              return FlatButton(
                onPressed: () async {
                  _showBottomSheet(context);

                }, 
                child: Text("showBottomSheet"), 
              );
            }),

            SizedBox(height: 20), 
            FlatButton(
              onPressed: () {
                showLoadingDialog(context);
              }, 
              child: Text("showLoadingDialog"), 
            ), 

            
            SizedBox(height: 20), 
            FlatButton(
              onPressed: () async {
                DateTime date = await showDatePicker2(context);

                print("$date");
              }, 
              child: Text("showDatePicker2"), 
            ), 
          ],
        ),
      ),
    );
  }
}