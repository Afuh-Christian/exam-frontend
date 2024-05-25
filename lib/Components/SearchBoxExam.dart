import 'package:flutter/material.dart';

import '../Provider/MovieModel.dart';

class SearchBoxCustom extends StatefulWidget {
  const SearchBoxCustom({super.key});

  @override
  State<SearchBoxCustom> createState() => _SearchBoxCustomState();
}

class _SearchBoxCustomState extends State<SearchBoxCustom> {
  // Creating a dummy list of movies ....
  static List<MovieModel> movies = [
    MovieModel("the lost house"),
    MovieModel("hunger games"),
    MovieModel("Mission Impossible"),
    MovieModel("Nevver"),
    MovieModel("Questions "),
    MovieModel("this has never happened"),
    MovieModel("My home"),
  ];

  List<MovieModel> displayList = List.from(movies);
  
  
  void updateList(String value) {
      // this is the function that will filter our list
      // we will be back to this list after
      setState(() {
           displayList = movies
          .where((element) =>
              element.movie_title!.toLowerCase().startsWith(value.toLowerCase()))
          .toList();
          //  displayList = movies
          // .where((element) =>
          //     element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          // .toList();
      });
   
    }


  @override
  Widget build(BuildContext context) {
    // Creating the list that will be displayed and filter
    // List<MovieModel> displayList = List.from(movies);
    
   
    

    return Container(
      color: Colors.purple,
      child: Column(
        children: [
          SizedBox(
            child: TextField(
              onChanged: (value) {
                updateList(value);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 26, 26, 26),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "eg: The DArk knight",
                  hintStyle:  TextStyle(color: Color.fromARGB(255, 193, 192, 192)) ,
                  // suffixIcon: Icon(Icons.search),
                  prefixIcon:  Icon(Icons.search),
                  prefixIconColor: Colors.purple.shade900),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: displayList.length,
            itemBuilder: (context, index) => ListTile(
              
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(
                displayList[index].movie_title!,
                style:
                   const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "Hellodjf;alkjda;jdf;aksdjfd",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: const Text("${32}"),
              leading: const Icon(Icons.movie),
            ),
          )),
        ],
      ),
    );
  }
}
