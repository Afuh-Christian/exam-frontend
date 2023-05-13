import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTitleWiget extends StatefulWidget {
  const AppTitleWiget({
    super.key,
    required this.width ,
    required this.bookwidth ,
    required this.bookheight ,
    required this.titlefont ,

  });

  final double width;
  final double bookwidth;
  final double bookheight;
  final double titlefont;

  @override
  State<AppTitleWiget> createState() => _AppTitleWigetState();
}

class _AppTitleWigetState extends State<AppTitleWiget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(Icons.book, color: Colors.black,size: 20),
            SvgPicture.asset(
              "images/booka.svg",
              width: widget.bookwidth,
              height: widget.bookheight,
            ),

            Text(
              "Exam",
              style: TextStyle(
                color: const Color.fromARGB(255, 63, 62, 62),
                fontSize: widget.titlefont,
                fontWeight: FontWeight.w500,
              ),
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
