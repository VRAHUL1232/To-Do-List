import 'package:flutter/material.dart';
import 'package:to_do_list/list_item.dart';
import 'package:to_do_list/model.dart';
import 'package:to_do_list/dialog_box.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() {
    return _ItemScreenState();
  }
}

class _ItemScreenState extends State<ItemScreen> {
  final List<Item> _registeredItems = [];

  var enteredText = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    enteredText.dispose();
  }

  void _removeItem(Item item) {
    setState(() {
      _registeredItems.remove(item);
    });
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      _registeredItems[index].decision = !_registeredItems[index].decision;
    });
  }

  void onSave() {
    if (enteredText.text.isEmpty) {
      return;
    }
    setState(() {
      _registeredItems.add(Item(title: enteredText.text, decision: false));
      enteredText.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) => DialogScreen(
              enteredText: enteredText,
              onCancel: () {
                Navigator.of(context).pop();
                enteredText.clear();
              },
              onSave: onSave,
            ));
  }

  @override
  Widget build(context) {
    Widget mainWidget = Center(
      child: Text("No Item found! Add some",
          style: Theme.of(context).textTheme.titleSmall),
    );

    if (_registeredItems.isNotEmpty) {
      mainWidget = ListView.builder(
        itemCount: _registeredItems.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
          ),
          key: ValueKey(_registeredItems[index]),
          onDismissed: (direction) => _removeItem(_registeredItems[index]),
          child: ListItem(
            taskName: _registeredItems[index].title,
            taskCompleted: _registeredItems[index].decision,
            onChanged: (value) => checkBoxChange(value, index),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "TO DO",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(child: mainWidget)
          ],
        ));
  }
}
