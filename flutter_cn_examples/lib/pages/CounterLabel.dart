import 'package:flutter/material.dart';
import 'package:fluttercnexamples/common/CommonScaffold.dart';
import 'package:provider/provider.dart';

class CounterLabel extends StatelessWidget {
  const CounterLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Counter();
      },

      child: Consumer<Counter>(
        builder: (BuildContext context, Counter counter, Widget child) {
          return CommonScaffold(
            titleStr: "CounterLabel", 
            bodyWidget: Center(
              child: Text(
                counter.count.toString(), 
                style: Theme.of(context).textTheme.display1,
              ),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                //counter._increament();
                Counter counterWithoutListen = Provider.of<Counter>(context, listen: false);
                counterWithoutListen._increament();
              }, 
              tooltip: "Increament",
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void _increament() {
    _count++;
    notifyListeners();
  }
}