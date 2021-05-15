import 'package:flutter/material.dart';
import 'package:quiz_app/ui/quiz.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Quiz(),
    );
  }
}
