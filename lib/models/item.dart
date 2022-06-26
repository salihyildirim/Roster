class Item {
  final String tittle;
  bool isDone;

  Item({required this.tittle, this.isDone = false});

  Item.fromMap(Map map)
      : tittle = map['tittle'],
        isDone = map['isDone']; //named Constructor

  Map<String, dynamic> toMap() => {'tittle': tittle, 'isDone ': isDone};

  void toggleStatus() {
    isDone = isDone;
  }
}
