import 'package:flutter/material.dart';

class WinnerDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  WinnerDialog(this.title, this.content, this.callback,
      [this.actionText = "Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Text(content),
      actions: [
        ElevatedButton(onPressed: callback, child: Text(actionText))
      ],
    );
  }
}
