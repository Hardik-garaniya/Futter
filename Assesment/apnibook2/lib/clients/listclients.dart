import 'package:flutter/material.dart';
import '../api.dart';
import 'addclients.dart';
import 'updateclient.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

  Future<void> generateClientPdf(List clients) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Client List', style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 10),
            ...clients.map((client) {
              return pw.Container(
                margin: pw.EdgeInsets.symmetric(vertical: 4),
                child: pw.Text(
                  "Name: ${client['name']} | Contact: ${client['contact']} | Email: ${client['email']}",
                  style: pw.TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
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
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact: ${clients[index]['contact']}", style: TextStyle(color: Colors.white70)),
                  Text("Email: ${clients[index]['email']}", style: TextStyle(color: Colors.white70)),
                  Text("Address: ${clients[index]['address']}", style: TextStyle(color: Colors.white70)),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateClientScreen(client: clients[index]),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.redAccent),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AddClientScreen()));
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'pdf',
            backgroundColor: Colors.red,
            child: Icon(Icons.picture_as_pdf),
            onPressed: () {
              generateClientPdf(clients);
            },
          ),
        ],
      ),
    );
  }
}
