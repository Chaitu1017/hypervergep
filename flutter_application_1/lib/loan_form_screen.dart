import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'submission_complete_screen.dart'; // Import the new screen

class LoanFormScreen extends StatefulWidget {
  const LoanFormScreen({super.key});

  @override
  _LoanFormScreenState createState() => _LoanFormScreenState();
}

class _LoanFormScreenState extends State<LoanFormScreen> {
  final List<String> _questions = [
    'What is your full name?',
    'What is your profession?',
    'What is your monthly income?',
    'What is your desired loan amount?',
  ];

  int _currentQuestionIndex = 0;
  final TextEditingController _answerController = TextEditingController();
  final Map<String, String> _userAnswers = {};

  void _submitAnswer() {
    // Add the current question and answer to the map
    _userAnswers[_questions[_currentQuestionIndex]] = _answerController.text;

    // Check if there are more questions
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _answerController.clear();
        _currentQuestionIndex++;
      });
    } else {
      // All questions have been answered.
      _showCompletionScreen();
    }
  }

  void _showCompletionScreen() async {
    // Send the data to your backend
    var url = Uri.parse('http://127.0.0.1:5000/underwrite');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(_userAnswers),
    );

    print('Backend Response Status: ${response.statusCode}');
    print('Backend Response Body: ${response.body}');

    // Then navigate to the completion screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubmissionCompleteScreen(answers: _userAnswers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loan Application')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // The current question
            Text(
              _questions[_currentQuestionIndex],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // User input field
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your answer',
              ),
            ),
            const SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: _submitAnswer,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
