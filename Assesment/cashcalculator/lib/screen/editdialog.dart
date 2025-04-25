import 'package:flutter/material.dart';
import '../firebase.dart';
import '../model/cash.dart';

class EditDialog extends StatefulWidget {
  final CashModel model;

  const EditDialog({super.key, required this.model});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController(text: widget.model.description);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black87,
      title: const Text("Edit Record", style: TextStyle(color: Colors.white)),
      content: TextField(
        controller: descriptionController,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          labelText: "Description",
          labelStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            if (descriptionController.text.trim().isNotEmpty) {
              CashModel updatedModel = widget.model.copyWith(
                description: descriptionController.text.trim(),
              );
              await FirebaseService().updateRecord(updatedModel);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Record updated")),
              );
            }
          },
          child: const Text("Update"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
