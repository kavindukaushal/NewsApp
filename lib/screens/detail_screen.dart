import 'package:flutter/material.dart';
import '../models/news_article.dart';
import 'RatingScreen.dart';

class DetailScreen extends StatelessWidget {
  final NewsArticle article;

  DetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Column(
        children: [
          Image.network(article.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(article.description),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to the RatingScreen and pass the article title
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RatingScreen(articleTitle: article.title),
                ),
              );
            },
            child: Text('Rate this article'),
          ),
        ],
      ),
    );
  }
}
