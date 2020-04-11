import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatelessWidget {
  const CustomScrollViewTestRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Demo"),
              background: Image.asset("./images/aaa.jpg", fit:BoxFit.cover, ),
            ),
          ), 

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                mainAxisSpacing: 10.0, 
                crossAxisSpacing: 10.0, 
                childAspectRatio: 4.0, 
              ), 
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center, 
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text("grid item $index"),
                  );
                }, 
                childCount: 20, 
              ), 
            ), 
          ), 

          SliverFixedExtentList(
            itemExtent: 50.0, 
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text("list item $index"),
                );
              }, 
              childCount: 50, 
            ), 
          )
        ],
      ),
    );
  }
}