import 'package:flutter/material.dart';

class colorTheme {
  colorTheme({
    this.navtitleColor,
    this.navbackgroundColor,
    this.navbarIconColor,
    this.navBoxShadowColor,
    this.drawerBackgroundColor,
    this.drawerTextColor,
    this.drawerTextHoverColor,
    this.drawerIconColor,

    //

    this.text_primary,
    this.text_secondary,
    this.text_tetiary,
    this.text_quatenary,
    this.icon_primary,
    this.icon_secondary,
    this.icon_tetiary,
    this.background_primary,
    this.background_secondary,
    this.background_tetiary,
    this.btn_primary,
    this.btn_secondary,
    this.btn_tetiary,
    this.search_bacground_primary,
    this.search_bacground_secondary,
    this.search_bacground_tetiary,
    this.search_hint_tetiary,
    this.boxShadow_primary,
    this.boxShadow_secondary,
    this.boxShadow_tetiary,
  });
  // mobile nav .......  .
  Color? navbackgroundColor;
  Color? navbarIconColor;
  Color? navtitleColor;
  Color? navBoxShadowColor;

  // Drawer
  Color? drawerBackgroundColor;
  Color? drawerTextColor;
  Color? drawerTextHoverColor;
  Color? drawerIconColor;

  // Colors. .....

  Color? text_primary;
  Color? text_secondary;
  Color? text_tetiary;
  Color? text_quatenary;

  Color? icon_primary;
  Color? icon_secondary;
  Color? icon_tetiary;

  Color? background_primary;
  Color? background_secondary;
  Color? background_tetiary;

  Color? btn_primary;
  Color? btn_secondary;
  Color? btn_tetiary;

  Color? search_bacground_primary;
  Color? search_bacground_secondary;
  Color? search_bacground_tetiary;
  Color? search_hint_tetiary;

  Color? boxShadow_primary;
  Color? boxShadow_secondary;
  Color? boxShadow_tetiary;

  // Color? secondary2;
  // Color? btn_primary;
  // Color? btn_primary_hover;
  // Color? tetiary;
  // Color? success;
  // Color? warning;
  // Color? failure;

  //  Color?
  //  Color?
}

var whiteColor = Color.fromARGB(255, 221, 221, 221);
// Light Mode .......................................................................................................
var dayTheme = colorTheme(
  text_primary: Colors.black,
  text_secondary: const Color.fromARGB(255, 63, 62, 62),
  text_tetiary: Color.fromARGB(255, 106, 105, 105),
  text_quatenary: whiteColor,

  background_primary: Colors.white,
  background_secondary: Colors.white,
  background_tetiary: Colors.white,

  icon_primary: Colors.black,
  icon_secondary: const Color.fromARGB(255, 136, 135, 135),

  search_bacground_primary: Color.fromARGB(255, 227, 227, 227),

  btn_primary: const Color.fromARGB(255, 63, 62, 62), 

  boxShadow_primary: Color.fromARGB(255, 210, 210, 210),


  // boxShadow_primary:  ,
  // boxShadow_secondary: ,
  // boxShadow_tetiary: ,

  navbarIconColor: Colors.black,
  navbackgroundColor: Colors.white,
  navtitleColor: const Color.fromARGB(255, 63, 62, 62),

  // drawer
  drawerBackgroundColor: Colors.white,
  drawerTextColor: Colors.black,
  drawerIconColor: const Color.fromARGB(255, 136, 135, 135),
  drawerTextHoverColor: const Color.fromARGB(255, 136, 135, 135),

  //  PopUp Exam,Subjec , Topic ...
  // popupBtnColor:
  // popupBtnIconColor:
  // popupBtnTextColor:
  // popupShadowColor:
  // popupPopUpBackground:
  // popupTitleColor:
  // popupCloseColor:
  // popupSearchBackround:
  // popupSearchTextColor:
  // popupSearchHintColor:
  // popupSearchIconColor:
  // popupTextColor:
);

// Night Mode ..........................................................................................................
var nigtTheme = colorTheme(
  text_primary: whiteColor,
  text_secondary: whiteColor,
  text_tetiary: whiteColor,
  text_quatenary: whiteColor,
  // text_tetiary: ,

  background_primary: Color.fromARGB(255, 26, 23, 43),
  background_secondary: Color.fromARGB(255, 32, 28, 54),
  background_tetiary: Color.fromARGB(255, 58, 52, 97),

  icon_primary: whiteColor,
  icon_secondary: Color.fromARGB(255, 163, 160, 160),

  //search
  // search_bacground_primary: Color.fromARGB(255, 49, 43, 81),
  search_bacground_primary: Color.fromARGB(255, 74, 65, 123),

  // btn 
  // btn_primary: Color.fromARGB(255, 58, 52, 97),
  btn_primary: Color.fromARGB(255, 53, 143, 217),

  boxShadow_primary: Color.fromARGB(255, 27, 24, 45),

  // Box shadhow
  //  boxShadow_primary: ,
  // boxShadow_secondary: ,
  // boxShadow_tetiary: ,

////////
  navbarIconColor: Colors.white,
  navbackgroundColor: Color.fromARGB(255, 26, 23, 43),
  navtitleColor: Color.fromARGB(255, 255, 255, 255),

  // drawer
  drawerBackgroundColor: Color.fromARGB(255, 26, 23, 43),
  drawerTextColor: Colors.white,
  drawerIconColor: Color.fromARGB(255, 163, 160, 160),

  //
);

var h = nigtTheme;
