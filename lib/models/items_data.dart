import 'package:flutter/cupertino.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> items = [
    Item(tittle: 'Peynir al'),
    Item(tittle: 'Çöpü at'),
    Item(tittle: 'Faturayı Öde'),
    Item(tittle: 'Faturayı Öde'),
  ];
}
