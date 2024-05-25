import 'package:flutter/material.dart';


class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() =>
      _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
          },
        ),
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + top[index] % 4 * 100],
                  height: 100 + top[index] % 4 * 20.0,
                  child: Text('Item: ${top[index]}'),
                );
              },
              childCount: top.length,
            ),
          ),
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + bottom[index] % 4 * 100],
                  height: 100 + bottom[index] % 4 * 20.0,
                  child: Text('Item: ${bottom[index]}'),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }
}


























































class formDropdown extends StatelessWidget {
  const formDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dropdown(
            title: "Exam",
          ),
          dropdown(
            title: "Subject",
          ),
          dropdown(title: "Topic"),
        ],
      ),
    );
  }
}

// List of items in our dropdown menu

class dropdown extends StatefulWidget {
  final String title;
  dropdown({Key? key, required this.title}) : super(key: key);

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  var itemList = [
    'Iteasdfasdfam1',
    'Itemsdfasdfadsfasdfasdfsdf2',
    'Itasdfasdfadfasdfem3',
    'Iteadfasdfadfadfasdfasdfasdfasdfm4',
    'Iteasdfasdfasdfadfm5',
    'Iteasdfasdfadfadsfm6',
    'Iteasdfasdfadfm7',
    'Itadsfasdfasdfadfasdfasdfem8',
  ];

  var dropdownvalue = 'Iteasdfasdfam1';

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      margin: EdgeInsets.only(left: 16, right: 16),
      
      constraints: const BoxConstraints(
        maxWidth: 300,
        // maxHeight: 300,
        ),
      decoration: const BoxDecoration(

          // color: Colors.blue,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 216, 216, 216),
                offset: Offset(1.0, 1.0),
                blurRadius: 3.2,
                spreadRadius: 1.0)
          ]),
      // child: DropdownButton(
      child: DropdownButtonFormField(
    
        value: dropdownvalue,
        isExpanded: false,
        borderRadius: BorderRadius.circular(5),
        
        
        //  underline: SizedBox(),
        // elevation: 5,
        dropdownColor: Color.fromARGB(255, 223, 223, 223),
        decoration:  InputDecoration(
          labelText: "${widget.title}",
          // isCollapsed: true,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 177, 177, 177), width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          filled: true,
          fillColor: Colors.white,
          // isDense: true,

        ),

        onChanged: (String? value) => {
          setState(() => {dropdownvalue = value as String})
        },
        
        items: itemList
            .map((e) => (DropdownMenuItem(

                  value: e,

                  child: Text(e),
                )))
            .toList(),
      ),
    );
    ;
  }
}
