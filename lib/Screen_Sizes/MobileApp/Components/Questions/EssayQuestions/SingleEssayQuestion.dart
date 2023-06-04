import 'package:flutter/material.dart';

class SingleEssayQuestion extends StatefulWidget {
  const SingleEssayQuestion({super.key});

  @override
  State<SingleEssayQuestion> createState() => _SingleEssayQuestionState();
}

class _SingleEssayQuestionState extends State<SingleEssayQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100,
      // color: Colors.red,
      child: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: const [
                Text("1 . "),
                SizedBox(
                  width: 10,
                ),
                Text("What is a wave ..... "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnswerButtonWidget(
                    title: "view answer",
                    icon: (Icons.arrow_drop_down),
                    color: Colors.black,
                    btnClicked: () {
                      print("Button 1 clicked ");
                    },
                    size: 20,
                    padding: PaddingData(top: 4, bottom: 4, right: 8, left: 8)),

                // AnswerButtonWidget(
                //   title: "Comment",
                //   icon: (Icons.comment),
                //   color: Color.fromARGB(255, 133, 133, 133),
                //   btnClicked: () {
                //     print("Button 2 clicked ");
                //   },
                // ),
              ],
            ),
          ]),
          SingleAnswer(),
          // SingleAnswer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnswerButtonWidget(
                  title: "other answers",
                  icon: (Icons.arrow_drop_down),
                  color: Colors.black,
                  btnClicked: () {
                    print("Button 3 clicked ");
                  },
                  size: 20,
                  padding: PaddingData(top: 4, bottom: 4, right: 8, left: 8)),

              // AnswerButtonWidget(
              //   title: "Comment",
              //   icon: (Icons.comment),
              //   color: Color.fromARGB(255, 133, 133, 133),
              //   btnClicked: () {
              //     print("Button 2 clicked ");
              //   },
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnswerButtonWidget(
                  title: "propose answer",
                  icon: (Icons.arrow_drop_down),
                  color: Colors.black,
                  btnClicked: () {
                    print("Button 3 clicked ");
                  },
                  size: 20,
                  padding: PaddingData(top: 4, bottom: 4, right: 8, left: 8)),

              // AnswerButtonWidget(
              //   title: "Comment",
              //   icon: (Icons.comment),
              //   color: Color.fromARGB(255, 133, 133, 133),
              //   btnClicked: () {
              //     print("Button 2 clicked ");
              //   },
              // ),

             
            ],
          ),
           Column(
                children: [
                  // TextField(),

                  Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(0.0))),
                        onPressed: () {}, child: Text("Submit" , style: TextStyle(fontSize: 10),)),
                    ],
                  )
                ],
              )
        ],
      ),
    );
  }
}

class SingleAnswer extends StatelessWidget {
  const SingleAnswer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "35 Votes",
                style: TextStyle(fontSize: 11),
              ),
              SizedBox(
                child: Row(children: [
                  Icon(
                    Icons.horizontal_rule,
                    size: 15,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Vote", style: TextStyle(fontSize: 11)),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.blue,
                  )
                ]),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("A wave is a electromagnetic blah blah blah"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnswerButtonWidget(
                  title: "Comment",
                  icon: (Icons.comment),
                  color: Color.fromARGB(255, 133, 133, 133),
                  btnClicked: () {
                    print("Button 2 clicked ");
                  },
                  size: 15,
                  padding: PaddingData(top: 4, bottom: 4, right: 8, left: 8)),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      "Ans by : ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 172, 172, 172),
                          fontSize: 10),
                    ),
                    Text(
                      "Afuh Christian",
                      style: TextStyle(
                          color: Color.fromARGB(255, 172, 172, 172),
                          fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PaddingData {
  PaddingData({
    required this.top,
    required this.bottom,
    required this.right,
    required this.left,
  });
  double top;
  double bottom;
  double left;
  double right;
}

class AnswerButtonWidget extends StatefulWidget {
  AnswerButtonWidget(
      {super.key,
      required this.btnClicked,
      required this.icon,
      required this.title,
      required this.color,
      required this.size,
      required this.padding});

  Function() btnClicked;
  IconData icon;
  String title;
  Color color;
  double size;
  PaddingData padding;

  @override
  State<AnswerButtonWidget> createState() => _AnswerButtonWidgetState();
}

class _AnswerButtonWidgetState extends State<AnswerButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.btnClicked,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 210, 210, 210),
                offset: Offset(5.0, 5.0),
                blurRadius: 10.0,
                spreadRadius: 0.0)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: widget.padding.left,
              right: widget.padding.right,
              top: widget.padding.top,
              bottom: widget.padding.bottom),
          child: Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(color: widget.color, fontSize: 10),
              ),
              const SizedBox(
                width: 5,
              ),
              // Icon(Icons.arrow_drop_down, color: widget.color,)
              Icon(
                widget.icon,
                color: widget.color,
                size: widget.size,
              )
            ],
          ),
        ),
      ),
    );
  }
}
