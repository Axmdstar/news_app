import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/sqlhelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart' as w;


class Homecard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String webUrl;

  const Homecard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.webUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: webUrl, title: title, imgUrl: imageUrl),
          ),
        );
      },
      child: Container(
        height: 220,
        width: 900,
        decoration: ShapeDecoration(
          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fitHeight),
          shape: const RoundedRectangleBorder(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0x0029272E), Color(0xFF29272E)],
                ),
              ),
              child: Row(
                children: [
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(4),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                            letterSpacing: -0.96,
                          ),
                        ),
                        const Gap(4),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;
  final String imgUrl;
  static const String _AddBookMarkKey = "BookMarks";

  const WebViewScreen({ super.key,
                        required this.title,
                        required this.url, 
                        required this.imgUrl
                      });
  

Future<void> _saveToBookmark(String url, String title, String imgUrl) async {
  final newBookmark = {'url': url, 'title': title, 'imgUrl': imgUrl};
  await DatabaseHelper.instance.insertBookmark(newBookmark);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () => _saveToBookmark(url, title, imgUrl),
          ),
        ],
      ),
      body: w.WebViewWidget(controller: w.WebViewController()..loadRequest(Uri.parse(url))),
    );
  }
}
