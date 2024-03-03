import 'package:flutter/material.dart';

class ListItem extends StatelessWidget{

  ListItem({super.key, required this.taskName, required this.taskCompleted, required this.onChanged});

  final String taskName;
  final bool taskCompleted;
  final void Function(bool? value) onChanged;

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskName,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    decoration: taskCompleted ? TextDecoration.lineThrough : null,
                    decorationThickness: 2,
                  ))
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}