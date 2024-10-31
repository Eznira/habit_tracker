import 'package:flutter/material.dart';

class CustomDialogue extends StatefulWidget {
  CustomDialogue({
    super.key,
    required this.controller,
    required this.cancel,
    required this.save,
  });

  TextEditingController controller;
  final void Function()? cancel;
  final void Function()? save;

  @override
  State<CustomDialogue> createState() => _CustomDialogueState();
}

class _CustomDialogueState extends State<CustomDialogue> {
  String? enteredText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      title: Center(
        child: Text(
          'Enter New Habit',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      content: TextField(
        controller: widget.controller,
        style: const TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          hintText: 'Enter your text here',
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
        ),
        onChanged: (text) {
          setState(() {
            enteredText = text;
          });
        },
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: widget.cancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor:
                  widget.controller.text == '' ? Colors.grey : Colors.green),
          onPressed: widget.save,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
