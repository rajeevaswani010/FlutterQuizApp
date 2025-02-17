import 'dart:convert';

//Model for quiz..
class QuizModel {
  String title;
  List<Question> quiz;

  QuizModel({required this.title, required this.quiz});

  factory QuizModel.fromJson(Map<String, dynamic> json){
    return QuizModel(
      title: json['title'],
      quiz: (json['quiz'] as List).map((q) => Question.fromJson(q)).toList(),
    );
  }
}

// Model for Question
class Question {
  String question;
  Map<String, String> options;
  String answer;

  Question({required this.question, required this.options, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: Map<String, String>.from(json['options']),
      answer: json['answer'],
    );
  }
}