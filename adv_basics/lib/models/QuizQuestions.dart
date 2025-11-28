class QuizQuestions {
  const QuizQuestions(this.questionText, this.answers);

  final String questionText;
  final List<String> answers;

  List<String> getshuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    return shuffledList;
  }
}