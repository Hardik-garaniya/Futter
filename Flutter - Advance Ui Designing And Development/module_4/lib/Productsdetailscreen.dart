import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen'),backgroundColor: Colors.deepPurple,),
      body: Center(
        child: Text('Product Details Here'),
      ),
    );
  }
}
