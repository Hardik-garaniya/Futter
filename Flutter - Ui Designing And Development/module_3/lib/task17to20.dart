import 'package:flutter/material.dart';

import 'main.dart';



class Task17to20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task17to20',  // App name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  List<bool> _taskCompletion = [];

  final _registrationFormKey = GlobalKey<FormState>();
  String _name = '', _email = '', _password = '', _phoneNumber = '';

  final TextEditingController _feedbackNameController = TextEditingController();
  final TextEditingController _feedbackCommentsController = TextEditingController();
  String _selectedCategory = 'General';

  final TextEditingController _searchController = TextEditingController();
  final List<String> _suggestions = ['apple', 'banana', 'grapes', 'orange', 'mango'];
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _filteredSuggestions = _suggestions;
  }
  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_taskController.text);
        _taskCompletion.add(false);
        _taskController.clear();
      });
    }
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _taskCompletion[index] = !_taskCompletion[index];
    });
  }

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = _suggestions.where((suggestion) {
        return suggestion.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _submitFeedback() {
    final feedbackName = _feedbackNameController.text;
    final feedbackComments = _feedbackCommentsController.text;
    final feedbackCategory = _selectedCategory;
    print("Feedback submitted:\nName: $feedbackName\nComments: $feedbackComments\nCategory: $feedbackCategory");
    _feedbackNameController.clear();
    _feedbackCommentsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Task 17 To 20'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
      },
    ),
        backgroundColor: Colors.grey,
      ),
      // App name

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _registrationFormKey,
                child: Column(
                  children: [
                    Text('Registration Form', style: TextStyle(fontSize: 24)),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onSaved: (value) => _name = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (value) => _email = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty || !_isValidEmail(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onSaved: (value) => _password = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty || !_isValidPassword(value)) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                      onSaved: (value) => _phoneNumber = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length != 10) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_registrationFormKey.currentState!.validate()) {
                          _registrationFormKey.currentState!.save();
                          print('Registration Success: $_name, $_email, $_phoneNumber');
                        }
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Feedback Form', style: TextStyle(fontSize: 24)),
                  TextField(
                    controller: _feedbackNameController,
                    decoration: InputDecoration(labelText: 'Your Name'),
                  ),
                  TextField(
                    controller: _feedbackCommentsController,
                    decoration: InputDecoration(labelText: 'Comments'),
                  ),
                  DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                    items: <String>['General', 'Bug Report', 'Suggestion']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                    onPressed: _submitFeedback,
                    child: Text('Submit Feedback'),
                  ),
                ],
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Search Bar', style: TextStyle(fontSize: 24)),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(hintText: 'Search fruits...'),
                    onChanged: _filterSuggestions,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredSuggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredSuggestions[index]),
                      );
                    },
                  ),
                ],
              ),
            ),

            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Task Manager', style: TextStyle(fontSize: 24)),
                  TextField(
                    controller: _taskController,
                    decoration: InputDecoration(hintText: 'Enter a new task'),
                  ),
                  ElevatedButton(
                    onPressed: _addTask,
                    child: Text('Add Task'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(_tasks[index]),
                        value: _taskCompletion[index],
                        onChanged: (bool? value) {
                          _toggleTaskCompletion(index);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
