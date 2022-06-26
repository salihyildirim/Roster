import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [];

  static SharedPreferences? _sharedPref;

  List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String tittle) {
    _items.add(
      Item(tittle: tittle),
    );
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //SharedPref Metotları

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Item> items) {
    //List<Item> ---> List<String> çevir sonra da sharedPrefe kaydet

    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(json.encode(item.toMap()));
    }
    //SHAREDPREF KAYDETSİN
    _sharedPref!.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    //sharedprefte kaydedilen encodelu veriyi çekip onu List<Item>e dönüştürüp uygulamada kullandığımız _items listesine kaydedelim.
    List<String> tempList = _sharedPref?.getStringList('toDoData') ?? [];
    _items.clear();
    for (var item in tempList) {
      var i = json.decode(item); // on decode ile stringi mape çevirdik
      _items.add(Item(tittle: i['tittle'], isDone: i['isDone'] ?? true));
    }
  }
}
