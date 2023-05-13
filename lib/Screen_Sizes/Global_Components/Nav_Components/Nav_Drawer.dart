
import 'package:flutter/material.dart';
import '../../MobileApp/Components/Navbar.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,

    required this.right,
    required this.top,
    required this.bottom,
    required this.left,
    required this.image,
    required this.imagewidth,
    required this.imageheight,
  });

  final double imagewidth , imageheight , top , bottom , left , right ;  
  final String image;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          child: Padding(
            padding:  EdgeInsets.only(
                top: top, bottom: bottom, left: left, right: right),
            child: ClipOval(
                // borderRadius: BorderRadius.circular(3000.0),
                child: Image.asset(
              image,
              width: imagewidth,
              height: imageheight,
              fit: BoxFit.cover,
            )),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: navitems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  textColor: const Color.fromARGB(255, 14, 14, 14),
                  hoverColor: const Color.fromARGB(255, 136, 135, 135),
                  leading: navitems[index]["icon"],
                  title: Text(navitems[index]["titlename"]),
                );
              }),
        )
      ]),
    );
  }
}
