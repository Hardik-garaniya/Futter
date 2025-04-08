import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation"),
      backgroundColor: Colors.tealAccent,
      ),

      body: Center(
        child: Column(
          children: [

            SizedBox(height: 200,),
            ElevatedButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskOneScreen()));

            }, child: Text("Task 1")),

            SizedBox(height: 50,),


            ElevatedButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskTwoScreen()));

            }, child: Text("Task 2")),

            SizedBox(height: 50,),


            ElevatedButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskThreeScreen()));

            }, child: Text("Task 3"))

          ],
        ),
      ),
    );
  }
}

class TaskOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Practical Tasks'),
      backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: ElevatedButtonWithAnimation(),
      ),
    );
  }
}

class ElevatedButtonWithAnimation extends StatefulWidget {
  @override
  _ElevatedButtonWithAnimationState createState() =>
      _ElevatedButtonWithAnimationState();
}

class _ElevatedButtonWithAnimationState
    extends State<ElevatedButtonWithAnimation> {
  double _buttonSize = 200.0;
  Color _buttonColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _buttonSize = 220.0;
          _buttonColor = Colors.red;
        });
      },
      onTapUp: (_) {
        setState(() {
          _buttonSize = 200.0;
          _buttonColor = Colors.black26;
        });
      },
      onTapCancel: () {
        setState(() {
          _buttonSize = 200.0;
          _buttonColor = Colors.tealAccent;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _buttonSize,
        height: _buttonSize,
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            'Press Me',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TaskTwoScreen extends StatelessWidget {
  final String imageUrl =
      'https://i.pinimg.com/564x/7e/05/da/7e05da43e2f50aa96fc52588e062a20e.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 2: Hero Animation'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskTwoDetailScreen(imageUrl: imageUrl),
              ),
            );
          },
          child: Hero(
            tag: 'hero-image',
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class TaskTwoDetailScreen extends StatelessWidget {
  final String imageUrl;

  TaskTwoDetailScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation Detail'),
      backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Image.network(
            imageUrl,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}

class TaskThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 3: Loading Animation'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: LoadingIndicator(),
      ),
    );
  }
}

class LoadingIndicator extends StatefulWidget {
  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : Text('Data Loaded');
  }
}
