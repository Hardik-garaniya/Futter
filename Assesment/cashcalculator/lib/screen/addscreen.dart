import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../firebase.dart';
import '../model/cash.dart';

class CalculatorTab extends StatefulWidget {

  @override
  State<CalculatorTab> createState() => _CalculatorTabState();
}

class _CalculatorTabState extends State<CalculatorTab> {
  final List<int> denominations = [2000, 500, 200, 100, 50, 20, 10, 5];
  final Map<int, TextEditingController> controllers = {};
  final TextEditingController descriptionController = TextEditingController();

  int total = 0;
  int noteCount = 0;
  String breakdown = "";

  @override
  void initState() {
    super.initState();
    for (var d in denominations) {
      controllers[d] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    descriptionController.dispose();
    super.dispose();
  }

  void calculateTotal() {
    total = 0;
    noteCount = 0;
    breakdown = "";

    for (var d in denominations) {
      int count = int.tryParse(controllers[d]!.text) ?? 0;
      if (count > 0) {
        total += d * count;
        noteCount += count;
        breakdown += "$d x $count = ${d * count}\n";
      }
    }
    setState(() {});
  }

  void clearAll() {
    for (var controller in controllers.values) {
      controller.clear();
    }
    descriptionController.clear();
    total = 0;
    noteCount = 0;
    breakdown = "";
    setState(() {});
  }

  void saveToFirebase() async {
    if (descriptionController.text.trim().isEmpty || total == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Please enter description and amount")),
      );
      return;
    }

    final now = DateTime.now();
    final model = CashModel(
      id: now.millisecondsSinceEpoch.toString(),
      description: descriptionController.text.trim(),
      total: total,
      noteCount: noteCount,
      breakdown: breakdown.trim(),
      date: DateFormat('dd MMM yyyy').format(now),
      time: DateFormat('hh:mm a').format(now),
    );

    await FirebaseService().addRecord(model);

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text("Record added!")),
    );

    clearAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: descriptionController,
                style: TextStyle(color: Colors.white),
                decoration:  InputDecoration(
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
               SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                itemCount: denominations.length,
                itemBuilder: (context, index) {
                  final denom = denominations[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$denom x",
                          style:  TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: controllers[denom],
                            keyboardType: TextInputType.number,
                            onChanged: (_) => calculateTotal(),
                            style:  TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "0",
                              hintStyle:  TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: Colors.grey[850],
                              contentPadding:  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
               SizedBox(height: 10),
              Text("Total: ₹$total",
                  style:  TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Notes: $noteCount",
                  style:  TextStyle(fontSize: 16, color: Colors.white70)),
               SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: clearAll,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent[400],
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child:  Text("Clear", style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    onPressed: saveToFirebase,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[700],
                      padding:  EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child:  Text("Save", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
