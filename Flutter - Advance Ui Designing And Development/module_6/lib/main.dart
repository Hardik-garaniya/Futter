import 'package:flutter/material.dart';
import 'package:module_6/registration.dart';
import 'feedback.dart';
import 'login.dart';


void main() {
  runApp(MaterialApp(home:MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forms',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/feedback': (context) => FeedbackScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      backgroundColor: Colors.deepPurple,
      ),
      body: Center(
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Go to Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Go to Registration'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/feedback');
              },
              child: Text('Go to Feedback'),
            ),
          ],
        ),
      ),
    )
    );
  }
}
