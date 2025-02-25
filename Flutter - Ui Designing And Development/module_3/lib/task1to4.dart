import 'package:flutter/material.dart';
import 'main.dart';

class Task1to4 extends StatefulWidget {
  const Task1to4({super.key});

  @override
  State<Task1to4> createState() => _Task1to4State();
}

class _Task1to4State extends State<Task1to4> {

  int _counter = 0;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _login() {
    print("Email: ${_emailController.text}, Password: ${_passwordController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App - Tasks 1, 2, and 3"),
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, Flutter!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Counter: $_counter',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              'Text 1: Styled with red color, bold, and large font.',
              style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              'Text 2: Styled with blue color, italic, and small font.',
              style: TextStyle(fontSize: 15, color: Colors.blue, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
