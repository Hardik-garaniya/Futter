import 'package:flutter/material.dart';
import '../api.dart';

class UpdateClientScreen extends StatefulWidget {
  final Map client;

  UpdateClientScreen({required this.client});

  @override
  _UpdateClientScreenState createState() => _UpdateClientScreenState();
}

class _UpdateClientScreenState extends State<UpdateClientScreen> {
  late TextEditingController nameController;
  late TextEditingController contactController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.client['name']);
    contactController = TextEditingController(text: widget.client['contact']);
    emailController = TextEditingController(text: widget.client['email']);
    addressController = TextEditingController(text: widget.client['address']);
  }

  Future<void> updateClient() async {
    if (_formKey.currentState!.validate()) {
      bool success = await ApiService.updateClient(
        widget.client['id'].toString(),
        nameController.text,
        contactController.text,
        emailController.text,
        addressController.text,
      );
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Client updated successfully"), backgroundColor: Colors.green),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update client"), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Client'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Card(
            color: Colors.green,
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Edit Client", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Enter name' : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: contactController,
                      decoration: InputDecoration(labelText: 'Contact', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Enter contact' : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Enter email' : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(labelText: 'Address', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Enter address' : null,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.save),
                        label: Text('Update Client'),
                        onPressed: updateClient,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          textStyle: TextStyle(fontSize: 16),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
