import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Cards/card_1.dart';
import 'package:news_app/Cards/card_22.dart';
import 'package:news_app/Cards/card_8.dart';
import 'package:news_app/Cards/card_news.dart';
// import 'package:news_app/home_tabs/Newfilter.dart';


class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
      child: Column(
        children: [
        Container(
          child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 300,
          ),
          items: [1, 2, 3]
            .map((item) => Container(
                width: 900.0,
                height: 420.0,
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Card22(),
              ))
            .toList(),
          ),
        ),
        CardRings(),
        Gap(20),
        TabBar(
          tabs: [
          Tab(text: "Today"),
          Tab(text: "This Week"),
          Tab(text: "This Month"),
          ],
        ),
        Container(
          height: 400, // Adjust height as needed
          child: TabBarView(
          children: [
            TodayTab(),
            ThisWeekTab(),
            ThisMonthTab(),
          ],
          ),
        ),
        // Newsfilter(),
        ],
      ),
      ),
    );
  }
}


class TodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card8(),
        Card8(),
        Card8(),
        Card8(),
        // Add more Card8 widgets or other content here
      ],
    );
  }
}

class ThisWeekTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card8(),
        // Add more Card8 widgets or other content here
      ],
    );
  }
}

class ThisMonthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card8(),
        // Add more Card8 widgets or other content here
      ],    );
  }
}