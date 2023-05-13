import 'package:flutter/material.dart';



class Desktop_App extends StatelessWidget {
  const Desktop_App({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
  
    );
  }
}