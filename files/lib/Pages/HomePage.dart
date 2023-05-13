import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NavBarMobile();
  }
}



class StackOfDropdowns extends StatelessWidget {
  const StackOfDropdowns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
         Positioned(
          top: 20,
           child: SizedBox(
            width: 250,
            height: 200,
            child: ExamList(),
                         ),
         ),
         Positioned(
          top: 110,
           child: SizedBox(
            width: 250,
            height: 200,
            child: ExamList(),
                         ),
         ),
         Positioned(
          top: 200,
           child: SizedBox(
            width: 250,
            height: 200,
            child: ExamList(),
                         ),
         ),
      
      ],
    );
  }
}





















class ExamList extends StatefulWidget {
  const ExamList({super.key});

  @override
  State<ExamList> createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  bool isOn = false;

  var itemList = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  var dropdownvalue = 'Item1';
  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    // return  DropdownButton(
    //         dropdownColor: Colors.blue,
    //         value: dropdownvalue,
    //         items: itemList.map((e) => DropdownMenuItem(child: Text(e) , value: e,)).toList(),
    //         onChanged: (String? value) {
    //           setState(() {
    //             dropdownvalue = value!; 
    //           });
    //         });
    return DropdownButtonFormField(
      value: dropdownvalue,
      decoration: InputDecoration(
          
          labelText: "Exams",
          isCollapsed: false, 
          
          ),
          
      onChanged: (value) {
        setState() {
          dropdownvalue = value as String;
        }
      },
      items: itemList
          .map((e) => DropdownMenuItem(
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home),
                      Text(e),
                    ],
                  ),
                ),
                value: e,
              ))
          .toList(),
    );
  }
}
