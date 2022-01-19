import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain qb = QuizBrain();

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> suiviScore = [];

  checkAnswer(bool x) {
    if (suiviScore.length == qb.nbQuestion()) {
      Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
          .show();
    } else {
      bool bonnereponse = qb.getQuestionReponse();
      setState(() {
        if (bonnereponse == x) {
          suiviScore.add(Icon(Icons.check, color: Colors.green));
        } else {
          suiviScore.add(Icon(Icons.close, color: Colors.red));
        }
        qb.nextQuestion(); // questionNumber = questionNumber + 1 ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(
                      qb.getQuestionEnonce(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text(
                      "Vrai",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Text(
                      "Faux",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Row(
                children: suiviScore,
              )
            ],
          ),
        ),
      ),
    );
  }
}
