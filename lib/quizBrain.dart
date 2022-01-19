import 'package:correctionquiz/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question("Le piton des neiges est un volcan de la Réunion ?", true),
    Question("Flutter permet de faire des applications web également ?", true),
    Question("Php est le language utilisé par Flutter ?", false)
  ];

  int _questionNumber = 0;

  String getQuestionEnonce() {
    return _questions[_questionNumber].enonce;
  }

  bool getQuestionReponse() {
    return _questions[_questionNumber].reponse;
  }

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool fini() {
    if (_questionNumber >= _questions.length - 1) {
      print("fini");
      return true;
    } else {
      return false;
    }
  }

  int nbQuestion() {
    return _questions.length;
  }

  void reset() {
    _questionNumber = 0;
  }
}
