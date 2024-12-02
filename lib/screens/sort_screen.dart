import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../providers/news_provider.dart';
import 'detail_screen.dart';
import 'home_screen.dart';

class SortScreen extends StatefulWidget {
  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  @override
  void initState() {
    super.initState();
    // Default sorting by newest date when the screen is opened
    Provider.of<NewsProvider>(context, listen: false).sortNewsByNewest();
  }

  // Method to handle sorting options
  void _sortArticles(BuildContext context, bool sortByNewest) {
    if (sortByNewest) {
      Provider.of<NewsProvider>(context, listen: false).sortNewsByNewest();
    } else {
      Provider.of<NewsProvider>(context, listen: false).sortNewsByOldest();
    }
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sort News by Date'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Newest') {
                _sortArticles(context, true);
              } else if (value == 'Oldest') {
                _sortArticles(context, false);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Newest',
                child: Text('Sort by Newest'),
              ),
              PopupMenuItem(
                value: 'Oldest',
                child: Text('Sort by Oldest'),
              ),
            ],
          ),
        ],
      ),
      body: newsProvider.newsArticles.isEmpty
          ? Center(child: Text('No news articles found'))
          : ListView.builder(
        itemCount: newsProvider.newsArticles.length,
        itemBuilder: (context, index) {
          final article = newsProvider.newsArticles[index];
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: article.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(article.title),
            subtitle: Text(article.publishedAt),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
