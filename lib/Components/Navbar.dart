import 'package:exam_front_end/Components/NavTitle.dart';
import 'package:exam_front_end/Components/Nav_Drawer.dart';
import 'package:exam_front_end/Components/Nav_avatar.dart';
import 'package:exam_front_end/Controllers/AppThemeController.dart';
import 'package:exam_front_end/Schemas/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';








class NavBarMobile extends StatefulWidget {
  const NavBarMobile({super.key, required this.appThemeController, required this.body});

  final Widget body;
  final AppThemeController appThemeController;

  @override
  State<NavBarMobile> createState() => _NavBarMobileState();
}

class _NavBarMobileState extends State<NavBarMobile> {
  @override
  Widget build(BuildContext context) {
      colorTheme appTheme = widget.appThemeController.theme();
    // final themecontroller = controller.of<Themecontroller>(context);

    return Scaffold(
        appBar: 
        // AppBar()
        AppBar(
            title:  AppTitleWiget(
              appThemeController : widget.appThemeController,
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
         appThemeController : widget.appThemeController,
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
          imagewidth: 120,
          imageheight: 120,
          image: "images/nouser.png",
        ),
        backgroundColor: appTheme.background_primary,
        body: widget.body);
  }
}
