import 'dart:convert';

main() {
  Item itemObject = Item(tittle: 'uyu', isDone: true);
  print('itemObject: $itemObject');
  print('itemObject Type: ${itemObject.runtimeType}');

  //itemi map'e sonra jsona çeviriyoruz.
  Map itemAsMap = itemObject.toMap();
  String itemAsJson = json.encode(itemAsMap);
//jsonu map'e sonra item'a çeviriyoruz.
  itemAsMap = json.decode(itemAsJson);
  //itemObject = Item(tittle: itemAsMap['tittle'], isDone: itemAsMap['isDone']);
  itemObject = Item.fromMap(itemAsMap);
}

class Item {
  String tittle;
  bool isDone;

  Item({required this.tittle, required this.isDone});
  Item.fromMap(Map map)
      : tittle = map['tittle'],
        isDone = map['isDone']; //named Constructor

  Map<String, dynamic> toMap() => {'tittle': tittle, 'isDone ': isDone};
}
