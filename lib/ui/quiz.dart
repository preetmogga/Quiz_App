import 'package:flutter/material.dart';
import 'package:quiz_app/ui/question.dart';

// ignore: unused_element
QuizBrain _question = new QuizBrain();

class Quiz extends StatefulWidget {
  Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questioNumber = 0;
  List<Icon> scoreKepper = [];
  void checkAnswer(bool userpicked) {
    bool rightAnswer = _question.quizbank[questioNumber].questionAnswer;
    if (userpicked == rightAnswer) {
      scoreKepper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreKepper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    setState(() {
      if (questioNumber < 3) {
        questioNumber++;
      } else {
        final snackbar = SnackBar(
          content: Text("question complet"),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            onPressed: () {},
            label: 'undo',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz'),
      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 100,
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.indigo.shade300),
                    ),
                    child: Center(
                        child: Text(
                            _question.quizbank[questioNumber].questionText)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.navigate_before),
                          onPressed: () {
                            setState(() {
                              questioNumber = (questioNumber - 1) %
                                  _question.quizbank.length;
                            });
                          },
                        ),
                        ElevatedButton(
                          child: Text('true'),
                          onPressed: () => checkAnswer(true),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          child: Text('false'),
                          onPressed: () => checkAnswer(false),
                        ),
                        IconButton(
                            icon: Icon(Icons.navigate_next),
                            onPressed: () {
                              setState(() {
                                questioNumber = (questioNumber + 1) %
                                    _question.quizbank.length;
                              });
                            }),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scoreKepper,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
