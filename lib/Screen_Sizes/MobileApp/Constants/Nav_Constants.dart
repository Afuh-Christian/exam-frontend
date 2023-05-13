
import 'package:flutter/material.dart';

import '../../Global_Components/Nav_Components/NavTitle.dart';
import '../../Global_Components/Nav_Components/Nav_avatar.dart';

var appBar = AppBar(
    title: const AppTitleWiget(
        width: 120, bookwidth: 22, bookheight: 22, titlefont: 21),
    // title: Title(120 , 22 , 22 , 21),
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
        raduis: 3000.0,
      )
    ]);