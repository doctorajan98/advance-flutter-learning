import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/data/questions.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    super.key,
    required this.answeredQuestions,
    required this.onRestart,
  });

  final List<String> answeredQuestions;
  final void Function() onRestart;

  int getCorrectAnswersCount() {
    int correctCount = 0;
    for (int i = 0; i < questions.length && i < answeredQuestions.length; i++) {
      // The first answer in the answers list is the correct one
      if (answeredQuestions[i] == questions[i].answers[0]) {
        correctCount++;
      }
    }
    return correctCount;
  }

  @override
  Widget build(BuildContext context) {
    final correctCount = getCorrectAnswersCount();
    final totalQuestions = questions.length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                'Quiz Complete!',
                style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'You answered $correctCount out of $totalQuestions questions correctly!',
                style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final userAnswer = index < answeredQuestions.length
                      ? answeredQuestions[index]
                      : 'Not answered';
                  final correctAnswer = question.answers[0];
                  final isCorrect = userAnswer == correctAnswer;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? Colors.green.withOpacity(0.3)
                          : Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isCorrect ? Colors.green : Colors.red,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isCorrect ? Icons.check_circle : Icons.cancel,
                              color: isCorrect ? Colors.green : Colors.red,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Question ${index + 1}',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          question.questionText,
                          style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Your answer: $userAnswer',
                          style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        if (!isCorrect)
                          Text(
                            'Correct answer: $correctAnswer',
                            style: TextStyle(
                              fontFamily: GoogleFonts.lato().fontFamily,
                              color: Colors.green.shade200,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 0, 140, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
