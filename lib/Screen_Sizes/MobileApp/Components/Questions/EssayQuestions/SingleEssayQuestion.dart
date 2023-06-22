import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../Provider/Provider.dart';
import '../../../../Global_Components/Nav_Components/DropdowmAnswerButtons.dart';
import '../../../../Global_Components/Nav_Components/Nav_avatar.dart';

class SingleEssayQuestion extends StatefulWidget {
  SingleEssayQuestion(
      {super.key,
      required this.onclick,
      required this.number,
      required this.provider
      });
  bool number;
  void Function() onclick;
  final ExamProvider provider;

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
    var theme = widget.provider.theme();
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
                Text(
                  "1 . ",
                  style: TextStyle(color: theme.text_primary),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "What is a wave ..... ",
                  style: TextStyle(color: theme.text_primary),
                ),
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
                        provider: widget.provider,
                        title: "view answer",
                        icon: (Icons.arrow_drop_down),
                        color: theme.text_primary!,
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
                      SingleAnswer(
                        provider: widget.provider,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnswerButtonWidget(
                              provider: widget.provider,
                              title: "other answers",
                              icon: (Icons.arrow_drop_down),
                              color: theme.text_primary!,
                              btnClicked: () {
                                // print("Button 3
                                //clicked ");
                                setState(() {
                                  showOtherAnswers = !showOtherAnswers;
                                });
                              },
                              size: 20,
                              padding: PaddingData(
                                  top: 4, bottom: 4, right: 8, left: 8)),

                         
                        ],
                      ),
                       SizedBox(
                            height: 20,
                        
                          )
                    ],
                  ),
                ),
                OtherAnswersWidget(
                    provider: widget.provider,
                    showOtherAnswers: showOtherAnswers),
                // SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnswerButtonWidget(
                          provider: widget.provider,
                          title: "propose answer",
                          icon: (Icons.arrow_drop_down),
                          color: theme.text_primary!,
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
                AnswerField(
                    provider: widget.provider,
                    showAnswerField: showAnswerField),
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
    required this.provider,
  });
  bool showOtherAnswers;
  final ExamProvider provider;

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
            SingleAnswer(
              provider: widget.provider,
            ),
            SingleAnswer(
              provider: widget.provider,
            ),
            SingleAnswer(
              provider: widget.provider,
            ),
            SingleAnswer(
              provider: widget.provider,
            ),
            SingleAnswer(
              provider: widget.provider,
            ),
            SingleAnswer(
              provider: widget.provider,
            ),
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
    required this.provider,
  });

  bool showAnswerField;
  final ExamProvider provider;

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
    var theme = widget.provider.theme();
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
                style: TextStyle(fontSize: 12, color: theme.text_primary),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.search_bacground_primary,
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
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(theme.btn_primary),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(0.0))),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 10, color: theme.text_quatenary),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class SingleAnswer extends StatefulWidget {
  const SingleAnswer({super.key, required this.provider});

  final ExamProvider provider;

  @override
  State<SingleAnswer> createState() => _SingleAnswerState();
}

class _SingleAnswerState extends State<SingleAnswer> {
  int incMaxLines = 1;
  String commentInputValue = "";

  // @override
  // void didUpdateWidget(covariant oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (commentInputValue.length < 30) incMaxLines = 1;
  // }

  @override
  Widget build(BuildContext context) {
    var theme = widget.provider.theme();
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
                style: TextStyle(fontSize: 11, color: theme.text_secondary),
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
                  Text("Vote",
                      style:
                          TextStyle(fontSize: 11, color: theme.text_secondary)),
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
          Text("A wave is a electromagnetic blah blah blah",
              style: TextStyle(color: theme.text_secondary)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnswerButtonWidget(
                  provider: widget.provider,
                  title: "Comments",
                  icon: (Icons.comment),
                  color: theme.text_tetiary!,
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
                    SizedBox(width: 10),
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

  void setMaxLines(String value) {
    int maxLineCalculate = (1 + (value.length / 40).floor());
    incMaxLines = maxLineCalculate > 8 ? 8 : maxLineCalculate;
  }

  void ShowCommentSection() {
    var theme = widget.provider.theme();
    // Reset maxLines .........
    incMaxLines = 1;

    int i = 0;
    var arrayWords = [];
    for (i < 0; i < 200; i++) {
      arrayWords.add("this is me at home ....");
    }
    showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Dialog(
            backgroundColor: theme.background_primary,
            child: Container(
                color: theme.background_primary,
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              child: Text(
                                "What is a wave ... ",
                                style: TextStyle(
                                    fontSize: 15, color: theme.text_secondary),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 10),
                                child: Icon(Icons.close,
                                    size: 30, color: theme.icon_primary),
                              )),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "35 Votes",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: theme.text_secondary),
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
                                    Text("Vote",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: theme.text_secondary)),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text("A wave is a electromagnetic blah blah blah",
                                style: TextStyle(
                                    fontSize: 13, color: theme.text_secondary)),
                            const SizedBox(
                              height: 0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: const [
                                      Text(
                                        "Ans by : ",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 172, 172, 172),
                                            fontSize: 10),
                                      ),
                                      Text(
                                        "Afuh Christian",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 172, 172, 172),
                                            fontSize: 10),
                                      ),
                                      SizedBox(width: 10),
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
                      ),

                      // Expanded
                      Expanded(
                          child: ListView.builder(
                              itemCount: 200,
                              itemBuilder: (context, item) => ListTile(
                                    minLeadingWidth: 10,
                                    minVerticalPadding: 10,
                                    leading: const UserFace(
                                      image: "images/nouser.png",
                                      imageHeight: 20,
                                      imagewidth: 20,
                                      top: 10,
                                      bottom: 10,
                                      right: 0,
                                      left: 0,
                                      raduis: 3000.0,
                                    ),
                                    title: Text(
                                      "Afuh Christian",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          height: 3,
                                          color: theme.text_primary),
                                    ),
                                    subtitle: Text(
                                      "I love everything about what you  just said  about what a force is but there are some short commings in your models ....",
                                      style: TextStyle(
                                          height: 1.7,
                                          fontSize: 12,
                                          color: theme.text_secondary),
                                    ),
                                  ))),

                      // Input text .....

                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      setMaxLines(value);
                                    });
                                  },
                                  maxLines: incMaxLines,
                                  style: TextStyle(
                                      fontSize: 12, color: theme.text_primary),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    isDense: true,
                                    filled: true,
                                    fillColor: theme.search_bacground_primary,
                                    hintText: "Add Comment",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 155, 155, 155)),
                                    // suffixIcon: Icon(Icons.send)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.send,
                            fill: 1.0,
                            color: theme.btn_primary,
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
