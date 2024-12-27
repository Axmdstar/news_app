import 'package:flutter/material.dart';
import 'package:news_app/components/HomeCard.dart';
import 'package:news_app/sqlhelper.dart';


class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});
  @override
  _BookMarkPageState createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  List<Map<String, dynamic>> userBookmarks = []; 

  Future<List<Map<String, dynamic>>> getBookmarks() async {
    var bookmarks = await DatabaseHelper.instance.getBookmarks();
    setState(() {
      userBookmarks = bookmarks;
    });
    return bookmarks;
  }

  @override
  void initState() {
    super.initState();
    getBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: Colors.white,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bookmarks",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: -0.96,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: 
            Container(
              color: Colors.white,
              child: ListView.builder(
              itemCount: userBookmarks.length,
              itemBuilder: (context, index) {
                return BookmarKCard(
                  url: userBookmarks[index]['url'] ?? '',
                  title: userBookmarks[index]['title'] ?? '',
                  imgUrl: userBookmarks[index]['imgUrl'] ?? '',
                  id: userBookmarks[index]['id'] ?? 0,
                );
              },
            ),
            )
            
          ),
        ],
      ),
    ),
    )
    ;
  }
}

class BookmarKCard extends StatefulWidget {
  final String url;
  final String title;
  final String imgUrl;
  final int id;

  const BookmarKCard({ super.key, 
  required this.url, 
  required this.imgUrl, 
  required this.title, 
  required this.id});

  @override
  _BookmarKCardState createState() => _BookmarKCardState();
}

class _BookmarKCardState extends State<BookmarKCard> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(
              url: widget.url,
              title: widget.title,
              imgUrl: widget.imgUrl,
            ),
          ),
        );
      },
      child: Container(
        
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 100,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: 
      BoxDecoration(
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
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.imgUrl), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 10,
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xFF29272E),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.fade,
                  
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              DatabaseHelper.instance.deleteBookmark(widget.id);
            },
          ),
        ],
      ),
    )
    );
  }
}
