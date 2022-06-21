import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getitdonee/models/items_data.dart';
import 'package:getitdonee/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Get It Done',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '${Provider.of<ItemData>(context).items.length} Items',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                        itemCount: Provider.of<ItemData>(context).items.length,
                        itemBuilder: (context, index) => ItemCard(
                            tittle: Provider.of<ItemData>(context)
                                .items[index]
                                .tittle,
                            isDone: Provider.of<ItemData>(context)
                                .items[index]
                                .isDone)),
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ));
  }
}
