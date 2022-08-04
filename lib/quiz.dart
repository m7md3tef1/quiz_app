import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(this.question, this.questionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Question(question[questionIndex]['questionText']),
        ),
        ...(question[questionIndex]['answers'] as List<Map<String, Object?>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score'],), answer['text']);
        }).toList(),
      ],
    );
  }
}
