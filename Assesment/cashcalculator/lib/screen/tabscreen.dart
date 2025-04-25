import 'package:cashcalculator/screen/view.dart';
import 'package:flutter/material.dart';
import 'addscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Cash Calculator",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.grey[900],
          bottom: const TabBar(
            indicatorColor: Colors.tealAccent,
            tabs: [
              Tab(text: "Calculator"),
              Tab(text: "Saved Records"),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            CalculatorTab(),
            ViewScreen(), // View logic shown below
          ],
        ),
      ),
    );
  }
}
