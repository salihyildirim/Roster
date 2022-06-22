import 'package:flutter/cupertino.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item(tittle: 'Peynir al'),
    Item(tittle: 'Çöpü at'),
    Item(tittle: 'Faturayı Öde'),
    Item(tittle: 'Faturayı Öde'),
  ];

  void toggleStatus(int index) {
    items[index].toggleStatus();
    notifyListeners();
  }

  void addItem(String tittle) {
    items.add(
      Item(tittle: tittle),
    );
    notifyListeners();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
