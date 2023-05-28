import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../Provider/Provider.dart';
import 'AboutPage.dart';
import 'Sroll.dart';

import 'package:dropdown_search/dropdown_search.dart';


class NavItem {
  String? titlename;
  Widget? icon;
  String? link;
  NavItem(
    this.icon,
    this.link,
    this.titlename,
  );
}

List navitems = [
  {
    "titlename": "home",
    "icon": Icon(Icons.home),
  },
  {
    "titlename": "About",
    "icon": Icon(Icons.question_answer),
  },
  {
    "titlename": "Admin dashboard",
    "icon": Icon(Icons.admin_panel_settings),
  },
  {
    "titlename": "Account Setting",
    "icon": Icon(Icons.settings),
  },
  {
    "titlename": "Light mode",
    "icon": Icon(Icons.sunny),
  },
];

var list = ["one", "two", "three", "four"];

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Provider .... for global state ....
    final provider = Provider.of<ExamProvider>(context);

    // return MainContainer(provider: provider);

    return MainContainer(
      provider: provider,
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({
    super.key,
    required this.provider,
  });

  final ExamProvider provider;

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    // return formDropdown();
    return Column(
      children: const [
         SearchBox(),
         SearchBox(),
         SearchBox(),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, top: 30), 
      // height: 400,
      // color: Colors.blue,
      child:
      DropdownSearch<String>(
        
    popupProps: PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: true,
        disabledItemFn: (String s) => s.startsWith('I'),
    ),
    items: const [
      "Brazil", 
      // "Italia (Disabled)", 
      "Tunisia", 
      "Tunisia1", 
      "Tunisia2", 
      "Tunisia22", 
      "Tunisia222", 
      "Tunisi22a", 
      "Tunisi22a", 
      'Canada'],
    dropdownDecoratorProps: const DropDownDecoratorProps(
      
        dropdownSearchDecoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, 
              color: Color.fromARGB(255, 193, 192, 192)
            )
          ),      
            labelText: "Exam",
            hintText: "country in menu mode",
        ),
    ),
    onChanged: print,
    selectedItem: "Brazil",
),
    );
  }
}
