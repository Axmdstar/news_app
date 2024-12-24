import 'package:http/http.dart' as http;
import 'package:news_app/demo.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


Future<NewsData> fetchNewsFromApi() async {
  final response = await http.get(Uri.parse('https://api.example.com/news'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return NewsData.fromJson(jsonData);
  } else {
    throw Exception('Failed to load news');
  }
}

Map<String, dynamic> newsData = {};

Future<void> loadJsonData() async {
  try {
    final jsonData = await rootBundle.loadString('demo.json');
    final parsedData = json.decode(jsonData);
    newsData = parsedData;
    print("Number of articles: ${newsData['articles'].length}");
  } catch (e) {
    print("Error loading JSON: $e");
  }
}
