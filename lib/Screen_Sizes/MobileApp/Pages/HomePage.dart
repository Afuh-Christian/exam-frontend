import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../Dummy_data.dart';
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
      children: [
        SearchBox(
          provider: widget.provider,
        ),
        SearchSubjectBox(provider: widget.provider),
        SearchTopicBox(provider: widget.provider),
      //  const  SearchSubjectBox()
        // SearchBox(),
        // SearchBox(),
      ],
    );
  }
}












class SearchBox extends StatefulWidget {
  const SearchBox({
    super.key,
    required this.provider,
  });

  final ExamProvider provider;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExamProvider>(context);
    print(widget.provider.getSubjectList().map((e) => e.name).toList());
    print("Hello");
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      // height: 400,
      // color: Colors.blue,
      child: DropdownSearch<String>(
        
        popupProps: PopupProps.menu(
          searchDelay: const Duration(seconds: 2),
          showSelectedItems: true,
          showSearchBox: true,

//...........................................................................................
// functions that goes to the backend and fetches the result ..... ..........................
          disabledItemFn: (String s) => s.startsWith('I'),
//...........................................................................................
        ),
        // ignore: avoid_function_literals_in_foreach_calls

        items: widget.provider.getExamList().map((e) => e.name).toList(),

        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Color.fromARGB(255, 193, 192, 192))),
            labelText: "Exam",
            hintText: "Choose Exam",
          ),
        ),

        //...........................................................................................
        onChanged: (value) {
          // print(value);
          widget.provider.setChoosenExamName(value as String);
        },
//...........................................................................................

        // onChanged: print,

        // selectedItem: widget.provider.getExamList()[0].name,
        selectedItem:"",
      ),
    );
  }
}





















class SearchSubjectBox extends StatefulWidget {
    SearchSubjectBox({super.key,
   required this.provider,
  });

   ExamProvider provider;



  @override
  State<SearchSubjectBox> createState() => _SearchSubjectBoxState();
}

class _SearchSubjectBoxState extends State<SearchSubjectBox> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExamProvider>(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      // height: 400,
      // color: Colors.blue,
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          searchDelay: const Duration(seconds: 2),
          showSelectedItems: true,
          showSearchBox: true,


//...........................................................................................
// functions that goes to the backend and fetches the result ..... ..........................
          disabledItemFn: (String s) => s.startsWith('I'),
//...........................................................................................
        ),
        // ignore: avoid_function_literals_in_foreach_calls

        items: widget.provider.getSubjectList().map((e) => e.name).toList(),
        // items: ["A", "B" , "C" , "h", "d"],

        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Color.fromARGB(255, 193, 192, 192))),
            labelText: "Subject",
            hintText: "Choose Subject",
            hintStyle: TextStyle(color: Colors.black)
          ),
        ),

        //...........................................................................................
        onChanged: (value) {
          widget.provider.setChoosenSubjectName(value as String);
        },
//...........................................................................................

        // onChanged: print,

        // selectedItem: widget.provider.getSubjectList()[0].name,
        selectedItem:widget.provider.choosenSubject,
        // selectedItem: "h",
      ),
    );
  }
}
































class SearchTopicBox extends StatefulWidget {
    SearchTopicBox({super.key,
   required this.provider,
  });

   ExamProvider provider;



  @override
  State<SearchTopicBox> createState() => _SearchTopicBoxState();
}

class _SearchTopicBoxState extends State<SearchTopicBox> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExamProvider>(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      // height: 400,
      // color: Colors.blue,
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          searchDelay: const Duration(seconds: 2),
          showSelectedItems: true,
          showSearchBox: true,


//...........................................................................................
// functions that goes to the backend and fetches the result ..... ..........................
          disabledItemFn: (String s) => s.startsWith('I'),
//...........................................................................................
        ),
        // ignore: avoid_function_literals_in_foreach_calls

        items: widget.provider.getTopicList().map((e) => e.name).toList(),
        // items: ["A", "B" , "C" , "h", "d"],

        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Color.fromARGB(255, 193, 192, 192))),
            labelText: "Subject",
            hintText: "Choose Subject",
            hintStyle: TextStyle(color: Colors.black)
          ),
        ),

        //...........................................................................................
        onChanged: (value) {
          widget.provider.setChoosenTopicName(value as String);
        },
//...........................................................................................

        // onChanged: print,

        // selectedItem: widget.provider.getSubjectList()[0].name,
        selectedItem: widget.provider.choosenTopic,
        // selectedItem: "h",
      ),
    );
  }
}
