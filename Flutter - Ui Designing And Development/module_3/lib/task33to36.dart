import 'package:flutter/material.dart';

import 'main.dart';


class Task33to36 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationHomePage(),
    );
  }
}

class AnimationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Task 33 To 36"),
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
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeInImageExample();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(position: offsetAnimation, child: child);
                    },
                  ),
                );
              },
              child: Text("Go to Fade-In Image Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedContainerExample(),
                  ),
                );
              },
              child: Text("Go to Animated Container Example"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PulsingButtonExample(),
                  ),
                );
              },
              child: Text("Go to Pulsing Button Example"),
            ),
          ],
        ),
      ),
    );
  }
}

class FadeInImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fade-In Image Example"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
          },
        ),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/flower1.jpg',
          image: 'https://plus.unsplash.com/premium_photo-1676070096487-32dd955e09e0?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YnJpZ2h0JTIwZmxvd2Vyc3xlbnwwfHwwfHx8MA%3D%3D', // Network image URL
          fadeInDuration: Duration(seconds: 2),
        ),
      ),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Container Example")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? 'Collapse' : 'Expand'),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _isExpanded ? 300 : 100,
              height: _isExpanded ? 200 : 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  _isExpanded ? 'Expanded' : 'Collapsed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PulsingButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pulsing Button Example")),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1.0, end: 1.2),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return ElevatedButton(
              onPressed: () {},
              child: Text('Press Me'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200 * value, 60 * value), // Animate the size
              ),
            );
          },
        ),
      ),
    );
  }
}

class SlideTransitionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slide Transition Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return SecondScreen();
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(position: offsetAnimation, child: child);
              },
            ));
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(child: Text('This is the second screen')),
    );
  }
}
