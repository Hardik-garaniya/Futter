import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreferencesApp extends StatefulWidget {
  @override
  _UserPreferencesAppState createState() => _UserPreferencesAppState();
}

class _UserPreferencesAppState extends State<UserPreferencesApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadUserPreferences();
  }

  _loadUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  _saveUserPreferences(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text("User Preferences App"),
        backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: SwitchListTile(
            title: Text("Dark Mode"),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
              _saveUserPreferences(value);
            },
          ),
        ),
      ),
    );
  }
}
