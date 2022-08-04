import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;

  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 = 0, num1 = 0, num2 = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void answerQuestion(score) {
    if (_questionIndex == 0) {
      num0 = score;
    } else if (_questionIndex == 1) {
      num1 = score;
    } else if (_questionIndex == 2) {
      num2 = score;
    }
    _totalScore = num0 + num1 + num2;
    setState(() {
      _questionIndex += 1;
    });

    print("_questionIndex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("_totalScore=$_totalScore");
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'what \'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40}
      ]
    },
    {
      'questionText': 'what \'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40}
      ]
    },
    {
      'questionText': 'what \'s your favorite instructor?',
      'answers': [
        {'text': 'khalifa', 'score': 10},
        {'text': 'mohamed', 'score': 20},
        {'text': 'ahmed', 'score': 30},
        {'text': 'abdallah', 'score': 40}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Quiz App',
              style: TextStyle(color: w),
            ),
            actions: [
              Switch(
                  value: isSwitched,
                  inactiveTrackColor: Colors.black54,
                  inactiveThumbColor: Colors.black,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      if (isSwitched == true) {
                        b = Colors.white;
                        w = Colors.black;
                      }
                      if (isSwitched == false) {
                        b = Colors.black;
                        w = Colors.white;
                      }
                    });
                  })
            ],
          ),
          body: Container(
            color: w,
            width: double.infinity,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalScore),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.arrow_back,
              color: w,
              size: 30,
            ),
            onPressed: () {
              if (_questionIndex == 1) _totalScore -= num0;
              if (_questionIndex == 2) _totalScore -= num1;
              if (_questionIndex == 3) _totalScore -= num2;
              setState(() {
                if (_questionIndex > 0) {
                  _questionIndex--;
                }
              });
              print("_questionIndex=$_questionIndex");
              print("num0=$num0");
              print("num1=$num1");
              print("num2=$num2");
              print("_totalScore=$_totalScore");
            },
          ),
        ),
      ),
    );
  }
}
