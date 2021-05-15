class Question {
  String questionText;
  bool questionAnswer;

  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}

class QuizBrain {
  List<Question> quizbank = [
    Question(q: 'my name is preet', a: true),
    Question(q: 'i am student', a: true),
    Question(q: 'my full name Gurpreet Singh', a: true),
    Question(q: 'I am Developer', a: true),
  ];
}
