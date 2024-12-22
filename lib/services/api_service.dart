import 'package:http/http.dart' as http;
import 'package:news_app/demo.dart';
import 'dart:convert';

Future<NewsData> fetchNewsFromApi() async {
  final response = await http.get(Uri.parse('https://api.example.com/news'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return NewsData.fromJson(jsonData);
  } else {
    throw Exception('Failed to load news');
  }
}
