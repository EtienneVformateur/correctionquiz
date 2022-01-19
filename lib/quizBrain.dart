import 'package:correctionquiz/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question("Le piton des neiges est un volcan de la Réunion ?", true),
    Question("Flutter permet de faire des applications web également ?", true),
    Question("Php est le language utilisé par Flutter ?", false)
  ];

  String getQuestionEnonce(int questionNumber) {
    return _questions[questionNumber].enonce;
  }

  bool getQuestionReponse(int questionNumber) {
    return _questions[questionNumber].reponse;
  }
}
