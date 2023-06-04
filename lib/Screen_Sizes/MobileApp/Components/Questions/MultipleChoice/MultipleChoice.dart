import 'package:flutter/material.dart';

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 60,
      itemBuilder: (context, index) {
        return  Container(
          child: Column(
            children: [
              // question 
              
              
            ],
          ), 

        );
      },
    );
  }
}
