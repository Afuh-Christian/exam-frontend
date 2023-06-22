import 'package:exam_front_end/Provider/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Provider.dart';
import '../../Global_Components/Nav_Components/NavTitle.dart';
import '../../Global_Components/Nav_Components/Nav_Drawer.dart';
import '../../Global_Components/Nav_Components/Nav_avatar.dart';
import '../Constants/Nav_Constants.dart';

colorTheme appTheme = ExamProvider().theme();

List navitems = [
  {
    "titlename": "home",
    "icon": Icon(Icons.home  , size: 20, color: appTheme.icon_secondary ,),
  },
  {
    "titlename": "About",
    "icon": Icon(Icons.question_answer  , size: 20, color: appTheme.icon_secondary ,),
  },
  {
    "titlename": "Admin dashboard",
    "icon": Icon(Icons.admin_panel_settings  , size: 20, color: appTheme.icon_secondary ,),
  },
  {
    "titlename": "Account Setting",
    "icon": Icon(Icons.settings  , size: 20, color: appTheme.icon_secondary ,),
  },
  {
    "titlename": "mode",
    "icon": Icon(Icons.dark_mode , size: 20, color: appTheme.icon_secondary ,),
  },
];

class NavBarMobile extends StatefulWidget {
  const NavBarMobile({super.key, required this.provider, required this.body});

  final Widget body;
  final ExamProvider provider;

  @override
  State<NavBarMobile> createState() => _NavBarMobileState();
}

class _NavBarMobileState extends State<NavBarMobile> {
  @override
  Widget build(BuildContext context) {
    // final themeprovider = Provider.of<ThemeProvider>(context);
    var appTheme = widget.provider.theme();
    return Scaffold(
        appBar: 
        // AppBar()
        AppBar(
            title:  AppTitleWiget(
              provider : widget.provider,
                width: 120, bookwidth: 22, bookheight: 22, titlefont: 21),
            backgroundColor: appTheme.background_primary,
            // backgroundColor: appTheme.navbackgroundColor,
            centerTitle: true,
            iconTheme:
                // IconThemeData(color: appTheme.navbarIconColor),
                IconThemeData(color: appTheme.icon_primary),
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
            ]),
        drawer:  NavDrawer(
          provider: widget.provider,
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
          imagewidth: 120,
          imageheight: 120,
          image: "images/nouser.png",
        ),
        backgroundColor: widget.provider.theme().background_primary,
        body: widget.body);
  }
}
