import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_22.dart';
import 'package:news_app/Screens/view1.dart';
import 'package:news_app/Screens/view2.dart';
import 'package:news_app/Screens/view3.dart';
import 'package:news_app/Screens/view5.dart';
import 'package:news_app/Screens/view_10.dart';
import 'package:news_app/Screens/view_6.dart';
import 'package:news_app/Screens/view_7.dart';
import 'package:news_app/Screens/view_8.dart';
// import 'package:news_app/home_tabs/home_page.dart';


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
    final ThemeData theme = Theme.of(context);
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
            icon:  Icon(Icons.search_outlined),
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






      body: <Widget>[
        // const HomePage(),
        // const SearchPage(),
        // const View6(),
        // const View7(),
        const Card22(),
        // const View5()
        // const MyNewsPage(),
        // const BookmarkPage(),
        // const  SettingsPage(), 
      ][currentPageIndex],
    );
  }
}
