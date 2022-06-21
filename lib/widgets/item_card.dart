import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String tittle;
  final bool isDone;

  ItemCard({required this.isDone, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(tittle, style: TextStyle(color: Colors.black)),
        trailing: Checkbox(
          onChanged: null,
          value: isDone,
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
