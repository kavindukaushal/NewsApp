import 'package:flutter/material.dart';
import '../models/news_article.dart';
import '../services/api_service.dart';

class NewsProvider with ChangeNotifier {
  List<NewsArticle> _newsArticles = [];
  List<NewsArticle> get newsArticles => _newsArticles;

  final ApiService _apiService = ApiService();

  // Fetch news articles by category
  Future<void> fetchNewsByCategory(String category) async {
    _newsArticles = await _apiService.fetchNews(category: category);
    notifyListeners();
  }

  // Fetch news articles based on a search query
  Future<void> fetchNews(String query) async {
    _newsArticles = await _apiService.fetchNews(query: query);
    notifyListeners();
  }

  // Sort news articles by the newest date first
  void sortNewsByNewest() {
    _newsArticles.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    notifyListeners();
  }

  // Sort news articles by the oldest date first
  void sortNewsByOldest() {
    _newsArticles.sort((a, b) => a.publishedAt.compareTo(b.publishedAt));
    notifyListeners();
  }

  // Search news articles based on a query
  Future<void> searchNews(String query) async {
    _newsArticles = await _apiService.fetchNews(query: query);
    notifyListeners();
  }
}
