import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'Task2.dart';
import 'Task3.dart';
import 'Task1.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Navigation'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to Task 1
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Task1()),
                );
              },
              child: Text('Task 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Task 2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Task2()),
                );
              },
              child: Text('Task 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Task 3
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Task3()),
                );
              },
              child: Text('Task 3'),
            ),
          ],
        ),
      ),
    );
  }
}
