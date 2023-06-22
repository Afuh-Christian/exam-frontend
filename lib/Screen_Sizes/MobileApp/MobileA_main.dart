import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/Provider.dart';
import 'Components/Navbar.dart';
import 'Pages/HomePage.dart';

class MobileA_App extends StatelessWidget {
  const MobileA_App({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<ExamProvider>(context);
    return  NavBarMobile(
      provider: provider,
      body:  HomePage(),
    );
  }
}
