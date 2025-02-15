// Task 26:
// Create a program that fetches data from a fake API endpoint (using the http package).
// Display the data after it's loaded and catch any errors if the request fails.


import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData() async {
  const url = 'https://jsonplaceholder.typicode.com/todos/1';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      print('Data received:');
      print(data);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}

void main() async {
  await fetchData();
}