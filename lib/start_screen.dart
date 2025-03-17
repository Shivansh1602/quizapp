import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class startScreen extends StatelessWidget {
  const startScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(133, 255, 255, 255),
            ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 30),
          // child:
          const SizedBox(
            height: 80,
          ),
           Text(
            'Learn Flutter the Fun Way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon:const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz', //style: TextStyle(color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}
