import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class ApiService {
  final String apiKey = "1087e5e57321449a853dcafc0ee19184";
  final String baseUrl = "https://newsapi.org/v2/top-headlines";


  Future<List<NewsArticle>> fetchNews({String? query, String? category}) async {

    final url = '$baseUrl?country=us&apiKey=$apiKey&q=${query ?? ''}&category=${category ?? ''}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> articles = json.decode(response.body)['articles'];
      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
