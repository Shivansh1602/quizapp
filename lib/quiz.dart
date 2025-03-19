import 'package:flutter/material.dart';
import 'package:quizapp/question_answers/qna.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/questions.dart';
import 'package:quizapp/question_answers/qna.dart';
import 'package:quizapp/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activescreen = 'start-screen';

// Widget? activescreen;

// @override
//   void initState() {
//     activescreen=startScreen(switchScreen);
//     super.initState();
//   }

// void switchScreen(){

// setState(() {
//   activescreen=const Questions();
// });

// }

  void switchScreen() {
    setState(() {
      
      activescreen = 'questions-screen';
    });
  }

  void chooseanswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = 'result-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activescreen='questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = startScreen(switchScreen);
    if (activescreen == 'questions-screen') {
      screenWidget = Questions(
        onSelectanswer: chooseanswer,
      );
    }
    if (activescreen == 'result-screen') {
      screenWidget = ResultsScreen(
        chosenanswers: selectedAnswers,
        onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 89, 10, 142),
            Color.fromARGB(255, 89, 10, 142)
          ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
          child: screenWidget,
        ),
      ),
    );
  }
}
