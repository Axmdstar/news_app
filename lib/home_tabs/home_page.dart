
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Cards/card_8.dart';
import 'package:news_app/Cards/card_news.dart';
import 'package:news_app/components/HomeCard.dart';
import 'package:news_app/components/newfilterCard.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  dynamic newsData;

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
                child: const Text(
                  "Top News",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 300,
                  aspectRatio: 16 / 9,
                  animateToClosest: true,
                ),
                items: [1, 2, 3]
                      .map((item) => Container(
                            width: 800.0,
                            height: 420.0,
                            padding: EdgeInsets.symmetric(horizontal: 1.0),
                            child: Homecard(
                              title: newsData['articles'][item]['title'],
                              imageUrl: newsData['articles'][item]['urlToImage'],
                            ),
                          ))
                      .toList(),
              ),

              const CardRings(),

              const Gap(1),
              const TabBar(
                indicatorColor: Colors.amber,
                labelColor: Colors.blue,
                tabs: [
                  Tab(text: "Today"),
                  Tab(text: "This Week"),
                  Tab(text: "This Month"),
                ],
              ),
              SizedBox(
                height: 600, // Adjust height as needed
                child: TabBarView(
                  children: [
                    TodayTab(newsData),
                    const ThisWeekTab(),
                    const ThisMonthTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TodayTab extends StatelessWidget {
  final dynamic newsData;
  const TodayTab(this.newsData, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsData['articles'].length,
      itemBuilder: (context, index) {
        return Newfiltercard(
          newtitle: newsData['articles'][index]['title'] ?? "No Title",
          imageUrl: newsData['articles'][index]['urlToImage'] ??
              "assets/placeholder.jpg", // Fallback image
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
