import 'package:flutter/material.dart';
import 'package:news_app/components/topicsCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Newsfilter extends StatefulWidget {
  static const String _savedTopicsKey = 'selected_topics'; // Storage key
  const Newsfilter({super.key});

  @override
  _NewsfilterState createState() => _NewsfilterState();
}

class _NewsfilterState extends State<Newsfilter> {
  List<String> selectedTopics = [];

  @override
  void initState() {
    super.initState();
    _loadSelectedTopics();
  }

  Future<void> _loadSelectedTopics() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTopics = prefs.getStringList(Newsfilter._savedTopicsKey) ?? [];
    setState(() {
      selectedTopics.addAll(savedTopics);
    });
    print("Loaded Topics: $selectedTopics");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: selectedTopics.length,
      child: 
      Container(
        color: Colors.white,
        child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
            textScaler: TextScaler.linear(1.0),
            labelStyle: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600
            ),
            indicatorColor: Colors.amber,
            tabs: selectedTopics.map((topic) => Tab(text: topic)).toList(),
          ),
          Expanded(
            child: 
            Container(
              color: Colors.white,
              child: TabBarView(
              children: selectedTopics.map((topic) => TopicsCards(topic: topic) ).toList(),
            ),
            )
          ),
        ],
      ),
      )
      
    );
  }
}
