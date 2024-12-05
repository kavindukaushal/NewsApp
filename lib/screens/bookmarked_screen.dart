// screens/bookmarked_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bookmark_provider.dart';
import 'detail_screen.dart';

class BookmarkedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked Articles'),
      ),
      body: bookmarkProvider.bookmarkedArticles.isEmpty
          ? Center(child: Text('No bookmarked articles'))
          : ListView.builder(
        itemCount: bookmarkProvider.bookmarkedArticles.length,
        itemBuilder: (context, index) {
          final article = bookmarkProvider.bookmarkedArticles[index];
          return ListTile(
            title: Text(article.title),
            subtitle: Text(article.publishedAt),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Remove the article from bookmarks
                bookmarkProvider.removeBookmark(article);
              },
            ),
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
