import 'package:exam_front_end/Controllers/AppThemeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Schemas/theme.dart';

class AppTitleWiget extends StatefulWidget {
  const AppTitleWiget(
      {super.key,
      required this.width,
      required this.bookwidth,
      required this.bookheight,
      required this.titlefont,
      required this.appThemeController});

  final double width;
  final double bookwidth;
  final double bookheight;
  final double titlefont;
  final AppThemeController appThemeController;

  @override
  State<AppTitleWiget> createState() => _AppTitleWigetState();
}

class _AppTitleWigetState extends State<AppTitleWiget> {
  @override
  Widget build(BuildContext context) {
    colorTheme appTheme = widget.appThemeController.theme();
    return SizedBox(
      // width: widget.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(Icons.book, color: Colors.black,size: 20),
            SvgPicture.asset(
              "images/booka.svg",
              width: widget.bookwidth,           
              height: widget.bookheight,         
            ),                      

           const SizedBox(
              width: 10,
            ),

            Text(
              "Exam",
              style: TextStyle(
                color: appTheme.text_secondary,
                // color: appTheme.navtitleColor,
                letterSpacing: 5,
                fontSize: widget.titlefont,
                fontWeight: FontWeight.w500,
              ),
            ),
           const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              "images/bookb.svg",
              width: widget.bookwidth,
              height: widget.bookheight,
            ),
          ]),
    );
  }
}
