import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  static Future<List> getClients() async {
    var url = Uri.parse("https://prakrutitech.buzz/HardikAPI/getclient.php");
    var resp = await http.get(url);
    return jsonDecode(resp.body);

  }

  static Future<bool> addClient(String name, String contact, String email, String address) async {
    final response = await http.post(
      Uri.parse('https://prakrutitech.buzz/HardikAPI/addclient.php'),
      body: {'name': name, 'contact': contact, 'email': email, 'address': address},
    );
    return response.statusCode == 200;
  }

  static Future<bool> updateClient(String id, String name, String contact, String email, String address) async {
    final response = await http.post(
      Uri.parse('https://prakrutitech.buzz/HardikAPI/updateclient.php'),
      body: {'id': id, 'name': name, 'contact': contact, 'email': email, 'address': address},
    );
    return response.statusCode == 200;
  }

  static Future<void> deleteClient(String id, Function refresh) async {
    await http.post(
      Uri.parse('https://prakrutitech.buzz/HardikAPI/deleteclient.php'),
      body: {'id': id, 'confirm': 'Y'},
    );
    refresh();
  }

  static Future<bool> addTransaction(double amount, String transactionType) async {
    final response = await http.post(
      Uri.parse('https://prakrutitech.buzz/HardikAPI/addtransaction.php'),
      body: {
        'amount': amount.toDouble(),
        'transaction_type': transactionType,
      },
    );
    return response.statusCode == 200;
  }

  static Future<List> getTransactions() async {
    final response = await http.get(Uri.parse('https://prakrutitech.buzz/HardikAPI/gettransaction.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  static Future<void> deleteTransaction(String id, Function refresh) async {
    await http.post(
      Uri.parse(''),
      body: {'id': id, 'confirm': 'Y'},
    );
    refresh();
  }

  static Future<bool> addStock(String itemName, int quantity, double price) async {
    final response = await http.post(
      Uri.parse('https://prakrutitech.buzz/HardikAPI/addstock.php'),
      body: {
        'item_name': itemName,
        'quantity': quantity.toString(),
        'price': price.toString(),
      },
    );
    return response.statusCode == 200;
  }

  static Future<List> getStocks() async {
    final response = await http.get(Uri.parse("https://prakrutitech.buzz/HardikAPI/getstock.php"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  static Future<void> deleteStock(String id, Function refresh) async {
    await http.post(
      Uri.parse('https://prakrutitech.buzz/HardikAPI/deletestock.php'),
      body: {'id': id, 'confirm': 'Y'},
    );
    refresh();
  }
}
