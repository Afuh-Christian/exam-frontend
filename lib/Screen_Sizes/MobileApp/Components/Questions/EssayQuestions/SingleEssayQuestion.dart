import 'package:flutter/material.dart';

import '../../../../Global_Components/Nav_Components/DropdowmAnswerButtons.dart';
import '../../../../Global_Components/Nav_Components/Nav_avatar.dart';

class SingleEssayQuestion extends StatefulWidget {
  SingleEssayQuestion({
    super.key,
    required this.onclick,
    required this.number,
  });
  bool number;
  void Function() onclick;

  @override
  State<SingleEssayQuestion> createState() => _SingleEssayQuestionState();
}

class _SingleEssayQuestionState extends State<SingleEssayQuestion>
    with TickerProviderStateMixin {
  late AnimationController animationControllerTopAnswer,
      animationControllerQuestionView;
  late Animation<double> animateTopAnswer, animateQuestionView;

  bool showTopAnswer = false;
  bool showQuestionView = false;

  bool showAnswerField = false;
  bool showOtherAnswers = false;

  @override
  void initState() {
    super.initState();

    animationControllerQuestionView =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animationControllerTopAnswer =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animateQuestionView = CurvedAnimation(
        parent: animationControllerQuestionView, curve: Curves.easeIn);

    animateTopAnswer = CurvedAnimation(
        parent: animationControllerTopAnswer, curve: Curves.easeIn);
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (showQuestionView == widget.number) {
      if (showQuestionView) {
        animationControllerQuestionView.forward();
      }
      if (!showQuestionView) {
        animationControllerQuestionView.animateBack(0);
      }
    }

    //   if (showQuestionView) {
    //    animationControllerQuestionView.forward();
    //   }
    //  if (!showQuestionView) {
    //                 animationControllerQuestionView.animateBack(0);
    //               }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100,
      // color: Colors.red,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
             
              setState(() {
                if (showQuestionView == widget.number) {
                  showQuestionView = !showQuestionView;
                   widget.onclick();
                }
                // if (showQuestionView) {
                //   animationControllerQuestionView.forward();
                // }
                // if (!showQuestionView) {
                //   animationControllerQuestionView.animateBack(0);
                // }
              });
            },
            child: Row(
              children: [
                const Text("1 . "),
                const SizedBox(
                  width: 10,
                ),
                Text("What is a wave ..... "),
           
              ],
            ),
          ),
          SizeTransition(
            sizeFactor: animateQuestionView,
            axis: Axis.vertical,
            axisAlignment: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnswerButtonWidget(
                        title: "view answer",
                        icon: (Icons.arrow_drop_down),
                        color: Colors.black,
                        btnClicked: () {
                          // print("Button 1 clicked ");
                          setState(() {
                            showTopAnswer = !showTopAnswer;
                            if (showTopAnswer) {
                              animationControllerTopAnswer.forward();
                            }
                            if (!showTopAnswer) {
                              animationControllerTopAnswer.animateBack(0);
                              showOtherAnswers = false;
                            }
                          });
                        },
                        size: 20,
                        padding:
                            PaddingData(top: 4, bottom: 4, right: 8, left: 8)),
                  ],
                ),
                SizeTransition(
                  sizeFactor: animateTopAnswer,
                  axis: Axis.vertical,
                  axisAlignment: 0,
                  child: Column(
                    children: [
                      SingleAnswer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnswerButtonWidget(
                              title: "other answers",
                              icon: (Icons.arrow_drop_down),
                              color: Colors.black,
                              btnClicked: () {
                                // print("Button 3 clicked ");
                                setState(() {
                                  showOtherAnswers = !showOtherAnswers;
                                });
                              },
                              size: 20,
                              padding: PaddingData(
                                  top: 4, bottom: 4, right: 8, left: 8)),
                        ],
                      ),
                    ],
                  ),
                ),
                OtherAnswersWidget(showOtherAnswers: showOtherAnswers),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnswerButtonWidget(
                          title: "propose answer",
                          icon: (Icons.arrow_drop_down),
                          color: Colors.black,
                          btnClicked: () {
                            // print("Button 3 clicked ");
                            setState(() {
                              showAnswerField = !showAnswerField;
                            });
                          },
                          size: 20,
                          padding: PaddingData(
                              top: 4, bottom: 4, right: 8, left: 8)),
                    ),
                  ],
                ),
                AnswerField(showAnswerField: showAnswerField),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OtherAnswersWidget extends StatefulWidget {
  OtherAnswersWidget({
    super.key,
    required this.showOtherAnswers,
  });
  bool showOtherAnswers;

  @override
  State<OtherAnswersWidget> createState() => _OtherAnswersWidgetState();
}

class _OtherAnswersWidgetState extends State<OtherAnswersWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  void didUpdateWidget(covariant OtherAnswersWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.showOtherAnswers) animationController.forward();
    if (!widget.showOtherAnswers) animationController.animateBack(0);
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      axisAlignment: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            SingleAnswer(),
            SingleAnswer(),
            SingleAnswer(),
            SingleAnswer(),
            SingleAnswer(),
            SingleAnswer(),
          ],
        ),
      ),
    );
  }
}

class AnswerField extends StatefulWidget {
  AnswerField({
    super.key,
    required this.showAnswerField,
  });

  bool showAnswerField;

  @override
  State<AnswerField> createState() => _AnswerFieldState();
}

class _AnswerFieldState extends State<AnswerField>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  bool showAnswerFields = false;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showAnswerField) animationController.forward();
    if (!widget.showAnswerField) animationController.animateBack(0);
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.showAnswerField) {
    //   animationController.forward();
    // } else {
    //   animationController.animateBack(0);
    // }

    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      axisAlignment: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              width: double.infinity,
              child: TextField(
                maxLines: 10,
                // controller: TextEditingController(text: searchValue),
                onChanged: (value) {},
                style: const TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 227, 227, 227),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "Type your answer here",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 155, 155, 155)),
                  // suffixIcon: GestureDetector(
                  //     onTap: () {}, child: const Icon(Icons.search)),
                  // suffixIconColor: const Color.fromARGB(255, 55, 55, 55)
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 101, 101, 101)),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(0.0))),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 10),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class SingleAnswer extends StatefulWidget {
  const SingleAnswer({
    super.key,
  });

  @override
  State<SingleAnswer> createState() => _SingleAnswerState();
}

class _SingleAnswerState extends State<SingleAnswer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 30),
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
            height: 20,
          ),
          Text("A wave is a electromagnetic blah blah blah"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnswerButtonWidget(
                  title: "Comments",
                  icon: (Icons.comment),
                  color: Color.fromARGB(255, 133, 133, 133),
                  btnClicked: () {
                    return ShowCommentSection();
                  },
                  size: 15,
                  padding: PaddingData(top: 4, bottom: 4, right: 8, left: 8)),
              SizedBox(
                child: Row(
                  children: const [
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
                    SizedBox(width:10),
                       UserFace(
        image: "images/nouser.png",
        imageHeight: 20,
        imagewidth: 20,
        top: 10,
        bottom: 10,
        right: 0,
        left: 0,
        raduis: 3000.0,
      )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void ShowCommentSection() => showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Dialog(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
              ),
            );
          },
        ),
      );
}
