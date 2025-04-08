import 'package:flutter/material.dart';
import 'apimovie.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMDb Movie App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey,
          border: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[850],
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _movie;
  String? _error;

  void _searchMovie() async {
    final title = _controller.text;
    if (title.isEmpty) return;

    try {
      final result = await OmdbService.fetchMovieByTitle(title);
      setState(() {
        _movie = result;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _movie = null;
        _error = 'Movie not found or error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🎬 OMDb Movie Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter movie title',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _searchMovie,
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            if (_movie != null)
              Expanded(
                child: ListView(
                  children: [
                    if (_movie!['Poster'] != 'N/A')
                      Image.network(_movie!['Poster'], height: 300),
                    const SizedBox(height: 10),
                    Text(
                      _movie!['Title'],
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Year: ${_movie!['Year']}'),
                    Text('Genre: ${_movie!['Genre']}'),
                    Text('Director: ${_movie!['Director']}'),
                    Text('Plot: ${_movie!['Plot']}'),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
