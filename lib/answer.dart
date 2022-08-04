import 'package:flutter/material.dart';

import 'main.dart';

class Answer extends StatelessWidget {
   var answerText;
  var x;

  Answer(
    this.x,
    this.answerText,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            answerText,
            style:  TextStyle(fontSize: 25,color: w),
          ),
          onPressed: x,
        ));
  }
}
