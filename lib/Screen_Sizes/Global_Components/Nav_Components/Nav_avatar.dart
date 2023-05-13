
import 'package:flutter/material.dart';

class UserFace extends StatelessWidget {
  const UserFace({
    super.key,
    required this.image,
    required this.right,
    required this.top,
    required this.bottom,
    required this.raduis,
    required this.imagewidth,
    required this.imageHeight,
  });

  final double right, top, bottom, raduis, imagewidth, imageHeight;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: right, top: top, bottom: bottom),
      // child: Icon(Icons.facebook),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(raduis),
          child: Image.asset(
             image,
            width: imagewidth,
            height: imageHeight,
            fit: BoxFit.cover,
          )),
    );
  }
}
