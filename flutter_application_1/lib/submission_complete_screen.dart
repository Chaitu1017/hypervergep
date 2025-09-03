import 'package:flutter/material.dart';

class SubmissionCompleteScreen extends StatelessWidget {
  final Map<String, String> answers;

  const SubmissionCompleteScreen({required this.answers, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Application Submitted')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100.0,
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank you! Your application has been submitted.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // You can optionally display the collected answers here for confirmation
            // Text('Collected Answers: $answers'),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home screen
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Go back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
