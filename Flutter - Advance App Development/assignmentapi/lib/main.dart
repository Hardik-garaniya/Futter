import 'package:assignmentapi/task2.dart';
import 'package:assignmentapi/task3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main()
{
  runApp(MaterialApp(home: Home(),));
}


class Home  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("API"),
    backgroundColor: Colors.indigo,
    ),
    body: Center(
      child: Column(
        children: [
          SizedBox(height: 30,),


          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherScreen()));

          }, child: Text("Task 1")
          ),

          SizedBox(height: 30,),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsFeedScreen()));

          }, child: Text("Task 2")
          ),

          SizedBox(height: 30,),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

          }, child: Text("Task 3")
          ),
          SizedBox(height: 30,)
        ],
      ),

    ),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _cityName = 'Rajkot';  // Empty string for user input
  String _weather = '';
  double _temperature = 0.0;

  TextEditingController _cityController = TextEditingController();

  String apiKey = '9094e2bf72e32c1b07f763682e6a6168'; // Replace with your API key

  Future<void> fetchWeatherData() async {
    if (_cityName.isEmpty) {
      setState(() {
        _weather = "Please enter a city name.";
        _temperature = 0.0;
      });
      return;
    }

    try {
      var weatherData = await fetchWeather(_cityName);
      setState(() {
        _weather = weatherData['weather'][0]['description'];
        _temperature = weatherData['main']['temp'];
      });
    } catch (e) {
      setState(() {
        _weather = "Failed to load weather data.";
        _temperature = 0.0;
      });
    }
  }

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load weather data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text("$_cityName" ),


            Text('Weather: $_weather'),
            Text('Temperature: $_temperature°C'),
            ElevatedButton(
              onPressed: fetchWeatherData,
              child: Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
