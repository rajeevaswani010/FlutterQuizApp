import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final String text;
  final Map<String,String> options;
  final String? selectedAnswer;
  final ValueChanged<String?> onChanged;

  QuestionWidget({ 
    required this.text,
    required this.options,
    required this.selectedAnswer, 
    required this.onChanged
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Card elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200, // Fixed height for upper part
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  this.widget.text,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Avoid unnecessary space
              children: widget.options.entries.map((entry) {
                return RadioListTile(
                  title: Text(entry.value),
                  value: entry.key, 
                  groupValue: widget.selectedAnswer, 
                  onChanged: widget.onChanged
                );
              }).toList(),
           ),
          ),
        ],
      ),
    );    
  }
}