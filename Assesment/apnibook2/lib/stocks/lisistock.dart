import 'package:flutter/material.dart';
import '../api.dart';
import 'addstock.dart';

class StockListScreen extends StatefulWidget {
  @override
  _StockListScreenState createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  List stocks = [];

  Future<void> fetchStocks() async {
    stocks = await ApiService.getStocks();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Book'),
        backgroundColor: Colors.grey,
      ),
      body: stocks.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          final stock = stocks[index];

          return Card(
            color: Colors.green,
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: CircleAvatar(
                backgroundColor: Colors.teal[100],
                child: Icon(Icons.inventory_2_outlined, color: Colors.grey),
              ),
              title: Text(
                stock['item_name'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                'Quantity: ${stock['quantity']}   •   ₹${stock['price']}',
                style: TextStyle(fontSize: 14),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => ApiService.deleteStock(
                  stock['id'].toString(),
                  fetchStocks,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddStockScreen()),
        ),
      ),
    );
  }
}
