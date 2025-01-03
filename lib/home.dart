import 'package:flutter/material.dart';
import 'package:news_app/home_tabs/Newfilter.dart';
import 'package:news_app/home_tabs/bookmark_page.dart';
import 'package:news_app/home_tabs/home_page.dart';
import 'package:news_app/home_tabs/search_page.dart';
import 'package:news_app/home_tabs/setting_page.dart';


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
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        indicatorShape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
        elevation: 12,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Colors.white),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star, color: Colors.white),
            icon: Icon(Icons.star_outline),
            label: 'MyNews',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark, color: Colors.white),
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
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
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
                  
                  Image.asset(
                    "images/News.png",
                    height: 40,
                  ),

                  
                  IconButton(
                    icon: const Icon(Icons.settings, size: 30),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage()));
                    },
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: <Widget>[
                const HomeContent(),
                const SearchPage(),
                const Newsfilter(),
                const BookMarkPage(),
              ][currentPageIndex],
            ),
          ],
        ),
      ),
    );
  }
}


