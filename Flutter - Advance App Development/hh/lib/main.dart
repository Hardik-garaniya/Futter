import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';
import 'image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase"),
      backgroundColor: Colors.purple,
      ),
      body: Center(

        child: Column(
          children: [

            SizedBox(height: 250,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthScreen()));

            }, child: Text("Auth & Chat App")),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryScreen()));

            }, child: Text("Image Upload"))
          ],
        ),
      ),
    );
  }
}
