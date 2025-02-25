import 'package:flutter/material.dart';
import 'main.dart';

class Task25to28 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Task25to28> {
  final List<String> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  final List<int> _numbers = List.generate(20, (index) => index);

  final List<Map<String, String>> _products = [
    {'name': 'Product 1', 'price': '\$50', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iMX14b3Hm-yvvAHM-7M1Q3NGadhC9VinIw&s'},
    {'name': 'Product 2', 'price': '\$60', 'image': 'https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1666000526/Croma%20Assets/CMS/CAtegory/Mobile%20phone%20-%20C10/NEW%20PCP%20DESIGN%20-%20OCT/Updated/MPCP_shopbybrand_oppo_27sep2022_whbjuw.png?tr=w-1000'},
    {'name': 'Product 3', 'price': '\$70', 'image': 'https://i03.appmifile.com/942_item_in/17/12/2024/35ce3d67c8df46482bcf534c9339e578.png?thumb=1&w=500&q=85'},
    {'name': 'Product 4', 'price': '\$80', 'image': 'https://5.imimg.com/data5/SELLER/Default/2023/3/296178163/GX/GL/SD/186724856/vivo-mobile-phone.jpg'},
  ];

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _loadMoreData() {
    setState(() {
      _numbers.addAll(List.generate(20, (index) => _numbers.length + index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Task 25 To 28'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
            },
          ),
          backgroundColor: Colors.grey,
        ),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'To-Do List'),
                  Tab(text: 'Infinite Scroll'),
                  Tab(text: 'Custom List'),
                  Tab(text: 'Products'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _taskController,
                            decoration: InputDecoration(
                              labelText: 'Enter task',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: _addTask,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _tasks.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(_tasks[index]),
                                onDismissed: (direction) {
                                  _removeTask(index);
                                },
                                child: ListTile(
                                  title: Text(_tasks[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollEndNotification &&
                            scrollNotification.metrics.pixels ==
                                scrollNotification.metrics.maxScrollExtent) {
                          _loadMoreData();
                        }
                        return false;
                      },
                      child: ListView.builder(
                        itemCount: _numbers.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Item #${_numbers[index]}'),
                          );
                        },
                      ),
                    ),
                    // Task 27: Custom Styled List with ListTile
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.check),
                          title: Text('Task #$index'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _products.length,
                          itemBuilder: (context, index) {
                            final product = _products[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.network(product['image']!, width: 200, height: 200),
                                    Text(product['name']!),
                                    Text(product['price']!),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
