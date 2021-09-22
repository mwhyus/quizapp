import 'package:flutter/material.dart';
import 'package:init_app/quiz.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _MyAppState();
  }
}

// Using (_)MyApp so that this variabel cannot use in outside
// main.dart (From public to private class)

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s the capital city of Indonesia?',
      'answers': ['Kutai/Penajam', 'Maluku', 'Surabaya', 'Jakarta'],
    },
    {
      'questionText': 'What\'s traditional food of Makassar?',
      'answers': ['Pizza', 'Pallubasa', 'Steak', 'Takoyaki'],
    },
    {
      'questionText': 'What anime Saitama coming from?',
      'answers': ['One Piece', 'One Punch Man', 'One Outs', 'Mob Psycho'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('We have no more question');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Center(
                child: Text('Thanks for answering the questions!'),
              ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
