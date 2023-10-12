import 'package:flutter/material.dart';
import 'QuizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: QuizPage(),)
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  void checkAnswer(bool selectedAnswer){
    setState(() {
      if(quizBrain.getCorrectAnswer() == selectedAnswer){
        quizBrain.scoreKeeper.add(Icon(Icons.check,
          color: Colors.green,
          size: 24.0,
        ));
        print('correct answer');
      }
      else{
        print('wrong answer');
        quizBrain.scoreKeeper.add(Icon(Icons.close,
          color: Colors.red,
          size: 24.0,
        ));
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Center(child: Text(quizBrain.getQuestionText(),
            style: TextStyle(color: Colors.white,
              fontSize: 25.0,),),),),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(onPressed: (){
              checkAnswer(true);
            },
              child: Text('True',
                  style: TextStyle(color: Colors.white,
                  fontSize: 25.0),),
              style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.green),
                foregroundColor:
                MaterialStatePropertyAll<Color>(Colors.white),
              ),
        ),
          ),),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(onPressed: (){
              checkAnswer(false);
            },
              child: Text('False',
            style: TextStyle(color: Colors.white,
            fontSize: 25.0),),
              style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.red),
                foregroundColor:
                MaterialStatePropertyAll<Color>(Colors.white),
              ),
        ),
          ),),
        Row(children: quizBrain.scoreKeeper,)
      ],
    );
  }
}
