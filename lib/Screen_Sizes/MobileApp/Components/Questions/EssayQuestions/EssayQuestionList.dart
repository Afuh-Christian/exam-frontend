import 'package:flutter/material.dart';

import '../../../../../Provider/Provider.dart';
import 'SingleEssayQuestion.dart';

class EssayQuestionList extends StatefulWidget {
  const EssayQuestionList({super.key, required this.provider});

  final ExamProvider provider;

  @override
  State<EssayQuestionList> createState() => _EssayChoiceState();
}

class _EssayChoiceState extends State<EssayQuestionList> {
  bool number = false;
  @override
  Widget build(BuildContext context) {
    var theme = widget.provider.theme();
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleEssayQuestion(
             provider: widget.provider,
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
          SingleEssayQuestion(
             provider: widget.provider,
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
          SingleEssayQuestion(
             provider: widget.provider,
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
          SingleEssayQuestion(
             provider: widget.provider,
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
          SingleEssayQuestion(
             provider: widget.provider,
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
          SingleEssayQuestion(
             provider: widget.provider,
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
          SingleEssayQuestion(
             provider: widget.provider,
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
