 import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_picture_application/src/sample_feature/sample_item.dart';

class SampleItemList extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<SampleItem> _items = [];
  int currentItem = 0;

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<SampleItem> get items => UnmodifiableListView(_items);

  int get getCurrentItem => currentItem;

  SampleItem getItem(int id){
    return items.elementAt(id);
  } 

  void setCurrentItem(int id){
    currentItem = id;
    // notifyListeners();
  }

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(SampleItem item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}