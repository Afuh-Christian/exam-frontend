
import 'package:exam_front_end/Controllers/AppThemeController.dart';
import 'package:exam_front_end/Schemas/theme.dart';
import 'package:flutter/material.dart';


class NavDrawer extends StatefulWidget {
  const NavDrawer(
      {super.key,
      required this.right,
      required this.top,
      required this.bottom,
      required this.left,
      required this.image,
      required this.imagewidth,
      required this.imageheight,
      required this.appThemeController});

  final double imagewidth, imageheight, top, bottom, left, right;
  final String image;
  final AppThemeController appThemeController;

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isLightmode = widget.appThemeController.themeSet;
    colorTheme appTheme = widget.appThemeController.theme();




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


    return Drawer(
      // backgroundColor: appTheme.drawerBackgroundColor,
      backgroundColor: appTheme.background_primary,
      child: Column(children: [
        DrawerHeader(
          child: Padding(
            padding: EdgeInsets.only(
                top: widget.top,
                bottom: widget.bottom,
                left: widget.left,
                right: widget.right),
            child: ClipOval(
                // borderRadius: BorderRadius.circular(3000.0),
                child: Image.asset(
              widget.image,
              width: widget.imagewidth,
              height: widget.imageheight,
              fit: BoxFit.cover,
            )),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: navitems.length,
              itemBuilder: (context, index) {
                if (navitems[index]["titlename"] == "mode") {
                  return ListTile(
                      onTap: () {
                        setState(() {
                          widget.appThemeController.chooseTheme();
                        });
                      },
                      textColor: appTheme.text_primary,
                      // textColor: appTheme.drawerTextColor,
                      hoverColor: appTheme.drawerTextHoverColor,
                      leading: !isLightmode
                          ?  Icon(Icons.sunny, color: appTheme.icon_secondary)
                          :  Icon(Icons.dark_mode , size: 20, color: appTheme.icon_secondary ,),
                      title: !isLightmode
                          ? const Text("Light mode" , style: TextStyle(fontSize: 14),)
                          : const Text("Dark Mode" , style: TextStyle(fontSize: 14), ) );
                } else {
                  return ListTile(
                      // textColor: appTheme.drawerTextColor,
                       textColor: appTheme.text_primary,
                      hoverColor: appTheme.drawerTextHoverColor,
                      // iconColor: appTheme.drawerIconColor,
                    leading: navitems[index]["icon"],
                    title: Text(navitems[index]["titlename"],style: TextStyle(fontSize: 14),),
                  );
                }
              }),
        )
      ]),
    );
  }
}
