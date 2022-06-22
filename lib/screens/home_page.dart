import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getitdonee/models/items_data.dart';
import 'package:getitdonee/screens/settings_page.dart';
import 'package:getitdonee/widgets/item_card.dart';
import 'package:provider/provider.dart';

import 'item_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: buildAppBar(context),
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
                      child: Consumer<ItemData>(
                        builder: (context, itemData, child) => Align(
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: itemData.items.length,
                            itemBuilder: (context, index) => ItemCard(
                              tittle: itemData.items[index].tittle,
                              isDone: itemData.items[index].isDone,
                              toggleStatus: (_) {
                                itemData.toggleStatus(index);
                              },
                              deleteItem: (_) {
                                itemData.deleteItem(index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
        floatingActionButton: buildFAB(context));
  }

  FloatingActionButton buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55),
          ),
          context: context,
          builder: (context) => SingleChildScrollView(child: ItemAdder()),
        );
      },
      child: Icon(Icons.add),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 35,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              }),
        )
      ],
      centerTitle: true,
      title: Text(
        'Get It Done',
      ),
    );
  }
}
