import 'package:flutter/material.dart';
import 'package:news_app/SingleSoucre.dart';

class CardRings extends StatelessWidget {
  const CardRings({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"soucre": "https://www.google.com/s2/favicons?domain=CNN.com&sz=128", "title": "CNN"},
      {"soucre": "https://www.google.com/s2/favicons?domain=Bloomberg.com&sz=128", "title": "Bloomberg"},
      {"soucre": "https://www.google.com/s2/favicons?domain=Forbes.com&sz=128", "title": "Forbes"},
      {"soucre": "https://www.google.com/s2/favicons?domain=AlJazeera.com&sz=128", "title": "AlJazeera"},
      {"soucre": "https://www.google.com/s2/favicons?domain=CBSSports.com&sz=128", "title": "CBS Sports"},
      {"soucre": "https://www.google.com/s2/favicons?domain=NewYorkPost.com&sz=128", "title": "New York Post"},
      {"soucre": "https://www.google.com/s2/favicons?domain=BBCNews.com&sz=128", "title": "BBC News"},
      {"soucre": "https://www.google.com/s2/favicons?domain=Time.com&sz=128", "title": "Time"},
      {"soucre": "https://www.google.com/s2/favicons?domain=ABCNews.com&sz=128", "title": "ABC News"},
    ];

    final allItems = items
        .map((e) => GestureDetector( 
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Singlesoucre(sourceUrl: e["soucre"] ?? "", title: e["title"] ?? "")),
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.network(
                  e["soucre"] ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ))
        .toList()
        .asMap()
        .map((key, item) {
          final value = Container(
            width: 62,
            height: 62,
            decoration: const ShapeDecoration(
              shape: OvalBorder(),
            ),
            child: item,
          );
          return MapEntry(key, value);
        })
        .values
        .toList();

    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: allItems[index],
            );
          },
        ),
      ),
    );
  }
}
