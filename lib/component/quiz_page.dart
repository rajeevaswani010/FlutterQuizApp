import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizapp/component/question_widget.dart';
import 'package:quizapp/main.dart';
import 'package:quizapp/model/quiz_model.dart';

class QuizPage extends StatefulWidget {

_QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{
  QuizModel? _quizModel;
  Map<int, String?> _selectedAnswers = {}; // Store selected answers per question
  int score = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  //load data now
  Future<void> _loadData() async {
    //load the json file from assets
    String jsonString = await rootBundle.loadString('quiz.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    setState(() {
      _quizModel = QuizModel.fromJson(jsonData);
    });

  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Score"),
          content: Text(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_quizModel == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: CircularProgressIndicator()), // Loading indicator
      );
    } 

    return Scaffold(
      appBar: AppBar(title: Text(_quizModel!.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children:[ Column(
            children: _quizModel!.quiz.asMap().entries.map((entry) {
              int index = entry.key;
              Question question = entry.value;
          
              return QuestionWidget(
                text: question.question,
                selectedAnswer: _selectedAnswers[index],
                options: question.options,              
                onChanged: (String? value) {
                  setState(() {
                    _selectedAnswers[index] = value; // Update selected answer
                    print(_selectedAnswers[index] == _quizModel?.quiz[index].answer);
                  });
                },
              );
            }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                _showInfoDialog(context);
              }, 
              child: Text("Submit")
            ),
          ]
          ),
        ),
      )
    ;

  }  
}

class QuizScore extends StatelessWidget {

  QuizModel? _quizModel;
  Map<String, int>? answers;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}