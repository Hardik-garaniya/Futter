import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.lightBlueAccent,
          alignment: Alignment.center, 
          child: Text(
            'Hello, World! My name is Hardik Garaniya.',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arial',
            ),
          ),
        ),
      ),
    );
  }
}
