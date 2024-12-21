import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_2.dart';
import 'package:news_app/Cards/card_3.dart';
import 'package:news_app/Cards/card_7.dart';
import 'package:news_app/Screens/view1.dart';
import 'package:news_app/Screens/view2.dart';
import 'package:news_app/Screens/view5.dart';
import 'package:news_app/home_tabs/Newfilter.dart';
import 'package:news_app/home_tabs/bookmark_page.dart';
import 'package:news_app/home_tabs/home_page.dart';
import 'package:news_app/home_tabs/search_page.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star),
            icon: Icon(Icons.star_outline),
            label: 'MyNews',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmark',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left: Logo/Icon
                  // const Icon(Icons.menu, size: 30, color: Colors.black),
                  Image.asset(
                    "images/News.png",
                    height: 40,
                  ),

                  // Right: Settings Icon
                  IconButton(
                    icon: const Icon(Icons.settings, size: 30),
                    onPressed: () {
                      // Handle settings action
                      print("Settings tapped");
                    },
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: <Widget>[
                const HomeContent(),
                SearchPage(),
                const Newsfilter(),
                const BookMarkPage(),
                // Add more views as needed
              ][currentPageIndex],
            ),
          ],
        ),
      ),
    );
  }
}


