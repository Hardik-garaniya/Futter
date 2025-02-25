import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _feedbackType;
  List<bool> _selectedOptions = [false, false, false];
  final TextEditingController _commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Feedback'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _feedbackType,
                onChanged: (newValue) {
                  setState(() {
                    _feedbackType = newValue;
                  });
                },
                decoration: InputDecoration(labelText: 'Feedback Type'),
                items: ['Bug', 'Suggestion', 'Compliment']
                    .map((label) => DropdownMenuItem(
                  value: label,
                  child: Text(label),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a feedback type';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: _selectedOptions[0],
                    onChanged: (value) {
                      setState(() {
                        _selectedOptions[0] = value!;
                      });
                    },
                  ),
                  Text('Option 1'),
                  Checkbox(
                    value: _selectedOptions[1],
                    onChanged: (value) {
                      setState(() {
                        _selectedOptions[1] = value!;
                      });
                    },
                  ),
                  Text('Option 2'),
                  Checkbox(
                    value: _selectedOptions[2],
                    onChanged: (value) {
                      setState(() {
                        _selectedOptions[2] = value!;
                      });
                    },
                  ),
                  Text('Option 3'),
                ],
              ),
              TextFormField(
                controller: _commentsController,
                decoration: InputDecoration(labelText: 'Comments'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your comments';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle the feedback submission here
                    print('Feedback submitted');
                  }
                },
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
