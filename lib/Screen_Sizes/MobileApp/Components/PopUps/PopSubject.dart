import 'package:exam_front_end/Provider/Theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../Dummy_data.dart';
import '../../../../Provider/Provider.dart';

class PopSubjectMenu extends StatefulWidget {
  PopSubjectMenu({
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
  State<PopSubjectMenu> createState() => _PopSubjectMenuState();
}

class _PopSubjectMenuState extends State<PopSubjectMenu> {
  @override
  Widget build(BuildContext context) {
    colorTheme theme = widget.provider.theme();
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder:    (context) => SubjectFullSearch(provider: widget.provider))
      ),
      style: ButtonStyle(
          visualDensity: VisualDensity(vertical: 2.0),
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
          backgroundColor: MaterialStatePropertyAll(theme.background_primary)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 100.0),
            child: Text(
              widget.provider.choosenSubject,
              // widget.ChoosenValue ,
              style: TextStyle(
                color: theme.text_primary,
                letterSpacing: 2,
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

}

class SubjectFullSearch extends StatefulWidget {
  SubjectFullSearch({super.key, required this.provider});

  final ExamProvider provider;

  @override
  State<SubjectFullSearch> createState() => _SubjectFullSearchState();
}

class _SubjectFullSearchState extends State<SubjectFullSearch> {
  @override
  Widget build(BuildContext context) {
    var theme = widget.provider.theme();
    return Scaffold(
      backgroundColor: theme.background_primary,
      appBar: AppBar(
        backgroundColor: theme.background_primary,
        title: Text(
           widget.provider.choosenSubject,
                    
                      style: TextStyle(fontSize: 17, color: theme.text_primary),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: theme.icon_primary),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
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
                    widget.provider.searchSubjectList(value);
                    // widget.searchFunction(value);
                  });
                },
                style: TextStyle(color: theme.text_primary),
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: theme.search_bacground_primary,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Search subject",
                    hintStyle: TextStyle(color: theme.text_primary),
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
                    itemCount: widget.provider.getSubjectList().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            widget.provider.setChoosenSubjectName(
                                widget.provider.getSubjectList()[index].name);
                          });
                          Navigator.of(context).pop();
                        },
                        title: Text(
                          widget.provider.getSubjectList()[index].name,
                          style: TextStyle(color: theme.text_primary),
                        ),
                      );
                    })),
          ]),
        ),
      ),
    );
  }
}
