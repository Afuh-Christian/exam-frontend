import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: SizedBox(
              width: 120,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon(Icons.book, color: Colors.black,size: 20),
                    SvgPicture.asset(
                      "images/booka.svg",
                      width: 22,
                      height: 22,
                    ),

                    const Text(
                      "Exam",
                      style: TextStyle(
                        color: Color.fromARGB(255, 63, 62, 62),
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SvgPicture.asset(
                      "images/bookb.svg",
                      width: 22,
                      height: 22,
                    ),
                  ]),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20, top: 10, bottom: 10),
                // child: Icon(Icons.facebook),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(3000.0),
                    child: Image.asset(
                      "images/nouser.png",
                      width: 35,
                      height: 32,
                      fit: BoxFit.cover,
                    )),
              )
            ]),
        drawer: Drawer(
          child: Column(children: [
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: ClipOval(
                    // borderRadius: BorderRadius.circular(3000.0),
                    child: Image.asset(
                  "images/nouser.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: navitems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      textColor: Color.fromARGB(255, 14, 14, 14),
                      hoverColor: Color.fromARGB(255, 136, 135, 135),
                      leading: navitems[index]["icon"],
                      title: Text(navitems[index]["titlename"]),
                    );
                  }),
            )
          ]),
        ),
        body: Center(child: Text("Hellow"),)
        //  Container(
        //     width: double.infinity,
        //     height:  double.infinity,
        //     // color: Colors.yellow,
        //     child: Column(
        //       children: [
        //         Container(
        //           // color: Colors.red,
        //           // child: Text("Hello"),
        //           height: 300, 
        //           width: 250,
        //           child: StackOfDropdowns(),
        //         ),
        //       ],
        //     )
        //     )
            
            );
  }
}