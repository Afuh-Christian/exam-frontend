import 'package:flutter/material.dart';

import 'SingleEssayQuestion.dart';

class EssayQuestionList extends StatefulWidget {
  const EssayQuestionList({super.key});

  @override
  State<EssayQuestionList> createState() => _EssayChoiceState();
}

class _EssayChoiceState extends State<EssayQuestionList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleEssayQuestion(),
      ],
    );
  }
}
