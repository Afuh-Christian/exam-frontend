import 'package:exam_front_end/Controllers/ExamController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Components/Navbar.dart';
import 'Pages/HomePage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ExamController examController = Get.find<ExamController>();
     
    return  NavBarMobile(
      controller: examController,
      body:  HomePage(),
    );
  }
}
