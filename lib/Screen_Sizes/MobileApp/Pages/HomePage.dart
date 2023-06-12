import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../../../Dummy_data.dart';
import '../../../Provider/Provider.dart';
import '../Components/PopUps/PopExam.dart';
import '../Components/PopUps/PopSubject.dart';
import '../Components/PopUps/PopTopic.dart';
import '../Components/Questions/EssayQuestions/EssayQuestionList.dart';
import '../Components/Questions/EssayQuestions/SingleEssayQuestion.dart';
import '../Components/Questions/MultipleChoice/MultipleChoice.dart';
import '../Components/SearchBoxExam.dart';
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

    return MainContainer(provider: provider);

    // return  SearchBoxCustom();
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
  bool isSummary = true;
  bool isMultipleChoice = false;
  bool isEssay = false;
  bool isPractical = false;

  @override
  Widget build(BuildContext context) {
    // final provider = widget.Provider.of<ExamProvider>(context, listen: false);


    var value =
        "this is what i do durring the holidays and we see each od adsfa asdf asdfa durring the holidays and we see each od adsfa asdf asdfa adsff adfad ther as friends";
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right:15 , left: 15),
          child: Column(
            children: [
              Container(
                // containing the Search boxes .......
        
                //  color: Colors.red,
                child: Column(
                  children: [
                    Column(
                      children: [

                       
                        const SizedBox(
                          height: 10,
                        ),
              // Exam list ...... 
                       PopExamMenu(
                                provider: widget.provider,
                              ),
                      
              // Subjects list ........
                        PopSubjectMenu(provider: widget.provider,)
                      ],
                    ),
                 
                    
                    PopTopicMenu(provider: widget.provider,),
        
                    
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Summary
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isSummary = true;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: isSummary
                                ? const MaterialStatePropertyAll<Color>(
                                    Color.fromARGB(255, 114, 116, 114))
                                : const MaterialStatePropertyAll<Color>(
                                    Color.fromARGB(255, 255, 255, 255)),
                          ),
                          child: Text(
                            "Summary",
                            style: TextStyle(
                                color: isSummary
                                    ? Colors.white
                                    : Color.fromARGB(255, 114, 116, 114),
                                fontSize: 10,
                                wordSpacing: 2,
                                letterSpacing: 3),
                          ),
                        ),
                        // Passed Questions
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isSummary = false;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: !isSummary
                                ? const MaterialStatePropertyAll<Color>(
                                    Color.fromARGB(255, 114, 116, 114))
                                : const MaterialStatePropertyAll<Color>(
                                    Color.fromARGB(255, 255, 255, 255)),
                          ),
                          child: Text(
                            "Past Questions",
                            style: TextStyle(
                                color: !isSummary
                                    ? Colors.white
                                    : Color.fromARGB(255, 114, 116, 114),
                                fontSize: 10,
                                wordSpacing: 2,
                                letterSpacing: 3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  !isSummary
                      ? SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Summary
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      // isSummary = true;
                                      isMultipleChoice = true;
                                      isEssay = false;
                                      isPractical = false;
                                    });
                                  },
                                  style: ButtonStyle(

                                    backgroundColor: isMultipleChoice
                                        ? const MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 114, 116, 114))
                                        : const MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  child: Text(
                                    "Multiple Choice",
                                    style: TextStyle(
                                        color: isMultipleChoice
                                            ? Colors.white
                                            : Color.fromARGB(255, 114, 116, 114),
                                        fontSize: 10,
                                        wordSpacing: 1,
                                        letterSpacing: 1),
                                  ),
                                ),
                                  
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      // isSummary = true;
                                      isMultipleChoice = false;
                                      isEssay = true;
                                      isPractical = false;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: isEssay
                                        ? const MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 114, 116, 114))
                                        : const MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  child: Text(
                                    "Essay && Structural",
                                    style: TextStyle(
                                        color: isEssay
                                            ? Colors.white
                                            : Color.fromARGB(255, 114, 116, 114),
                                        fontSize: 10,
                                        wordSpacing: 1,
                                        letterSpacing: 1),
                                  ),
                                ),
                                  
                                // Passed Questions
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isMultipleChoice = false;
                                      isEssay = false;
                                      isPractical = true;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: isPractical
                                        ? const MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 114, 116, 114))
                                        : const MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  child: Text(
                                    "Practicals",
                                    style: TextStyle(
                                        color: isPractical
                                            ? Colors.white
                                            : Color.fromARGB(255, 114, 116, 114),
                                        fontSize: 10,
                                        wordSpacing: 1,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                      
                ]),
              ),
              isSummary
                  ? Container(
                      width: double.infinity,
                      height: 650,
                      color: Colors.red,
                    )
                  : isMultipleChoice
                      ? Container(
                          width: double.infinity,
                          height: 650,
                          color: Colors.blue,
                          // child: const MultipleChoice(),
                         
                        )
                      : isEssay
                          ? Container(
                              width: double.infinity,
                              height: 650,
                              // color: Colors.green,
                               child: const EssayQuestionList(),
                            )
                          : isPractical
                              ? Container(
                                  width: double.infinity,
                                  height: 650,
                                  color: Colors.yellow,
                                  // child: const EssayQuestionList(),
                                )
                              : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

































// class SearchBox extends StatefulWidget {
//   const SearchBox({
//     super.key,
//     required this.provider,
//   });

//   final ExamProvider provider;

//   @override
//   State<SearchBox> createState() => _SearchBoxState();
// }

// class _SearchBoxState extends State<SearchBox> {
//   final scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     scrollController.addListener(_scrollListerner);
//   }

