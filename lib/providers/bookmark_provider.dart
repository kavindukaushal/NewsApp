// providers/bookmark_provider.dart
import 'package:flutter/cupertino.dart';

import '../models/news_article.dart';

class BookmarkProvider with ChangeNotifier {
  List<NewsArticle> _bookmarkedArticles = [];

  List<NewsArticle> get bookmarkedArticles => _bookmarkedArticles;

  void toggleBookmark(NewsArticle article) {
    if (_bookmarkedArticles.contains(article)) {
      _bookmarkedArticles.remove(article);
    } else {
      _bookmarkedArticles.add(article);
    }
    notifyListeners();
  }

  bool isBookmarked(NewsArticle article) {
    return _bookmarkedArticles.contains(article);
  }

  // New method to remove a bookmark
  void removeBookmark(NewsArticle article) {
    _bookmarkedArticles.remove(article);
    notifyListeners();
  }
}
