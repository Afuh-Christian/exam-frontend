import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Pages/HomePage.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Exam',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
