import 'package:flutter/material.dart';
import 'dbhelper.dart';

void main() {
  runApp(MaterialApp(
    home: NotesScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await DatabaseHelper.instance.fetchNotes();
    setState(() {
      _notes = notes;
    });
  }

  void _addNote() async {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) return;

    final newNote = {
      'title': _titleController.text,
      'content': _contentController.text,
    };

    await DatabaseHelper.instance.insertNote(newNote);
    _titleController.clear();
    _contentController.clear();
    _loadNotes();
  }

  void _deleteNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(labelText: 'Content'),
                  maxLines: 4,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addNote,
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(note['title']),
                    subtitle: Text(note['content']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteNote(note['id']),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
