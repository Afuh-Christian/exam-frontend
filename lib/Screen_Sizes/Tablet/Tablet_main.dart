import 'package:flutter/material.dart';


class Tablet_App extends StatelessWidget {
  const Tablet_App({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Tablet'),
          backgroundColor: Colors.orange,
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
 
    );
  }
}