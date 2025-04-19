import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  String transactionType = 'paid'; // Default value
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

   Future<bool> addTransaction(double amount, String transactionType) async {
    final response = await http.post(
      Uri.parse('https://prakrutitech.buzz/HardikAPI/addtransaction.php'),
      body: {
        'amount': amount.toString(),
        'transaction_type': transactionType,
      },
    );
    return response.statusCode == 200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Transaction'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Card(
            color: Colors.green, // Light blue background
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Add Transaction", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.isEmpty || double.tryParse(value) == null
                          ? 'Enter valid amount'
                          : null,
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: transactionType,
                      decoration: InputDecoration(
                        labelText: 'Transaction Type',
                        prefixIcon: Icon(Icons.swap_horiz),
                        border: OutlineInputBorder(),
                      ),
                      items: ['paid', 'received'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (newValue) => setState(() => transactionType = newValue!),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date: ${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 16)),
                        ElevatedButton.icon(
                          onPressed: () => selectDate(context),
                          icon: Icon(Icons.calendar_today),
                          label: Text("Select Date"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            double amount = double.tryParse(amountController.text) ?? 0.0;

                            bool success = await addTransaction(amount, transactionType);

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Transaction added successfully!'), backgroundColor: Colors.green),
                              );
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to add transaction!'), backgroundColor: Colors.red),
                              );
                            }
                          }
                        },

                        icon: Icon(Icons.save),
                        label: Text('Save Transaction'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
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
