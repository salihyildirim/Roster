class Item {
  final String tittle;
  bool isDone;

  Item({required this.tittle, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }
}
