import 'package:flutter/material.dart';
import '../api.dart';
import 'addclients.dart';
import 'package:apnibook2/clients/updateclient.dart';

class ClientListScreen extends StatefulWidget {
  @override
  _ClientListScreenState createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  List clients = [];

  Future<void> fetchClients() async {
    clients = await ApiService.getClients();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Book'),
        backgroundColor: Colors.grey,
      ),
      body: clients.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.green,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              title: Text(
                clients[index]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact: ${clients[index]['contact']}"),
                  Text("Email: ${clients[index]['email']}"),
                  Text("Address: ${clients[index]['address']}"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateClientScreen(client: clients[index]),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => ApiService.deleteClient(
                      clients[index]['id'].toString(),
                      fetchClients,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddClientScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
