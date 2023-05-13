import 'package:flutter/material.dart';
import 'Components/Navbar.dart';
import 'Pages/HomePage.dart';

class MobileA_App extends StatelessWidget {
  const MobileA_App({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavBarMobile(
      body:  HomePage(),
    );
  }
}
