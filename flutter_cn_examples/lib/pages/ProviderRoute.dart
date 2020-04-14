import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
//import 'package:provider/provider.dart';
import '../common/MyProvider.dart';

class ProviderRoute extends StatefulWidget {
  ProviderRoute({Key key}) : super(key: key);

  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleStr: "ProviderRoute",
      bodyWidget: Center(
        child: ChangeNotifierProvider<CartModel>(
          create: new CartModel(), 
          child: Column(
            children: <Widget>[
              Builder(builder: (context) {
                return Column(
                  children: <Widget>[
                    Builder(builder: (context) {
                      CartModel cart = ChangeNotifierProvider.of<CartModel>(context);
                      return Text("总价：${cart.totalPrice}");
                    }), 

                    Text("总价：${ChangeNotifierProvider.of<CartModel>(context).totalPrice}"),

                    Builder(builder: (context) {
                      print("RaisedButton build");

                      return RaisedButton(
                        child: Text("添加商品"),
                        onPressed: () {
                          ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20.0, 1));
                        }, 
                      );
                    })
                  ],
                );
              }),

              SizedBox(height: 10), 

              Consumer<CartModel>(
                builder: (context, cart) {
                  return Column(
                    children: <Widget>[
                      Text("总价(Consumer)：${cart.totalPrice}"), 
                      RaisedButton(
                        child: Text("添加商品(Consumer)"),
                        onPressed: () {
                          ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20.0, 1));
                        }
                      )
                    ],
                  );
                  
                  
                },
              )
            ],
          ), 
        )
      ),
    );
      
  }
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get itmes => new UnmodifiableListView(_items);

  double get totalPrice => _items.fold<double>(0, (double value, Item item) => value + item.count * item.price);

  void add(Item item) {
    _items.add(item);

    notifyListeners();
  }
}


class Item {
  Item(this.price, this.count);

  double price;
  int count;

}