import 'package:flutter/material.dart';

import 'SingleEssayQuestion.dart';

class EssayQuestionList extends StatefulWidget {
  const EssayQuestionList({super.key});

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
            number: number ,
            onclick: () {
              setState(() {
                 number = !number;
              });
            print(number);
          }),SizedBox(height: 40,),
          SingleEssayQuestion(
            number: number ,
            onclick: () {
              setState(() {
                 number = !number;
              });
            print(number);
          }),SizedBox(height: 40,),
          SingleEssayQuestion(
            number: number ,
            onclick: () {
              setState(() {
                 number = !number;
              });
            print(number);
          }),
          SizedBox(
            height: 40,
          ),
          SingleEssayQuestion(
            number: number ,
            onclick: () {
              setState(() {
                 number = !number;
              });
            print(number);
          }),
          SizedBox(
            height: 40,
          ),
          SingleEssayQuestion(
            number: number ,
            onclick: () {
              setState(() {
                 number = !number;
              });
            print(number);
          }),
          SizedBox(
            height: 40,
          ),
          SingleEssayQuestion(
            number: number ,
            onclick: () {
              setState(() {
                 number = !number;
              });
            print(number);
          }),
          SizedBox(
            height: 40,
          ),
          SingleEssayQuestion(
            number: number ,
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
