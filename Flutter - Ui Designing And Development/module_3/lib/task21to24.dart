import 'package:flutter/material.dart';

import 'main.dart';

class Task21to24 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Task21to24> {
  int _selectedIndex = 0;
  String _data = '';

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('News Content', style: TextStyle(fontSize: 24))),
    Center(child: Text('Messages Content', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Content', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToDetailsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(data: 'This is the details screen data!'),
      ),
    );
  }

  void _onDrawerItemTapped(int index) {
    Navigator.pop(context); // Close the drawer
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Task 21 To 24'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
            },
          ),
          backgroundColor: Colors.grey,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(child: Text('Menu')),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  _onDrawerItemTapped(0);
                },
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  _onDrawerItemTapped(2);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  _onDrawerItemTapped(1);
                },
              ),
            ],
          ),
        ),
        body: _selectedIndex == 0
            ? HomeScreen(onNavigateToDetails: _navigateToDetailsScreen)
            : _selectedIndex == 1
            ? SettingsScreen()
            : _selectedIndex == 2
            ? ProfileScreen()
            : _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fiber_new),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function onNavigateToDetails;

  HomeScreen({required this.onNavigateToDetails});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
            child: Text('Go to Welcome Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              onNavigateToDetails();
            },
            child: Text('Go to Details Screen'),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Screen')),
      body: Center(
        child: Text(
          'Welcome to the second screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String data;

  DetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen')),
      body: Center(
        child: Text(data, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings Screen')),
      body: Center(
        child: Text('Settings', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Screen')),
      body: Center(
        child: Text('Profile Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
