import 'package:flutter/material.dart';

import '../../../../Dummy_data.dart';
import '../../../../Provider/Provider.dart';
import '../../../../Provider/Theme/theme.dart';

class PopTopicMenu extends StatefulWidget {
  PopTopicMenu({
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
  State<PopTopicMenu> createState() => _PopTopicMenuState();
}

class _PopTopicMenuState extends State<PopTopicMenu> {
  @override
  Widget build(BuildContext context) {
    colorTheme theme = widget.provider.theme();
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopicFullSrceenSearch(provider: widget.provider,)
      ,fullscreenDialog: true
      )),
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
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: Text(
              widget.provider.choosenTopic,
              // widget.ChoosenValue ,
              style: TextStyle(
                color: theme.text_secondary,
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


}

class TopicFullSrceenSearch extends StatefulWidget {
  TopicFullSrceenSearch({super.key, required this.provider});
  final ExamProvider provider;
  @override
  State<TopicFullSrceenSearch> createState() => _TopicFullSrceenSearchState();
}

class _TopicFullSrceenSearchState extends State<TopicFullSrceenSearch> {
  @override
  Widget build(BuildContext context) {
    var theme = widget.provider.theme();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.background_primary,
        iconTheme: IconThemeData(color:theme.icon_primary),
        title: Text(widget.provider.choosenTopic , style: TextStyle(color: theme.text_secondary),)),
      backgroundColor: theme.background_primary,
      body: Center(
        child: SizedBox(
          height: double.infinity,
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
                    widget.provider.searchTopicList(value);
                    // widget.searchFunction(value);
                  });
                },
                style: TextStyle(color: theme.text_primary),
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: theme.search_bacground_primary,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Search Topic",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 155, 155, 155)),
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
                    itemCount: widget.provider.getTopicList().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            // widget.chooseFunction(
                            //     widget.list[index].name);
                            widget.provider.setChoosenTopicName(
                                widget.provider.getTopicList()[index].name);
                          });
                          Navigator.of(context).pop();
                        },
                        title: Text(
                          widget.provider.getTopicList()[index].name,
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
