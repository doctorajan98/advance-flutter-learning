import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/score_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    if (selectedAnswers.length >= questions.length) {
      return; // Already answered all questions, don't process more
    }
    
    setState(() {
      selectedAnswers.add(answer);

      if (selectedAnswers.length >= questions.length) {
        activeScreen = 'score-screen';
      }
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    final currentQuestionIndex = selectedAnswers.length;

    if (activeScreen == 'question-screen' && currentQuestionIndex < questions.length) {
      screenWidget = QuestionScreen(
        onAnswerSelected: chooseAnswer,
        currentQuestionIndex: currentQuestionIndex,
      );
    }

    if (activeScreen == 'score-screen' || currentQuestionIndex >= questions.length) {
      screenWidget = ScoreScreen(
        answeredQuestions: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 140, 255),
                Color.fromARGB(255, 0, 93, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}