import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Provider.dart';
import 'Screen_Sizes/Layout_Builder.dart';
import 'Screen_Sizes/Desktop/Desktop_main.dart';
import 'Screen_Sizes/MobileApp/MobileA_main.dart';
import 'Screen_Sizes/Tablet/Tablet_main.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: ((context) => ExamProvider()),
    child: const MainApp(),
    );
  }
}




class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    const MaterialApp(
      title: 'Exam',
      debugShowCheckedModeBanner: false,
      home:  Layout_Builder(
        Moblie_App: MobileA_App(),
        Tablet_App: Tablet_App(),
        Desktop_App: Desktop_App(),
        )
    );
  }
}