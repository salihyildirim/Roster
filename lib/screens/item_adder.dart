import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getitdonee/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom), // klavyenin modalbottomsheetı kapatmaması için
      color: Colors.yellowAccent,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                minLines: 1,
                maxLines: 3,
                controller: textController,
                onChanged: (input) {},
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelText: 'Add Item',
                    hintText: '...'),
                autofocus: true, //imleç gözüksün tıklayınca textfielda
              ),
              MaterialButton(
                  child: Text('ADD'),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    Provider.of<ItemData>(context, listen: false)
                        .addItem(textController.text);
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
