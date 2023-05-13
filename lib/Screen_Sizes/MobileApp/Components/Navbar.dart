import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Global_Components/Nav_Components/Nav_Drawer.dart';
import '../Constants/Nav_Constants.dart';

List navitems = [
  {
    "titlename": "home",
    "icon": Icon(Icons.home),
  },
  {
    "titlename": "About",
    "icon": Icon(Icons.question_answer),
  },
  {
    "titlename": "Admin dashboard",
    "icon": Icon(Icons.admin_panel_settings),
  },
  {
    "titlename": "Account Setting",
    "icon": Icon(Icons.settings),
  },
  {
    "titlename": "Light mode",
    "icon": Icon(Icons.sunny),
  },
];


class NavBarMobile extends StatelessWidget {
  const NavBarMobile({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        drawer: const NavDrawer(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
          imagewidth: 120,
          imageheight: 120,
          image: "images/nouser.png",
        ),
        body:body);
  }
}



 


