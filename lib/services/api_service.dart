

import 'package:http/http.dart' as http;
import 'package:news_app/demo.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _savedLanguageKey = 'selected_language'; // Storage key
const String _savedCountryKey = 'selected_country'; // Key for storage
const String _savedTopicsKey = 'selected_topics'; // Storage key

String? lang;
String? country;
List<String>? topic;

String newapi_apiKey = "449ff74ff0cb449186ca96375e940f5c";
String thenewapi_apiKey = "aU30uw5aTpT0va4Ny2HjhVoIp0DjOBalMbP10C2w";
String headlineEndpoint1 = "https://newsapi.org/v2/top-headlines?apiKey=$newapi_apiKey";
String everythingEndpoint1 = "https://newsapi.org/v2/everything?apiKey=$newapi_apiKey";
String headlineEndpoint2 = "https://api.thenewsapi.com/v1/news/top?api_token=$thenewapi_apiKey";
String everythingEndpint2 = "https://api.thenewsapi.com/v1/news/all?api_token=$thenewapi_apiKey";
// String lang = 
Map<String, dynamic> newsData = {};
Map<String, dynamic> globalnewsData = {};
Map<String, dynamic> localnewsData = {};


Future<void> loadUserSelects() async {
      final prefs = await SharedPreferences.getInstance();
      lang = prefs.getString(_savedLanguageKey)?.toLowerCase();
      topic = prefs.getStringList(_savedTopicsKey);
      country = prefs.getString(_savedCountryKey)?.toLowerCase();
      print("Loaded lang: $lang");
      print("Loaded Topic: $topic");
      print("Loaded Country: $country");
}

Future<void> loadJsonData() async {
  try {
    final jsonData = await rootBundle.loadString('demo.json');
    final parsedData = json.decode(jsonData);
    newsData = adaptJson1ToJson2(parsedData);
    print("Number of articles: ${newsData['articles'].length}");
  } catch (e) {
    print("Error loading JSON: $e");
  }
}


Future<void> LocalNews() async {
  try {
    final response = await http.get(Uri.parse("$everythingEndpoint1&q=bitcoin"));
    final parsedData = jsonDecode(response.body);
    newsData = parsedData;
    
  } catch (e) {
    print("Error loading JSON: $e"); 
  }
}

Future<void> latestNews() async {
  try {
    final response = await http.get(Uri.parse("$everythingEndpoint1&q=bitcoin"));
    final parsedData = jsonDecode(response.body);
    newsData = parsedData;
  } catch (e) {
    print("Error loading JSON: $e"); 
  }
}

Future<void> globalNews() async {
  try {
    final response = await http.get(Uri.parse("$everythingEndpint2&limit=3&language=$lang"));
    final responseBody = utf8.decode(response.bodyBytes);
    final parsedData = jsonDecode(responseBody);
    globalnewsData = adaptJson1ToJson2(parsedData);
    print("###############################");
    print("$everythingEndpint2&limit=3&language=$lang");
  } catch (e) {
    print("Error loading JSON: $e"); 
  }
}


Map<String, dynamic> adaptJson1ToJson2(Map<String, dynamic> json1) {
  return {
    "status": "ok",
    "totalResults": json1["meta"]["found"],
    "articles": json1["data"].map((item) {
      return {
        "source": {
          "id": null,
          "name": item["source"]
        },
        "author": null,
        "title": item["title"],
        "description": item["description"],
        "url": item["url"],
        "urlToImage": item["image_url"],
        "publishedAt": item["published_at"],
        "content": null
      };
    }).toList(),
  };
}