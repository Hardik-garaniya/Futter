import 'package:flutter/material.dart';
import 'Productsdetailscreen.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'),backgroundColor: Colors.deepPurple,),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product $index'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DetailsScreen()));
            },
          );
        },
      ),
    );
  }
}
