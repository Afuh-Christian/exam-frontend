import 'package:flutter/material.dart';


class Layout_Builder extends StatelessWidget {
  const Layout_Builder(
      {super.key,
      required this.Moblie_App,
      required this.Tablet_App,
      required this.Desktop_App});

 
  final Widget Desktop_App, Tablet_App, Moblie_App;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      if (contraints.maxWidth < 500) return Moblie_App;
      if (contraints.maxWidth < 1100) return Moblie_App;
      return Desktop_App;
    });
  }
}







