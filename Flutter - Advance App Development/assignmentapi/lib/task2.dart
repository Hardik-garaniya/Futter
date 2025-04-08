import 'package:flutter/material.dart';

import 'news.dart';



class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late Future<List<dynamic>> _newsArticles;

  @override
  void initState() {
    super.initState();
    _newsArticles = NewsService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load news'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available.'));
          } else {
            final articles = snapshot.data!;

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: article['urlToImage'] != null
                      ? Image.network(article['urlToImage'])
                      : null,
                  title: Text(article['title']),
                  subtitle: Text(article['description'] ?? 'No description'),
                  onTap: () {

                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
