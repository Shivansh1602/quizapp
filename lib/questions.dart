import 'package:flutter/material.dart';
import 'package:quizapp/answers.dart';
import 'package:quizapp/question_answers/qna.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key,required this.onSelectanswer,});

  final void Function(String answer) onSelectanswer;
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentquestionindex = 0;

  void answerquestion(selectedAnswers) {
    widget.onSelectanswer(selectedAnswers);
    //currentquestionindex=currentquestionindex+1;
    //currentquestionindex+=1;
    setState(() {
      currentquestionindex += 1; //increments the value by only  1
    });
  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentquestionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 198, 161, 241),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestions.getShuffled().map((answer) {
              return AnswerButton(
                answerText: answer,
                ontap: (){
                  answerquestion(answer);
                }
              );
            }),

            // AnswerButton(
            //   answerText: currentQuestions.answers[1],
            //   ontap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestions.answers[2],
            //   ontap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestions.answers[3],
            //   ontap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
