import 'package:flutter/material.dart';
import '../api.dart';
import 'addtra.dart';

class TransactionListScreen extends StatefulWidget {
  @override
  _TransactionListScreenState createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  List transactions = [];

  Future<void> fetchTransactions() async {
    transactions = await ApiService.getTransactions();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Book'),
        backgroundColor: Colors.grey,
      ),
      body: transactions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final txn = transactions[index];
          final isPaid = txn['transaction_type'] == 'paid';

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: isPaid ? Colors.red[100] : Colors.green[100],
                child: Icon(
                  isPaid ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPaid ? Colors.red : Colors.green,
                ),
              ),
              title: Text(
                '₹${txn['amount']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isPaid ? Colors.red : Colors.green,
                ),
              ),
              subtitle: Text(
                '${txn['transaction_type'].toString().toUpperCase()} on ${txn['date']}',
                style: TextStyle(fontSize: 14),
              ),

            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTransactionScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
