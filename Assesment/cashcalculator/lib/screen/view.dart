import 'package:flutter/material.dart';
import '../firebase.dart';
import '../model/cash.dart';
import 'editdialog.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CashModel>>(
      stream: FirebaseService().getRecords(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No records found", style: TextStyle(color: Colors.white70)),
          );
        }

        final records = snapshot.data!;
        return ListView.builder(
          itemCount: records.length,
          itemBuilder: (context, index) {
            final model = records[index];
            return Card(
              color: Colors.grey[900],
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ListTile(
                title: Text(model.description, style: const TextStyle(color: Colors.white)),
                subtitle: Text("₹${model.total} • ${model.date} • ${model.time}", style: const TextStyle(color: Colors.white70)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orangeAccent),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => EditDialog(model: model),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.black,
                            title: const Text("Delete Record?", style: TextStyle(color: Colors.white)),
                            content: const Text("Are you sure you want to delete this record?", style: TextStyle(color: Colors.white70)),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text("No", style: TextStyle(color: Colors.grey)),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text("Yes", style: TextStyle(color: Colors.redAccent)),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          await FirebaseService().deleteRecord(model.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Record deleted")),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
