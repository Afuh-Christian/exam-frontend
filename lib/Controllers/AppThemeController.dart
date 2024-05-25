import 'package:exam_front_end/Schemas/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppThemeController extends GetxController {

  var themeSet = false;

  colorTheme theme() => themeSet == true ? dayTheme : nigtTheme;

  void chooseTheme() {
    themeSet = !themeSet;
    update();
  }

}