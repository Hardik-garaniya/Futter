import 'package:flutter/material.dart';
import 'package:module_3/task13to16.dart';
import 'package:module_3/task17to20.dart';
import 'package:module_3/task1to4.dart';
import 'package:module_3/task21to24.dart';
import 'package:module_3/task25to28.dart';
import 'package:module_3/task29to32.dart';
import 'package:module_3/task33to36.dart';
import 'package:module_3/task37to40.dart';
import 'package:module_3/task41to44.dart';
import 'package:module_3/task5to8.dart';
import 'package:module_3/task9to12.dart';

void main() {
  runApp(MaterialApp(home: SplashScreen())); // Start with the SplashScreen
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // This method waits for 3 seconds and navigates to the next screen (MainApp)
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => myapp()), // Navigate to MainApp screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/assignment.jpg', // Replace with your image URL
              width: 200, // Set the width of the image
              height: 200, // Set the height of the image
              fit: BoxFit.cover, // This ensures the image is resized to fit the box
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Module - 3"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 1 to 4", Task1to4()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 5 to 8", Task5to8()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 9 to 12", Task9to12()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 13 to 16", Task13to16()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 17 to 20", Task17to20()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 21 to 24", Task21to24()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 25 to 28", Task25to28()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 29 to 32", Task29to32()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 33 to 36", Task33to36()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 37 to 40", Task37to40()),
              SizedBox(height: 20),
              _buildStyledButton(context, "Task 41 to 44", Task41to44()),
            ],
          ),
        ),
      ),
    );
  }

  // Custom method to create a styled button
  Widget _buildStyledButton(BuildContext context, String label, Widget destinationPage) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey), // Button background color
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 30)), // Button padding
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        )),
        elevation: MaterialStateProperty.all(10), // Button shadow
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Text color
        ),
      ),
    );
  }
}
