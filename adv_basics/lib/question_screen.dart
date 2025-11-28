import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/CustomWidget/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void onQuestionAnswered(){
    setState(() {
      currentQuestionIndex++;

      if (currentQuestionIndex >= questions.length) {
        currentQuestionIndex = 0; // set back to first question
      }
    });
  }

  void checkAnswer(String answer){
    if (answer == questions[currentQuestionIndex].answers[0]) {
      onQuestionAnswered();
    }
    else {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text('Wrong answer'),
        content: Text('The correct answer is ${questions[currentQuestionIndex].answers[0]}'),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, 
          child: Text('OK'))
        ],
      ));
    }
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
  final currentQuestion = questions[currentQuestionIndex];

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
                checkAnswer(answer); 
              });
            }),
          ],
        ),
      ),
    );
  }
}