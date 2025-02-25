import 'package:flutter/material.dart';
import 'main.dart';

class Task5to8 extends StatelessWidget
{
  final List<String> names = [
    "Hardik Garaniya",
    "Kapil Garaniya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("Flutter Task 5 To 8"),
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => myapp()));
          },
        ),
      ),

      body: SingleChildScrollView
        (
        child: Column
          (
          children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/flower1.jpg'),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hardik Garaniya",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Flutter Developer passionate about building beautiful apps.",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),

                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      child: Image.network(
                        "https://static.vecteezy.com/system/resources/previews/018/928/022/non_2x/farmer-driving-a-tractor-png.png",
                      ),
                    );
                  },
                )
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                 shrinkWrap: true,
                itemCount: names.length,
                 itemBuilder: (context, index) {
                  return ListTile(
                     title: Text(names[index]),
                     onTap: () {
                       print("${names[index]} tapped");
                     },
                  );},
               ),

             )
          ],
          ),
        ),
      );
  }
}
