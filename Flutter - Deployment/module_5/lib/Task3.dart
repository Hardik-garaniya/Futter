import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider for the list of tasks
final todoListProvider = StateNotifierProvider<TodoListNotifier, List<String>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<String>> {
  TodoListNotifier() : super([]);

  // Add a task to the list
  void addTask(String task) {
    state = [...state, task];
  }

  // Remove a task from the list
  void removeTask(int index) {
    state = state.where((task) => state.indexOf(task) != index).toList();
  }
}


class Task3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('To-Do List'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final task = 'Task ${todoList.length + 1}';
                ref.read(todoListProvider.notifier).addTask(task);
              },
              child: Text('Add Task'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(todoList[index]),
                  onDismissed: (direction) {
                    ref.read(todoListProvider.notifier).removeTask(index);
                  },
                  child: ListTile(
                    title: Text(todoList[index]),
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
