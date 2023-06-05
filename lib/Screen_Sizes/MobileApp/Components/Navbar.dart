import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Global_Components/Nav_Components/NavTitle.dart';
import '../../Global_Components/Nav_Components/Nav_Drawer.dart';
import '../../Global_Components/Nav_Components/Nav_avatar.dart';
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
        appBar: AppBar(
           title: const AppTitleWiget(
        width: 120, bookwidth: 22, bookheight: 22, titlefont: 21),
 
   
    backgroundColor: Colors.white,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black),
    actions: const [
      UserFace(
        image: "images/nouser.png",
        imageHeight: 22,
        imagewidth: 35,
        top: 10,
        bottom: 10,
        right: 20,
        left: 0,
        raduis: 3000.0,
      )
    ] 
    
    ),
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



 


