import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Cart Model
class Cart with ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  // Add item to cart
  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  // Clear the cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}


class Task2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Shopping Cart',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CartScreen(),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          // Add Item Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final cart = Provider.of<Cart>(context, listen: false);
                cart.addItem('Item ${cart.items.length + 1}');
              },
              child: Text('Add Item'),
            ),
          ),
          // View Cart Items
          Expanded(
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                return ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cart.items[index]),
                    );
                  },
                );
              },
            ),
          ),
          // Clear Cart Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final cart = Provider.of<Cart>(context, listen: false);
                cart.clearCart();
              },
              child: Text('Clear Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
