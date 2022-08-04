import 'package:flutter/material.dart';

import 'main.dart';

class Result extends StatelessWidget {
  var x;
  final int resultScore;
  Result(this.x, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = "You are awesome !";
    } else if (resultScore >= 40) {
      resultText = "Pretty likable !";
    } else {
      resultText = "You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score is $resultScore",
            textAlign: TextAlign.center,
            style:  TextStyle(fontSize: 35, color: b,fontWeight: FontWeight.bold),
          ),
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style:  TextStyle(fontSize: 40,color: b, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: x,
              child: const Text(
                "Restart The App",
                style: TextStyle(fontSize: 30,),
              ))
        ],
      ),
    );
  }
}
