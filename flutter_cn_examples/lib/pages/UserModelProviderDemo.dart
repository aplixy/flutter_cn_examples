import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:provider/provider.dart';

class UserModelProviderDemo extends StatelessWidget {
  const UserModelProviderDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserModel _userModel = new UserModel();

    return MultiProvider(
      providers: [
        ListenableProvider<UserModel>.value(value: _userModel)
      ], 

      child: Builder(builder: (context) {
        return CommonScaffold(
          titleStr: "UserModelProviderDemo", 
          bodyWidget: Builder(
            builder: (context) {
              return Column(
                children: <Widget>[

                  ClipOval(
                    child: Image.network(
                      Provider.of<UserModel>(context).avatar, 
                      fit: BoxFit.cover,
                      width: 200, 
                      height: 200,
                    ),
                  ),


                  Text(
                    Provider.of<UserModel>(context).user, 
                    style: Theme.of(context).textTheme.display2,
                  ), 

                  Text(
                    Provider.of<UserModel>(context).isLogin ? "已登录" : "未登录", 
                    style: Theme.of(context).textTheme.display1,
                  ), 
                ],
              );
            }
          ), 

          floatingActionButton: FloatingActionButton(onPressed: () {
            Provider.of<UserModel>(context, listen: false).login();
          }),
        );
      }), 
      
    );
  }
}

class UserModel extends ChangeNotifier {
  


  String _user = "aaa";
  String get user => _user;

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  String _avatar = "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2756375537,259603999&fm=26&gp=0.jpg";
  String get avatar => _avatar;

  void login() {
    _user = "明子";
    _isLogin = true;
    _avatar = "http://cdn.xie2.com/a/1/31181/1.jpg";
    notifyListeners();
  }
}