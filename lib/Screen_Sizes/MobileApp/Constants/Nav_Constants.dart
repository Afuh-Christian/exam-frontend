import 'package:flutter/material.dart';

import '../../../Provider/Provider.dart';
import '../../Global_Components/Nav_Components/NavTitle.dart';
import '../../Global_Components/Nav_Components/Nav_avatar.dart';

final provider = ExamProvider();
// var appBar = AppBar(
//     title: AppTitleWiget(
//         provider: provider,
//         width: 120,
//         bookwidth: 22,
//         bookheight: 22,
//         titlefont: 21),
//     // title: Title(120 , 22 , 22 , 21),
//     backgroundColor: provider.theme.navbackgroundColor,
//     centerTitle: true,
//     iconTheme:  IconThemeData(color: provider.theme.navbarIconColor),
//     actions: const [
//       UserFace(
//         image: "images/nouser.png",
//         imageHeight: 22,
//         imagewidth: 35,
//         top: 10,
//         bottom: 10,
//         right: 20,
//         left: 0,
//         raduis: 3000.0,
//       )
//     ]);
