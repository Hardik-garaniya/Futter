import 'package:flutter/material.dart';
import 'Homescreen.dart';
import 'Productlistscreen.dart';
import 'Profilescreen.dart';
import 'Settingscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  // List of pages to be used for bottom navigation bar
  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Navigation App'),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Navigation Drawer'),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              ListTile(
                title: Text('Product List'),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => ProductListScreen()));
                },
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                },
              ),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
