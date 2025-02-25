import 'package:flutter/material.dart';
import 'main.dart';


class Task29to32 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stack Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Task 29 To 32'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
            },
          ),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StackOverlay(),

              SizedBox(height: 20),

              ProfilePage(),

              SizedBox(height: 20),

              CardWithFAB(),

              SizedBox(height: 20),

              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class StackOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          'https://images.pexels.com/photos/265216/pexels-photo-265216.jpeg?cs=srgb&dl=pexels-pixabay-265216.jpg&fm=jpg',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
          width: double.infinity,
          height: 200,

          child: Center(
            child: Text(
              'Overlay Text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          'https://images.pexels.com/photos/265216/pexels-photo-265216.jpeg?cs=srgb&dl=pexels-pixabay-265216.jpg&fm=jpg',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 20,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://images.scalebranding.com/old-man-logo-50204097-38e6-4b2f-8a90-74d550b9fee5.jpg'),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            children: [
              Text(
                'Hardik Garaniya',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardWithFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 55),
          child: Padding(
            padding: const EdgeInsets.all(70.0),
            child: Column(
              children: [
                Text(
                  'Hardik Garaniya',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

              ],
            ),
          ),
        ),
        Positioned(
          right: 60,
          bottom: 5,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('Click Me'),
        ),
        Positioned(
          top: 0,
          child: Icon(
            Icons.star,
            size: 30,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
