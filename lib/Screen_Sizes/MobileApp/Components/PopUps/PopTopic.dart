import 'package:flutter/material.dart';

import '../../../../Dummy_data.dart';
import '../../../../Provider/Provider.dart';
import '../../../../Provider/Theme/theme.dart';

class PopTopicMenu extends StatefulWidget {
  PopTopicMenu(
      {super.key,
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
  State<PopTopicMenu> createState() => _PopTopicMenuState();
}

class _PopTopicMenuState extends State<PopTopicMenu> {

 


  @override
  Widget build(BuildContext context) {
    colorTheme theme = widget.provider.theme();
    return ElevatedButton(
      onPressed: () => showPopUp(context),
      style:  ButtonStyle(
          visualDensity: VisualDensity(vertical: 2.0),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
          backgroundColor: MaterialStatePropertyAll(theme.background_primary)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            constraints:  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: Text(
              widget.provider.choosenTopic,
              // widget.ChoosenValue ,
              style:  TextStyle(
                color: theme.text_secondary,  letterSpacing: 2,
                fontSize: 15,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
           Icon(
            Icons.arrow_drop_down,
            color: theme.icon_primary,
          )
        ],
      ),
    );
  }

  // void updateList(String value) {
  //   widget.provider.searchExamList(value);
  // }

  Future<void> showPopUp(BuildContext context) {
    colorTheme theme = widget.provider.theme();
        
    return showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
              return Dialog(
                backgroundColor: theme.background_primary,

                child: SizedBox(
                  height: double.infinity,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: SizedBox(
                              width: 270,
                              child: Text(
                                widget.provider.choosenTopic,
                                // widget.ChoosenValue + " " + searchValue,
                                style:  TextStyle(fontSize: 17, color: theme.text_primary),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child:  Padding(
                            padding: EdgeInsets.only(top: 8.0, right: 8.0),
                            child: Icon(
                              Icons.close,
                                color: theme.icon_primary,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
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
                            widget.provider.searchTopicList(value);
                            // widget.searchFunction(value);
                          });
                        },
                        style:  TextStyle(
                            color: theme.text_primary),
                        decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: theme.search_bacground_primary,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),

                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Search Exam",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 155, 155, 155)),
                            suffixIcon: GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.search)),
                            suffixIconColor:
                                const Color.fromARGB(255, 55, 55, 55)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: widget.provider.getTopicList().length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    // widget.chooseFunction(
                                    //     widget.list[index].name);
                                    widget.provider.setChoosenTopicName(widget
                                        .provider
                                        .getTopicList()[index]
                                        .name);
                                  });
                                  Navigator.of(context).pop();
                                },
                                title: Text(widget.provider.getTopicList()[index].name , style: TextStyle(color: theme.text_primary),),
                              );
                            })),
                  ]),
                ),
              );
            }));
  }
}
