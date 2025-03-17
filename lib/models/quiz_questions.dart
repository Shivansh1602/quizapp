class QuizQuestions {

  const QuizQuestions(this.text,this.answers);
  
  final String text;
  final List<String> answers;

  List<String> getShuffled(){
    //List.of(answers).shuffle(); this is called chaining 
   final shuffledlist= List.of(answers);
   shuffledlist.shuffle();
   return shuffledlist;
  }

}