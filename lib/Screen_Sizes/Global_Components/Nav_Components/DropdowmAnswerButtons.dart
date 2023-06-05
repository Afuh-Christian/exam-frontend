

import 'package:flutter/material.dart';

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
