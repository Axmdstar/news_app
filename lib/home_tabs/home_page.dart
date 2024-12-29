import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/HomeCard.dart';
import 'package:news_app/components/newfilterCard.dart';
import 'package:news_app/services/api_service.dart' as api;

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await api.globalNews();
    await api.homeLocalNew();
    setState(() {
      isLoading = false; // Set loading to false once data is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator while data is being loaded
    if (isLoading) {
      return  Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.amberAccent,),
        )
      );
    }

    // Check if 'articles' is available in the loaded data
    final articles = api.allNewsData['articles'] ?? [];
    final articlesGlobal = api.globalnewsData['articles'] ?? [];

    return DefaultTabController(
      length: 3,
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255), // Set background color to white
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSectionHeader("Local News"),
              _buildCarousel(articles.take(4).toList()),
              _buildSectionHeader("Global News"),
              _buildCarousel(articlesGlobal.take(5).toList()),
              _buildSectionHeader("Latest News"),
              _buildLatestNewsList(articles),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          Container(
            width: 64,
            height: 4,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(List<dynamic> articles) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 300,
        aspectRatio: 16 / 9,
        animateToClosest: true,
      ),
      items: articles.map((article) {
        return Container(
          width: 800.0,
          height: 420.0,
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Homecard(
            webUrl: article['url'] ?? 'https://example.com',
            title: article['title'] ?? 'No title available',
            imageUrl: article['urlToImage'] ?? 'https://via.placeholder.com/150',
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLatestNewsList(List<dynamic> articles) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Newfiltercard(
          title: article['title'] ?? 'No title available',
          urlToImage: article['urlToImage'] ?? 'https://via.placeholder.com/150',
          publishedAt: article['publishedAt'] ?? 'Unknown date',
          url: article['url'] ?? 'https://example.com',
        );
      },
    );
  }
}
