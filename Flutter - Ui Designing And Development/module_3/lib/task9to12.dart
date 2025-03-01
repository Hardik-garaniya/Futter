import 'package:flutter/material.dart';
import 'main.dart';


class Task9to12 extends StatefulWidget {
  @override
  _task9to12 createState() => _task9to12();
}

class _task9to12 extends State<Task9to12> {
  String result = '0';
  String expression = '';

  List<String> cartItems = [];
  int totalItems = 0;

  int counter = 0;

  bool isBackgroundBlue = false;

  void updateResult(String value) {
    setState(() {
      expression += value;
    });
  }

  void evaluateExpression() {
    try {
      final evalResult = expression.isNotEmpty ? expression : '0';
      setState(() {
        result = evalResult;
        expression = '';
      });
    } catch (e) {
      setState(() {
        result = 'Error';
        expression = '';
      });
    }
  }

  void addToCart(String item) {
    setState(() {
      cartItems.add(item);
      totalItems = cartItems.length;
    });
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  void toggleBackgroundColor(bool value) {
    setState(() {
      isBackgroundBlue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Task 9 To 12'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Text(totalItems.toString()),
                backgroundColor: Colors.grey,
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
            },
          ),
          backgroundColor: Colors.grey,
        ),
        backgroundColor: isBackgroundBlue ? Colors.blue : Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Calculator', style: TextStyle(fontSize: 24)),
                  Text('Expression: $expression', style: TextStyle(fontSize: 18)),
                  Text('Result: $result', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () => updateResult('1'), child: Text('1')),
                      ElevatedButton(onPressed: () => updateResult('2'), child: Text('2')),
                      ElevatedButton(onPressed: () => updateResult('3'), child: Text('3')),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () => updateResult('4'), child: Text('4')),
                      ElevatedButton(onPressed: () => updateResult('5'), child: Text('5')),
                      ElevatedButton(onPressed: () => updateResult('6'), child: Text('6')),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () => updateResult('7'), child: Text('7')),
                      ElevatedButton(onPressed: () => updateResult('8'), child: Text('8')),
                      ElevatedButton(onPressed: () => updateResult('9'), child: Text('9')),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () => updateResult('0'), child: Text('0')),
                      ElevatedButton(onPressed: () => evaluateExpression(), child: Text('=')),
                      ElevatedButton(onPressed: () => updateResult('+'), child: Text('+')),
                    ],
                  ),
                ],
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shopping Cart', style: TextStyle(fontSize: 24)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Item ${index + 1}'),
                        trailing: ElevatedButton(
                          onPressed: () => addToCart('Item ${index + 1}'),
                          child: Text('Add to Cart'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Counter', style: TextStyle(fontSize: 24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: decrementCounter, child: Text('-')),
                      SizedBox(width: 20),
                      Text('$counter', style: TextStyle(fontSize: 24)),
                      SizedBox(width: 20),
                      ElevatedButton(onPressed: incrementCounter, child: Text('+')),
                    ],
                  ),
                ],
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Toggle Background Color', style: TextStyle(fontSize: 24)),
                  Switch(
                    value: isBackgroundBlue,
                    onChanged: toggleBackgroundColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
