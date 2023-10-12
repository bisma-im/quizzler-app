
import 'Question.dart';
import 'package:flutter/material.dart';

class QuizBrain{
  List<Icon> scoreKeeper = [];

  int _questionNo = 0;
  List<Question> _questionBank = [
    Question('Sharks are mammals', false),
    Question('Sea otters have a favorite rock they use to break open food', true),
    Question('The blue whale is the biggest animal to have ever lived', true),
    Question('The hummingbird egg is the worlds smallest bird egg', true),
    Question('Bats are blind', false),
    Question('New York City is composed of between 36 and 42 islands', true),
    Question('South Africa has one capital', false),
    Question('Mount Everest is the tallest mountain in the world', true),
    Question('Most of the human brain is made of muscle', false),
    Question('The human eye can distinguish 10 million different colors', true),
  ];

  void nextQuestion(){
    if(_questionNo < _questionBank.length - 1){
      _questionNo++;
    }
    else{
      showAlertDialog(BuildContext context) {

        // set up the button
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {_questionNo = 0;
            scoreKeeper.clear();
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("THE END"),
          content: Text("The quiz has ended."),
          actions: [
            okButton,
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
    }
  }

  String getQuestionText(){
    return _questionBank[_questionNo].questionText;
  }

  bool getCorrectAnswer(){
    return _questionBank[_questionNo].questionAnswer;
  }
}