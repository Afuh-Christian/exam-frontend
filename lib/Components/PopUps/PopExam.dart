import 'package:flutter/material.dart';

import '../../Dummy_data.dart';
import '../../Provider/Provider.dart';
import '../../Schemas/theme.dart';

class PopExamMenu extends StatefulWidget {
  PopExamMenu({
    super.key,
    required this.provider,
    // required this.list,
    // required this.ChoosenValue,
    // required this.searchHint,
    // required this.searchFunction,
    // required this.chooseFunction,
    // required this.searchValue
  });

  ExamProvider provider;
  // String searchHint;
  // String ChoosenValue;
  // String searchValue;
  // List<dynamic> list;
  // Function searchFunction;
  // // void chooseFunction = (String value) {};
  // Function chooseFunction;

  @override
  State<PopExamMenu> createState() => _PopExamMenuState();
}

class _PopExamMenuState extends State<PopExamMenu> {
  @override
  Widget build(BuildContext context) {
    colorTheme appTheme = widget.provider.theme();
    return ElevatedButton(
      // onPressed: () => showPopUp(context),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) =>  ExamFullScreenSearch(provider: widget.provider,))),
      style: ButtonStyle(
          //
          visualDensity: VisualDensity(vertical: 2.0),
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
          // backgroundColor: MaterialStatePropertyAll(Colors.white)),
          backgroundColor:
              MaterialStatePropertyAll(appTheme.background_primary)),
      //
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: (MediaQuery.of(context).size.width - 100.00)),
            child: Text(
              widget.provider.choosenExamname,
              // widget.ChoosenValue ,
              style: TextStyle(
                // color: Color.fromARGB(255, 74, 74, 74),
                color: appTheme.text_secondary,
                fontSize: 15,
                letterSpacing: 2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            Icons.arrow_drop_down,
            color: appTheme.icon_primary,
          )
        ],
      ),
    );
  }



  // Future<void> showPopUp(BuildContext context) {
  //   colorTheme appTheme = widget.provider.theme();
  //   return showDialog(
  //       context: context,
  //       builder: (context) => StatefulBuilder(builder: (context, setState) {
  //             return Dialog(
  //               backgroundColor: appTheme.background_primary,
  //               child: SizedBox(
  //                 height: double.infinity,
  //                 child: Column(children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 20, top: 20),
  //                         child: SizedBox(
  //                             width: 270,
  //                             child: Text(
  //                               widget.provider.choosenExamname,
  //                               // widget.ChoosenValue + " " + searchValue,
  //                               style: TextStyle(
  //                                   fontSize: 17, color: appTheme.text_primary),
  //                             )),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () => Navigator.of(context).pop(),
  //                         child: Padding(
  //                           padding:
  //                               const EdgeInsets.only(top: 8.0, right: 8.0),
  //                           child: Icon(
  //                             Icons.close,
  //                             color: appTheme.icon_primary,
  //                             size: 25,
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.only(
  //                       left: 8,
  //                       right: 8,
  //                     ),
  //                     child: TextField(
  //                       // controller: TextEditingController(text: searchValue),
  //                       onChanged: (value) {
  //                         setState(() {
  //                           widget.provider.searchExamList(value);
  //                         });
  //                       },
  //                       style: TextStyle(
  //                           fontSize: 13, color: appTheme.text_primary),
  //                       decoration: InputDecoration(
  //                           isDense: true,
  //                           filled: true,
  //                           contentPadding: EdgeInsets.symmetric(
  //                               vertical: 10.0, horizontal: 10.0),
  //                           fillColor: appTheme.search_bacground_primary,
  //                           border: OutlineInputBorder(
  //                               // borderRadius: BorderRadius.circular(8.0),
  //                               borderSide: BorderSide.none),
  //                           hintText: "Search Exam",
  //                           hintStyle: TextStyle(color: appTheme.text_primary),
  //                           suffixIcon: GestureDetector(
  //                               onTap: () {}, child: const Icon(Icons.search)),
  //                           suffixIconColor:
  //                               const Color.fromARGB(255, 55, 55, 55)),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 10,
  //                   ),
  //                   Expanded(
  //                       child: ListView.builder(
  //                           itemCount: widget.provider.getExamList().length,
  //                           itemBuilder: (context, index) {
  //                             return ListTile(
  //                               onTap: () {
  //                                 setState(() {
  //                                   widget.provider.setChoosenExamName(widget
  //                                       .provider
  //                                       .getExamList()[index]
  //                                       .name);
  //                                 });
  //                                 Navigator.of(context).pop();
  //                               },
  //                               title: Text(
  //                                 widget.provider.getExamList()[index].name,
  //                                 style:
  //                                     TextStyle(color: appTheme.text_primary),
  //                               ),
  //                             );
  //                           })),
  //                 ]),
  //               ),
  //             );
  //           }));
  // }
}













class ExamFullScreenSearch extends StatefulWidget {
  ExamFullScreenSearch({super.key, required this.provider});

  final ExamProvider provider;

  @override
  State<ExamFullScreenSearch> createState() => _ExamFullScreenSearchState();
}

class _ExamFullScreenSearchState extends State<ExamFullScreenSearch> {


  void updateList(String value) {
    widget.provider.searchExamList(value);
  }


  @override
  Widget build(BuildContext context) {
    colorTheme appTheme = widget.provider.theme();
    return Scaffold(
      backgroundColor: appTheme.background_primary,
      appBar: AppBar(title: Text(widget.provider.choosenExamname , style: TextStyle(color: appTheme.text_secondary),) ,
      centerTitle: true,
      backgroundColor: appTheme.background_primary,
      iconTheme: IconThemeData(color: appTheme.icon_primary),
      
      automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width - 20,
          // color: appTheme.background_primary,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
          
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: TextField(
                // controller: TextEditingController(text: searchValue),
                onChanged: (value) {
                  setState(() {
                    widget.provider.searchExamList(value);
                  });
                },
                style: TextStyle(fontSize: 13, color: appTheme.text_primary),
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    fillColor: appTheme.search_bacground_primary,
                    border:const OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    hintText: "Search Exam",
                    hintStyle: TextStyle(color: appTheme.text_primary),
                    suffixIcon: GestureDetector(
                        onTap: () {}, child: const Icon(Icons.search)),
                    suffixIconColor: const Color.fromARGB(255, 55, 55, 55)),
              ),
            ),
          
          
          
          
            const SizedBox(
              height: 10,
            ),
          
          
        
            Expanded(
                child: ListView.builder(
                    itemCount: widget.provider.getExamList().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            widget.provider.setChoosenExamName(
                                widget.provider.getExamList()[index].name);
                          });
                          Navigator.of(context).pop();
                        },
                        title: Text(
                          widget.provider.getExamList()[index].name,
                          style: TextStyle(color: appTheme.text_primary),
                        ),
                      );
                    })),
          ]),
        ),
      ),
    );
    ;
  }
}
