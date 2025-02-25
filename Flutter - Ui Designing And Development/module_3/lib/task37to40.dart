import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];
  double _totalPrice = 0.0;

  List<Map<String, dynamic>> get items => _items;
  double get totalPrice => _totalPrice;

  void addItem(Map<String, dynamic> item) {
    _items.add(item);
    _totalPrice += item['price'];
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    _totalPrice -= item['price'];
    notifyListeners();
  }
}

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class AuthModel extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void logIn() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logOut() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

class Task37to40 extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<Task37to40> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => AuthModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: Scaffold(
              appBar: AppBar(title: Text('Flutter Task 37 To 40'),
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<CounterModel>(
                        builder: (context, counterModel, child) {
                          return Column(
                            children: [
                              Text('Counter: ${counterModel.counter}', style: TextStyle(fontSize: 24)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => counterModel.increment(),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () => counterModel.decrement(),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<CartModel>(
                        builder: (context, cartModel, child) {
                          return Column(
                            children: [
                              Text('Shopping Cart:', style: TextStyle(fontSize: 24)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: cartModel.items.length,
                                itemBuilder: (context, index) {
                                  var item = cartModel.items[index];
                                  return ListTile(
                                    title: Text(item['name']),
                                    subtitle: Text('\$${item['price']}'),
                                    trailing: IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => cartModel.removeItem(item),
                                    ),
                                  );
                                },
                              ),
                              Text('Total: \$${cartModel.totalPrice}', style: TextStyle(fontSize: 20)),
                              ElevatedButton(
                                onPressed: () {
                                  cartModel.addItem({'name': 'Item ${cartModel.items.length + 1}', 'price': 10.0});
                                },
                                child: Text('Add Item'),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<ThemeModel>(
                        builder: (context, themeModel, child) {
                          return ElevatedButton(
                            onPressed: () => themeModel.toggleTheme(),
                            child: Text('Toggle Theme'),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Consumer<AuthModel>(
                        builder: (context, authModel, child) {
                          return Column(
                            children: [
                              if (authModel.isLoggedIn)
                                ElevatedButton(
                                  onPressed: () => authModel.logOut(),
                                  child: Text('Logout'),
                                )
                              else
                                ElevatedButton(
                                  onPressed: () => authModel.logIn(),
                                  child: Text('Login'),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
