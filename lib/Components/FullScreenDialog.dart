import 'package:flutter/material.dart';

// void main() => runApp(const FullScreenDialog());

class FullScreenDialog extends StatefulWidget {
  const FullScreenDialog({super.key});

  @override
  State<FullScreenDialog> createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: ElevatedButton(
          child: Text("Back"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));
  }
}
