import 'package:flutter/material.dart';
import '../../MobileApp/Components/Navbar.dart';

class NavDrawer extends StatefulWidget {
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

  final double imagewidth, imageheight, top, bottom, left, right;
  final String image;

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool isLightMode = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                if (navitems[index]["titlename"] == "Light mode") {
                  return isLightMode
                      ? ListTile(
                          onTap: () {
                            setState(() {
                              isLightMode = !isLightMode;
                            });
                          },
                          textColor: const Color.fromARGB(255, 14, 14, 14),
                          hoverColor: const Color.fromARGB(255, 136, 135, 135),
                          leading: navitems[index]["icon"],
                          title: Text(navitems[index]["titlename"]),
                        )
                      : ListTile(
                          onTap: () {
                            setState(() {
                              isLightMode = !isLightMode;
                            });
                          },
                          textColor: const Color.fromARGB(255, 14, 14, 14),
                          hoverColor: const Color.fromARGB(255, 136, 135, 135),
                          leading: Icon(Icons.dark_mode),
                          title: Text("Dark Mode"),
                        );
                } else {
                  return ListTile(
                    textColor: const Color.fromARGB(255, 14, 14, 14),
                    hoverColor: const Color.fromARGB(255, 136, 135, 135),
                    leading: navitems[index]["icon"],
                    title: Text(navitems[index]["titlename"]),
                  );
                }
              }),
        )
      ]),
    );
  }
}
