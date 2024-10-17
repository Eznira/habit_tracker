import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  HabitTile({
    super.key,
    required this.habitName,
    required this.onCompleted,
    required this.onChanged,
    required this.deleteHabit,
    required this.editHabit,
  });

  final String habitName;
  bool onCompleted;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? editHabit;
  final void Function(BuildContext)? deleteHabit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged!(onCompleted),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: editHabit,
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
                icon: Icons.edit,
                label: 'Edit',
                borderRadius: BorderRadius.circular(12),
              ),
              SlidableAction(
                onPressed: deleteHabit,
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: onCompleted
                    ? Colors.green
                    : Theme.of(context).colorScheme.primary),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: ListTile(
              title: Text(
                habitName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              leading: Checkbox(
                activeColor: Colors.green,
                value: onCompleted,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
