import 'package:exam_front_end/Controllers/init_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Home.dart';



Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
     GetMaterialApp(
      initialBinding: InitDepBinding(),
      title: 'Exam',
      debugShowCheckedModeBanner: false,
      home: const Home()
    );
    //  ChangeNotifierProvider(
    // create: ((context) => ExamProvider()),
    // child:  MainApp(),
    // );
  }
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//      GetMaterialApp(
//       initialBinding: InitDepBinding(),
//       title: 'Exam',
//       debugShowCheckedModeBanner: false,
//       home: const Home()
//     );
//   }
// }