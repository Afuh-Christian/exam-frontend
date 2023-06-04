import 'package:flutter/material.dart';

import '../../../../Dummy_data.dart';
import '../../../../Provider/Provider.dart';

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
    return ElevatedButton(
      onPressed: () => showPopUp(context),
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 10, right: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                widget.provider.choosenTopic,
                // widget.ChoosenValue ,
                style: const TextStyle(
                  color: Color.fromARGB(255, 125, 125, 125),
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  // void updateList(String value) {
  //   widget.provider.searchExamList(value);
  // }

  Future<void> showPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, setState) {
              return Dialog(
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
                                style: const TextStyle(fontSize: 17),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8.0, right: 8.0),
                            child: Icon(
                              Icons.close,
                              color: Color.fromARGB(255, 0, 0, 0),
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
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextField(
                          // controller: TextEditingController(text: searchValue),
                          onChanged: (value) {
                            setState(() {
                              widget.provider.searchTopicList(value);
                              // widget.searchFunction(value);
                            });
                          },
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 227, 227, 227),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
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
                                title: Text(widget.provider.getTopicList()[index].name),
                              );
                            })),
                  ]),
                ),
              );
            }));
  }
}
