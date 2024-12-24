import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Cards/card_8.dart';
import 'package:news_app/Cards/card_news.dart';
import 'package:news_app/components/HomeCard.dart';
import 'package:news_app/components/newfilterCard.dart';
import 'package:news_app/services/api_service.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // late NewsData newsData;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final jsonData = await rootBundle.loadString('demo.json');
      final parsedData = json.decode(jsonData);
      setState(() {
        newsData = parsedData;
      });
      print("Number of articles: ${newsData['articles'].length}");
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("HomeContent build");

    if (newsData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return DefaultTabController(
      length: 3,
      child: Container(
      color: Colors.white, // Set background color to white
      child: SingleChildScrollView(
        child: Column(
        children: [
          Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text(
              "Global News",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5, // Add padding between text and underline
              ),
            ),
            Container(
              width: 64,
              height: 4,
              color: Colors.orange,
            ),
            ],
          ),
          ),
          CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 300,
            aspectRatio: 16 / 9,
            animateToClosest: true,
          ),
          items: [1, 2, 3, 4]
            .map((item) => Container(
                width: 800.0,
                height: 420.0,
                padding: EdgeInsets.symmetric(horizontal: 1.0),
                child: Homecard(
                webUrl: newsData['articles'][item]['url'],
                title: newsData['articles'][item]['title'],
                imageUrl: newsData['articles'][item]['urlToImage'],
                ),
              ))
            .toList(),
          ),
          Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text(
              "Local News",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5, // Add padding between text and underline
              ),
            ),
            Container(
              width: 64,
              height: 4,
              color: Colors.orange,
            ),
            ],
          ),
          ),

          CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 300,
            aspectRatio: 16 / 9,
            animateToClosest: true,
          ),
          items: [1, 2, 3, 4]
            .map((item) => Container(
                width: 800.0,
                height: 420.0,
                padding: EdgeInsets.symmetric(horizontal: 1.0),
                child: Homecard(
                webUrl: newsData['articles'][item]['url'],
                title: newsData['articles'][item]['title'],
                imageUrl: newsData['articles'][item]['urlToImage'],
                ),
              ))
            .toList(),
          ),
          const Gap(1),
            Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text(
              "Latest News",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5, // Add padding between text and underline
              ),
            ),
            Container(
              width: 64,
              height: 4,
              color: Colors.orange,
            ),
            ],
            ),
            ),
            ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: newsData['articles'].length,
            itemBuilder: (context, index) {
            final article = newsData['articles'][index];
            return 
            Newfiltercard(
        title: article['title'] ?? 'No title available',
        urlToImage: article['urlToImage'] ??
            'https://via.placeholder.com/150', // Placeholder image
        publishedAt: article['publishedAt'] ?? 'Unknown date',
        url: article['url'] ?? 'https://example.com',
      );
            },
            ),
        ],
        ),
      ),
      ),
    );
    }
  }

class TodayTab extends StatelessWidget {
  const TodayTab({super.key});

  @override
  Widget build(BuildContext context) {
    print("TodayTab build");

    return ListView.builder(
      itemCount: newsData['articles'].length,
      itemBuilder: (context, index) {
      final article = newsData['articles'][index];
      return Newfiltercard(
        title: article['title'] ?? 'No title available',
        urlToImage: article['urlToImage'] ??
            'https://via.placeholder.com/150', // Placeholder image
        publishedAt: article['publishedAt'] ?? 'Unknown date',
        url: article['url'] ?? 'https://example.com',
      );
      },
    );
  }
}


class ThisWeekTab extends StatelessWidget {
  const ThisWeekTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Card8(),
      ],
    );
  }
}

class ThisMonthTab extends StatelessWidget {
  const ThisMonthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Card8(),
      ],
    );
  }
}