//   void _scrollListerner() {
//     if (scrollController.position.pixels ==
//         scrollController.position.maxScrollExtent) {
//       print("Fetch data ");
//     } else {
//       print("dont fetch data");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final provider = Provider.of<ExamProvider>(context);
//     print(widget.provider.getSubjectList().map((e) => e.name).toList());
//     print("Hello");
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
//       // height: 400,
//       // color: Colors.blue,
//       child: DropdownSearch<String>(
//         //  mode: DropdowmMode.BOTTOM_SHEET,

//         popupProps: PopupProps.menu(
//           // listViewProps: ListViewProps(scrollDirection: ),
//           scrollbarProps: ScrollbarProps(
//             trackBorderColor: Colors.red,
//             trackVisibility: true,

//             // scrollbarOrientation: ScrollbarOrientation.bottom,
//             notificationPredicate: (notification) {
//               print("object");
//               // print(notification.context);

//               // this is where we will fetch more items ........

//               return false;
//             },
//           ),
//           searchDelay: const Duration(seconds: 2),
//           showSelectedItems: true,
//           showSearchBox: true,

//           //...........................................................................................
//           // functions that goes to the backend and fetches the result ..... ..........................
//           disabledItemFn: (String s) => s.startsWith('I'),
//           //...........................................................................................
//         ),
//         // ignore: avoid_function_literals_in_foreach_calls

//         items: widget.provider.getExamList().map((e) => e.name).toList(),

//         dropdownDecoratorProps: const DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     width: 1, color: Color.fromARGB(255, 193, 192, 192))),
//             labelText: "Exam",
//             hintText: "Choose Exam",
//           ),
//         ),
//         // asyncItems: ,
//         //...........................................................................................
//         onChanged: (value) {
//           // print(value);
//           widget.provider.setChoosenExamName(value as String);
//         },

//         // itemAsString: (item) {
//         //   return "Hello";
//         // },
//         dropdownBuilder: (context, selectedItem) {
//           return SizedBox(
//             child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const Icon(Icons.book),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   Text(widget.provider.choosenExamname)
//                 ]),
//           );
//         },

//         // onSaved: (newValue) => {
//         //   print("ehllo")
//         // },

//         //...........................................................................................

//         // onChanged: print,

//         // selectedItem: widget.provider.getExamList()[0].name,
//         selectedItem: "",
//       ),
//     );
//   }
// }

// class SearchSubjectBox extends StatefulWidget {
//   SearchSubjectBox({
//     super.key,
//     required this.provider,
//   });

//   ExamProvider provider;

//   @override
//   State<SearchSubjectBox> createState() => _SearchSubjectBoxState();
// }

// class _SearchSubjectBoxState extends State<SearchSubjectBox> {
//   @override
//   Widget build(BuildContext context) {
//     // final provider = Provider.of<ExamProvider>(context);
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
//       // height: 400,
//       // color: Colors.blue,
//       child: DropdownSearch<String>(
//         popupProps: PopupProps.menu(
//           searchDelay: const Duration(seconds: 2),
//           showSelectedItems: true,
//           showSearchBox: true,

// //...........................................................................................
// // functions that goes to the backend and fetches the result ..... ..........................
//           disabledItemFn: (String s) => s.startsWith('I'),
// //...........................................................................................
//         ),
//         // ignore: avoid_function_literals_in_foreach_calls

//         items: widget.provider.getSubjectList().map((e) => e.name).toList(),
//         // items: ["A", "B" , "C" , "h", "d"],

//         dropdownDecoratorProps: const DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 1, color: Color.fromARGB(255, 193, 192, 192))),
//               labelText: "Subject",
//               hintText: "Choose subject",
//               hintStyle: TextStyle(color: Colors.black)),
//         ),

//         //...........................................................................................
//         onChanged: (value) {
//           widget.provider.setChoosenSubjectName(value as String);
//         },
// //...........................................................................................

//         // onChanged: print,

//         // selectedItem: widget.provider.getSubjectList()[0].name,
//         selectedItem: widget.provider.choosenSubject,
//         // selectedItem: "h",
//       ),
//     );
//   }
// }

// class SearchTopicBox extends StatefulWidget {
//   SearchTopicBox({
//     super.key,
//     required this.provider,
//   });

//   ExamProvider provider;

//   @override
//   State<SearchTopicBox> createState() => _SearchTopicBoxState();
// }

// class _SearchTopicBoxState extends State<SearchTopicBox> {
//   @override
//   Widget build(BuildContext context) {
//     // final provider = Provider.of<ExamProvider>(context);
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
//       // height: 400,
//       // color: Colors.blue,
//       child: DropdownSearch<String>(
//         popupProps: PopupProps.menu(
//           searchDelay: const Duration(seconds: 2),
//           showSelectedItems: true,
//           showSearchBox: true,

// //...........................................................................................
// // functions that goes to the backend and fetches the result ..... ..........................
//           disabledItemFn: (String s) => s.startsWith('I'),
// //...........................................................................................
//         ),
//         // ignore: avoid_function_literals_in_foreach_calls

//         items: widget.provider.getTopicList().map((e) => e.name).toList(),
//         // items: ["A", "B" , "C" , "h", "d"],

//         dropdownDecoratorProps: const DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 1, color: Color.fromARGB(255, 193, 192, 192))),
//               labelText: "Topic",
//               hintText: "Choose Subject",
//               hintStyle: TextStyle(color: Colors.black)),
//         ),


//         onChanged: (value) {
//           widget.provider.setChoosenTopicName(value as String);
//         },

//         selectedItem: widget.provider.choosenTopic,

//       ),
//     );
//   }
// }
