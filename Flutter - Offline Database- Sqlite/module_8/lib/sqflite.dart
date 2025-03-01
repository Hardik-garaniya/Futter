import 'package:flutter/material.dart';
import 'dbhelper.dart';

void main() {
  runApp(MaterialApp(
    home: TaskListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = [];
    _loadTasks();
  }

  void _loadTasks() async {
    final tasks = await DBHelper.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  void _addTask() {
    final task = Task(title: 'New Task', description: 'Task description');
    DBHelper.insertTask(task).then((value) {
      _loadTasks();
    });
  }

  // Update an existing task
  void _updateTask(Task task) {
    final TextEditingController titleController = TextEditingController(text: task.title);
    final TextEditingController descriptionController = TextEditingController(text: task.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Task Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: 'Task Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedTask = Task(
                  id: task.id,
                  title: titleController.text,
                  description: descriptionController.text,
                );
                DBHelper.updateTask(updatedTask).then((value) {
                  _loadTasks();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Delete a task
  void _deleteTask(int id) {
    DBHelper.deleteTask(id).then((value) {
      _loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _updateTask(task),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTask(task.id!),
                ),
              ],
            ),
            onTap: () => _updateTask(task),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
    );
  }
}

