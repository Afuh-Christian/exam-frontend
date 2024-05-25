import 'package:exam_front_end/Controllers/AppThemeController.dart';
import 'package:exam_front_end/Controllers/QuestionController.dart';
import 'package:flutter/material.dart';

import 'SingleEssayQuestion.dart';

class EssayQuestionList extends StatefulWidget {
  const EssayQuestionList({super.key, 
  required this.questionController,
  required this.appThemeController
  
  });

  final QuestionController questionController;
  final AppThemeController appThemeController;

  @override
  State<EssayQuestionList> createState() => _EssayChoiceState();
}

class _EssayChoiceState extends State<EssayQuestionList> {
  bool number = false;
  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleEssayQuestion(
             questionController: widget.questionController,
             appThemeController: widget.appThemeController.theme(),
              number: number,
              onclick: () {
                setState(() {
                  number = !number;
                });
                print(number);
              }),
          SizedBox(
            height: 40,
          ),
       
          // SingleEssayQuestion(),
          // SizedBox(
          //   height: 40,
          // ),
          // SingleEssayQuestion(),
          // SizedBox(
          //   height: 40,
          // ),
        ],
      ),
    );
  }
}
