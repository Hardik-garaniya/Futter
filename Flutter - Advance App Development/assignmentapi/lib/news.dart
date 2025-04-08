import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = 'c70600beaa544f1ea7170da3cd285d3a';

  Future<List<dynamic>> fetchNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['articles'];
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}
