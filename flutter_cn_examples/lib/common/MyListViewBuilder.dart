import 'package:flutter/material.dart';

import 'DefAdapter.dart';

class MyListViewBuilder {

  DefAdapter _adapter;

  MyListViewBuilder(DefAdapter adapter) {
    this._adapter = adapter;
  }
  
  void setAdapter(DefAdapter adapter) {
    this._adapter = adapter;
  }

  ListView builder() {
    if (_adapter == null) {
      throw Exception("An adapter is necessary");
    }

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: _adapter.getCount(),
      itemBuilder: (context, index) {
        return _adapter.convertView(index);
      },
    );
  }
}