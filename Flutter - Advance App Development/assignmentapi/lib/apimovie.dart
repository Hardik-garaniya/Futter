import 'dart:convert';
import 'package:http/http.dart' as http;

class OmdbService {
  static const String _apiKey = 'd2862c66';
  static const String _baseUrl = 'https://www.omdbapi.com/';

  static Future<Map<String, dynamic>> fetchMovieByTitle(String title) async {
    final url = Uri.parse('$_baseUrl?apikey=$_apiKey&t=$title');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Response'] == 'True') {
        return data;
      } else {
        throw Exception('Movie not found');
      }
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
