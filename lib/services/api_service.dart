import 'package:http/http.dart' as http;
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
String thenewapi_apiKey = "RfCNAehYE5W3yLnf4Yeh2lTbDm8Oa1x32lOoYk5W";
String headlineEndpoint1 = "https://newsapi.org/v2/top-headlines?apiKey=$newapi_apiKey";
String everythingEndpoint1 = "https://newsapi.org/v2/everything?apiKey=$newapi_apiKey";
String headlineEndpoint2 = "https://api.thenewsapi.com/v1/news/top?api_token=$thenewapi_apiKey";
String everythingEndpoint2 = "https://api.thenewsapi.com/v1/news/all?api_token=$thenewapi_apiKey";

Map<String, dynamic> newsData = {};
Map<String, dynamic> globalnewsData = {};
Map<String, dynamic> localnewsData = {};
Map<String, dynamic> searchList = {};
Map<String, dynamic> allNewsData = {};

// Load User set up data
Future<void> loadUserSelects() async {
  final prefs = await SharedPreferences.getInstance();
  lang = prefs.getString(_savedLanguageKey)?.toLowerCase();
  topic = prefs.getStringList(_savedTopicsKey);
  country = prefs.getString(_savedCountryKey)?.toLowerCase();

  print("Loaded lang: $lang");
  print("Loaded Topic: $topic");
  print("Loaded Country: $country");
}

// Function to sort articles in a Map<String, dynamic> by date
void sortMapByDate(Map<String, dynamic>? data) {
  if(data != null){
    List<dynamic> articles = data["articles"];
    articles.sort((a, b) {
      DateTime dateA = DateTime.parse(a['publishedAt']);
      DateTime dateB = DateTime.parse(b['publishedAt']);
      return dateB.compareTo(dateA); // Descending order
    });
  }
  
}


Future<void> homeLocalNew() async {
  // List of categories
  List<String> categories = [
    'sports','business','general'
    'health','entertainment','tech','politics',
    'food','travel',
  ];

  Map<String, dynamic>? tempNews ;
  try {
    // Loop through categories and fetch data
    for (String category in categories) {
      final url = Uri.parse('$headlineEndpoint2&categories=$category&language=$lang');
      print('$headlineEndpoint2?categories=$category&locale=$country&language=$lang');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parse the JSON response and append it to the list
        final data = json.decode(response.body);

        // Adapt the JSON structure and append the articles
        print(data);
        print("%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        if(tempNews == null){
          final adaptedData = adaptJson1ToJson2(data);
          print(adaptedData);
          // allNewsData.addAll(adaptedData["articles"]);  
          tempNews = adaptedData;
        } else {
          final adaptedData = adaptJson1ToJson2(data);
          print(adaptedData);
          // allNewsData.addAll(adaptedData["articles"]);
          tempNews['articles'].addAll(adaptedData["articles"]);
        }
      } else {
        // Handle HTTP errors
        print('Failed to fetch news for $category: ${response.statusCode}');
      }
    }
    // Print or use the collected data
    allNewsData = tempNews ?? {};
    sortMapByDate(allNewsData);
    print('All News Data: $allNewsData');
  } catch (e) {
    // Handle any other errors
    print('An error occurred: $e');
  }
}
// Test Demo Json
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

// Get Local News
Future<void> LocalNews() async {
  try {
    final response = await http.get(Uri.parse("$everythingEndpoint2&language=$lang&locale=$country"));
    final parsedData = jsonDecode(response.body);
    newsData = parsedData;
    
  } catch (e) {
    print("Error loading JSON: $e"); 
  }
}

// Get Latest News
Future<void> latestNews() async {
  try {
    final response = await http.get(Uri.parse("https://newsdata.io/api/1/latest?apikey=pub_63802b31ef5c76b088e353f9eae1f6ca53452&language=$lang&country=$country"));
    final responseBody = utf8.decode(response.bodyBytes);
    final parsedData = jsonDecode(responseBody);
    allNewsData = adaptnewdataToJson1(parsedData);
    print(parsedData);
    print("##############################################");
    print("$everythingEndpoint1&language=$lang&locale=$country");
    print(newsData);
  } catch (e) {
    print("Error loading JSON: $e"); 
  }
}

// Get Global News
Future<void> globalNews() async {
  try {
    final response = await http.get(Uri.parse("$everythingEndpoint2&limit=3&language=$lang"));
    final responseBody = utf8.decode(response.bodyBytes);
    final parsedData = jsonDecode(responseBody);
    globalnewsData = adaptJson1ToJson2(parsedData);

    print("###############################");
    print("$everythingEndpoint2&limit=3&language=$lang");

  } catch (e) {
    print("Error loading JSON: $e"); 
  }
}

// Search News
Future<dynamic> SearchNews(String query) async {
  try {
    final response = await http.get(Uri.parse("$everythingEndpoint1&q=$query"));
    final responseBody = utf8.decode(response.bodyBytes);
    final parsedData = jsonDecode(responseBody);

    print("###################################");
    print("$everythingEndpoint1&q=$query");

    return parsedData['articles'] as List<dynamic>; // Assuming response contains "articles"
  } catch (e) {
    print(e);
    return [];
  }
}

// News Based on Topic
Future<dynamic> newsOnTopic(String category) async {
  try {
    final response = await http.get(Uri.parse("https://newsdata.io/api/1/latest?apikey=pub_63802b31ef5c76b088e353f9eae1f6ca53452&language=$lang&category=$category"));
    final responseBody = utf8.decode(response.bodyBytes);
    final parsedData = jsonDecode(responseBody);

    print("###################################");
    print("https://newsdata.io/api/1/latest?apikey=pub_63802b31ef5c76b088e353f9eae1f6ca53452&language=$lang&category=$category");
    final adpt = adaptnewdataToJson1(parsedData);
    return adpt['articles'] as List<dynamic>; // Assuming the response contains "articles"
  } catch (e) {
    print(e);
    return [];
  }
}

// Adapter for Json 2
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


Map<String, dynamic> adaptnewdataToJson1(Map<String, dynamic> json2) {
  return {
    "status": "ok",
    "totalResults": json2["totalResults"],
    "articles": json2["results"].map((item) {
      return {
        "source": {
          "id": null,
          "name": item["source_name"] ?? item["source_id"]
        },
        "author": item["creator"]?.isNotEmpty == true ? item["creator"].first : null,
        "title": item["title"],
        "description": item["description"],
        "url": item["link"],
        "urlToImage": item["image_url"],
        "publishedAt": item["pubDate"],
        "content": item["content"] != "ONLY AVAILABLE IN PAID PLANS" ? item["content"] : null,
      };
    }).toList(),
  };
}
