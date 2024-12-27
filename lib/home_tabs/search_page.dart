import 'package:flutter/material.dart';
import 'package:news_app/components/HomeCard.dart';
import 'package:news_app/services/api_service.dart' as api;


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final results = await api.SearchNews(query);
      setState(() {
        _searchResults = results ?? [];
      });
    } catch (e) {
      print("Error fetching search results: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        color: Colors.white,
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchInput(
              textController: _textController,
              hintText: 'Search...',
              onSearch: _performSearch,
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final result = _searchResults[index];
                        return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WebViewScreen(url: result["url"], title: result['title'], imgUrl: result['urlToImage']),
                                    ),
                                  );
                                },
                        
                        child:  Card(
                          elevation: 4,
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(result['title'] ?? 'No Title'),
                            subtitle: Text(result['description'] ?? 'No Description'),
                            trailing: result['urlToImage'] != null
                                ? Image.network(
                                    result['urlToImage'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                        )
                      );
                      },
                    ),
            ),
          ],
        ),
      ),
      )
      
    );
  }
}

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final Function(String) onSearch;

  const SearchInput({
    required this.textController,
    required this.hintText,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
          offset: const Offset(12, 26),
          blurRadius: 50,
          spreadRadius: 0,
          color: Colors.black.withOpacity(.1),
        ),
          
      ]),

      child: TextField(
        controller: textController,
        onChanged: (value) {
          onSearch(value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.amber,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}

// Future<List<dynamic>> SearchNews(String query) async {
//   const everythingEndpoint1 = "https://example.com/api/news"; // Replace with your endpoint
//   try {
//     final response = await http.get(Uri.parse("$everythingEndpoint1&q=$query"));
//     final responseBody = utf8.decode(response.bodyBytes);
//     final parsedData = jsonDecode(responseBody);

//     print("###################################");
//     print("$everythingEndpoint1&q=$query");

//     return parsedData['articles'] as List<dynamic>; // Assuming response contains "articles"
//   } catch (e) {
//     print(e);
//     return [];
//   }
// }
