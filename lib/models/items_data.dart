import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    Item(tittle: 'Peynir al'),
    Item(tittle: 'Çöpü at'),
    Item(tittle: 'Faturayı Öde'),
    Item(tittle: 'Faturayı Öde'),
  ];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String tittle) {
    _items.add(
      Item(tittle: tittle),
    );
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
}
