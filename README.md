# Advanced Flutter Basics - Quiz App

## Project Brief

A simple and interactive Flutter quiz application designed to help users learn Flutter fundamentals in an engaging way. The app presents multiple-choice questions about Flutter widgets, state management, and UI building concepts.

## Features

- **Start Screen**: Welcoming interface with quiz logo and start button
- **Question Screen**: Interactive quiz interface with multiple-choice questions
- **Answer Validation**: Instant feedback on correct/incorrect answers
- **Question Progression**: Automatic navigation through quiz questions
- **Shuffled Answers**: Answer options are randomized for each question
- **Beautiful UI**: Gradient background with clean, modern design
- **Custom Widgets**: Reusable `AnswerButton` component

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── quiz.dart                 # Main quiz state management
├── start_screen.dart         # Welcome/start screen
├── question_screen.dart      # Quiz questions interface
├── models/
│   └── QuizQuestions.dart   # Question data model
├── data/
│   └── questions.dart       # Quiz questions data
└── CustomWidget/
    └── answer_button.dart   # Custom answer button widget
```

## Technologies Used

- **Flutter** (SDK: ^3.9.2)
- **Google Fonts** - Custom typography
- **Material Design** - UI components

## Getting Started

1. Ensure you have Flutter installed on your system
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to launch the app

## Dependencies

- `google_fonts: ^6.3.2` - Custom font styling

---

**Note**: This project is part of the Advanced Flutter Learning series, focusing on state management, custom widgets, and interactive UI development.
