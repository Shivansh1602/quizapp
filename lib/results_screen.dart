import 'package:flutter/material.dart';
import 'package:quizapp/question_answers/qna.dart';
import 'package:quizapp/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenanswers,required this.onRestart});

final void Function() onRestart;
  final List<String> chosenanswers;

  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenanswers.length; i++) {
      summary.add({
        'questions_index': i,  // ✅ Fixed key name
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],  // ✅ Fixed key name
        'user_answer': chosenanswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
final summaryData=getsummarydata();
final numTotalQuestions=questions.length;
final numCorrectQuestions=summaryData.where((data ){
  return data['user_answer']==data['correct_answer'];
}).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$numCorrectQuestions out of $numTotalQuestions questions are correct',
              style:const  TextStyle(fontSize: 20,
              color: Colors.white),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: summaryData),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(foregroundColor:Colors.white,),
                icon:const  Icon(Icons.restart_alt),
                label: const Text('Restart Quiz'),

              ),
            ],
          ),
        ),
      );
    
  }
}
