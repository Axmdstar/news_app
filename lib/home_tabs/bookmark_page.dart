import 'package:flutter/material.dart';
import 'package:news_app/sqlhelper.dart';


class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});
  @override
  _BookMarkPageState createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  List<Map<String, dynamic>> userBookmarks = []; // Use a strongly typed list

  Future<List<Map<String, dynamic>>> getBookmarks() async {
    var bookmarks = await DatabaseHelper.instance.getBookmarks();
    print("##############################################");
    print(bookmarks);
    setState(() {
      userBookmarks = bookmarks;
    });
    return bookmarks;
  }

  @override
  void initState() {
    super.initState();
    // Fetch bookmarks and update state
    getBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ),
        ],
      ),
    );
  }
}

class BookmarKCard extends StatefulWidget {
  final String url;
  final String title;
  final String imgUrl;
  final int id;

  BookmarKCard({Key? key, required this.url, required this.imgUrl, required this.title, required this.id}) : super(key: key);

  @override
  _BookmarKCardState createState() => _BookmarKCardState();
}

class _BookmarKCardState extends State<BookmarKCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: const Color(0xFFF7F6FA),
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
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Color(0xFF29272E),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.64,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // Implement delete functionality here
              DatabaseHelper.instance.deleteBookmark(widget.id);
            },
          ),
        ],
      ),
    );
  }
}
