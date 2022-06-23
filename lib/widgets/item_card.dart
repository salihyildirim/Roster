import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String tittle;
  final bool isDone;
  dynamic toggleStatus;
  dynamic deleteItem;

  ItemCard(
      {required this.isDone,
      required this.tittle,
      required this.toggleStatus,
      required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      //kaydırarak sil. bir widgetı silebilme özelliği
      onDismissed: deleteItem,
      key: Key(tittle),
      child: Card(
        elevation: isDone ? 1 : 5,
        color: isDone ? Colors.green.shade50 : Colors.white,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            tittle,
            style: TextStyle(
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            onChanged: toggleStatus,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
