import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/CustomWidget/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswerSelected, required this.currentQuestionIndex});

  final void Function(String answer) onAnswerSelected;
  final int currentQuestionIndex;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  void onQuestionAnswered(String selectedAnswer){
    widget.onAnswerSelected(selectedAnswer);
  }

  @override 
  Widget build(BuildContext context) {
    // Check if index is out of bounds
    if (widget.currentQuestionIndex >= questions.length || widget.currentQuestionIndex < 0) {
      return const SizedBox.shrink();
    }
    
    final currentQuestion = questions[widget.currentQuestionIndex];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                currentQuestion.questionText,
                style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            ...currentQuestion.getshuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: () {
                onQuestionAnswered(answer); 
              });
            }),
          ],
        ),
      ),
    );
  }
}