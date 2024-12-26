import 'dart:convert';

class NewsData {
  String status;
  int totalResults;
  List<Article> articles;

  NewsData({required this.status, required this.totalResults, required this.articles});

  factory NewsData.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<Article> articlesList = list.map((i) => Article.fromJson(i)).toList();

    return NewsData(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articlesList,
    );
  }
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

class Source {
  String? id;
  String name;

  Source({this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}

void main() {
  String jsonData = '''{
    "status": "ok",
    "totalResults": 34,
    "articles": [
      {
        "source": {
          "id": "cnn",
          "name": "CNN"
        },
        "author": "John Fritze",
        "title": "Durbin uses new report to accuse Justices Thomas and Alito of violating disclosure laws - CNN",
        "description": "A top Senate Democrat on Saturday accused conservative Supreme Court justices of violating federal disclosure laws in a lengthy report that caps a monthslong investigation by the Senate Judiciary Committee and comes weeks before Republicans take control of th…",
        "url": "https://www.cnn.com/2024/12/21/politics/durbin-report-thomas-alito-disclosure-laws-supreme-court/index.html",
        "urlToImage": "https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1235407844.jpg?c=16x9&q=w_800,c_fill",
        "publishedAt": "2024-12-21T12:00:00Z",
        "content": "A top Senate Democrat on Saturday accused conservative Supreme Court justices of violating federal disclosure laws in a lengthy report that caps a monthslong investigation by the Senate Judiciary Com… [+2734 chars]"
      },
      {
        "source": {
          "id": null,
          "name": "Aviationa2z.com"
        },
        "author": "Kashyap Velani",
        "title": "Malaysia Approves New \$70 Million Search for Missing MH370 Flight - Aviation A2z",
        "description": "Malaysia announces restart of the MH370 flight search, offering hope to families after nearly a decade of uncertainty.",
        "url": "https://aviationa2z.com/index.php/2024/12/21/malaysia-approves-search-for-missing-mh370-flight/",
        "urlToImage": "https://aviationa2z.com/wp-content/uploads/2024/03/Boeing_777_Malaysia_Airlines_Auckland.jpg",
        "publishedAt": "2024-12-21T11:57:09Z",
        "content": "KUALA LUMPUR- The Malaysian government has announced its agreement, in principle, to restart the search for a passenger jet that disappeared a decade ago, marking one of aviation’s most perplexing my… [+3799 chars]"
      }
    ]
  }''';

  Map<String, dynamic> jsonMap = jsonDecode(jsonData);
  NewsData news = NewsData.fromJson(jsonMap);

  print('Status: ${news.status}');
  print('Total Results: ${news.totalResults}');
  for (var article in news.articles) {
    print('Title: ${article.title}');
    print('Author: ${article.author}');
  }
}
