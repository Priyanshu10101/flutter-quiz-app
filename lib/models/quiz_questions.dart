class QuizQuestion {
  const QuizQuestion(this.questionText, this.answersText);

  final String questionText;
  final List<String> answersText;

  List<String> getShuffledAnswers(){
    List<String> shuffledList = List.of(answersText);
    shuffledList.shuffle();
    return shuffledList;
  }
}
