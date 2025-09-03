import 'package:flutter/material.dart';
import 'loan_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // This MaterialApp is the top-level widget
      title: 'Loan App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:
          const WelcomeScreen(), // The home should be your first screen widget
    );
  }
}

// Create a new widget for the welcome screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The Scaffold is now inside your first screen widget
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello! Let\'s get you a loan.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // This will now work because the button's context is a child of MaterialApp
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoanFormScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
              ),
              child: const Text('Start Now', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
