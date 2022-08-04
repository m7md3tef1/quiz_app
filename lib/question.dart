import 'package:flutter/material.dart';

import 'main.dart';

class Question extends StatelessWidget {
  final questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Text(
          questionText,
          style: TextStyle(fontSize: 30, color: b, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}
