import 'package:flutter/material.dart';

import '../../../../Dummy_data.dart';
import '../../../../Provider/Provider.dart';

class PopExamMenu extends StatefulWidget {
  PopExamMenu(
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
  State<PopExamMenu> createState() => _PopExamMenuState();
}

class _PopExamMenuState extends State<PopExamMenu> {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showPopUp(context),
      style: const ButtonStyle(
        //
        visualDensity: VisualDensity(vertical: 2.0),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
          //
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: (MediaQuery.of(context).size.width - 100.00) ),
            child: Text(
              widget.provider.choosenExamname,
              // widget.ChoosenValue ,
              style: const TextStyle(
  color: Color.fromARGB(255, 74, 74, 74),           
       fontSize: 15,
       letterSpacing: 2,
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
    );
  }

  void updateList(String value) {
    widget.provider.searchExamList(value);
  }

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
                                widget.provider.choosenExamname,
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
                              widget.provider.searchExamList(value);

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
                            itemCount: widget.provider.getExamList().length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    widget.provider.setChoosenExamName(widget
                                        .provider
                                        .getExamList()[index]
                                        .name);
                                  });
                                  Navigator.of(context).pop();
                                },
                                title: Text(widget.provider.getExamList()[index].name),
                              );
                            })),
                  ]),
                ),
              );
            }));
  }
}
