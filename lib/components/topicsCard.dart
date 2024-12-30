import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/components/HomeCard.dart';
import 'package:news_app/services/api_service.dart' as api; // Ensure this is the correct import
// import 'package:news_app/screens/WebViewScreen.dart'; // Assuming WebViewScreen is defined elsewhere

class TopicsCards extends StatefulWidget {
  final String topic;
  const TopicsCards({super.key, required this.topic});
  @override
  _TopicsCardsState createState() => _TopicsCardsState();
}

class _TopicsCardsState extends State<TopicsCards> {
  List<dynamic> _topicResults = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTopicNews();
  }

  Future<void> _fetchTopicNews() async {
    try {
      final results = await api.newsOnTopic(widget.topic);
      setState(() {
        _topicResults = results;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching topic news: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Container( color: Colors.white,
          child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _topicResults.length,
              itemBuilder: (context, index) {
                final article = _topicResults[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewScreen(
                          url: article['url'] ?? '',
                          title: article['title'] ?? '',
                          imgUrl: article['urlToImage'] ?? '',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 123,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: const Offset(2, 6)
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 124,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // image: DecorationImage(
                            //   image: NetworkImage(article['urlToImage'] ?? ''),
                            //   fit: BoxFit.cover,
                            // ),
                             image: DecorationImage(
    image: article['urlToImage'] != null && article['urlToImage'] != ''
        ? NetworkImage(article['urlToImage'])
        : AssetImage("images/News.png"),
    fit: BoxFit.contain,
  ),
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                article['title'] ?? 'No Title',
                                style: const TextStyle(
                                  color: Color(0xFF29272E),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                              const Gap(8),
                              Text(
                                article['publishedAt'] ?? 'Unknown Date',
                                style: const TextStyle(
                                  color: Color(0xFFA7A5AC),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        )
          
    );
  }
}

// Future<List<dynamic>> newsOnTopic(String category) async {
//   const headlineEndpoint1 = "https://example.com/api/news"; // Replace with your API endpoint
//   try {
//     final response = await http.get(Uri.parse("$headlineEndpoint1&category=$category"));
//     final responseBody = utf8.decode(response.bodyBytes);
//     final parsedData = jsonDecode(responseBody);

//     print("###################################");
//     print("$headlineEndpoint1&category=$category");

//     return parsedData['articles'] as List<dynamic>; // Assuming the response contains "articles"
//   } catch (e) {
//     print(e);
//     return [];
//   }
// }
