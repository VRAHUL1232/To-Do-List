import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({
    super.key,
    required this.enteredText,
    required this.onSave,
    required this.onCancel,
  });

  final enteredText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Items", style: Theme.of(context).textTheme.bodyLarge),
      content: Container(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: Theme.of(context).textTheme.titleSmall,
              controller: enteredText,
              maxLength: 50,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onCancel,
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: onSave, child: const Text("Save")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
