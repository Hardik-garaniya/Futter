import 'package:flutter/material.dart';
import 'main.dart';

class RatingWidget extends StatefulWidget {
  final int initialRating;
  final Function(int) onRatingChanged;

  RatingWidget({this.initialRating = 0, required this.onRatingChanged});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int rating = 0;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
         return IconButton(
          icon: Icon(
            Icons.star,
            color: index < rating ? Colors.yellow : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              rating = index + 1;
            });
            widget.onRatingChanged(rating);
          },
        );
      }),
    );
  }
}

class ProgressBarWidget extends StatelessWidget {
  final double percentage;

  ProgressBarWidget({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${(percentage * 100).toStringAsFixed(0)}% Completed"),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: percentage,
          backgroundColor: Colors.grey[300],
          color: Colors.blue,
        ),
      ],
    );
  }
}

class ProfileCardWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String bio;

  ProfileCardWidget({required this.name, required this.imageUrl, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(bio, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarBadgeWidget extends StatelessWidget {
  final String avatarUrl;
  final bool isOnline;

  AvatarBadgeWidget({required this.avatarUrl, this.isOnline = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: isOnline ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Info
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              AvatarBadgeWidget(
                avatarUrl: 'https://static.vecteezy.com/system/resources/thumbnails/041/731/093/small_2x/login-icon-vector.jpg',
                isOnline: true,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hardik Garaniya", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RatingWidget(
            initialRating: 4,
            onRatingChanged: (rating) {
              print("User rated: $rating");
            },
          ),
        ),

        // Bio
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Hello! I'm John, a passionate Flutter developer with a love for building beautiful and performant mobile apps.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProgressBarWidget(percentage: 0.75),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProductCard(
                productName: "Product 1",
                price: 19.99,
                imageUrl: "https://cdn.vectorstock.com/i/1000v/92/80/simple-flower-vector-12639280.jpg",
              ),
              ProductCard(
                productName: "Product 2",
                price: 29.99,
                imageUrl: "https://cdn.vectorstock.com/i/1000v/92/80/simple-flower-vector-12639280.jpg",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final String imageUrl;

  ProductCard({required this.productName, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Image.network(imageUrl, width: 40, height: 40),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: TextStyle(fontSize: 18)),
                Text("\$${price.toStringAsFixed(2)}", style: TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  CustomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}

class Task41to44 extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<Task41to44> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Task 41 To 44'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
            },
          ),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ProfileScreen(),
                SizedBox(height: 20),
                CustomButton(
                  label: "Click Me",
                  onPressed: () {
                    print("Button clicked!");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
