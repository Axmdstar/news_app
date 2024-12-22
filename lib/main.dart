import 'package:flutter/material.dart';
import 'package:news_app/country.dart';
import 'package:news_app/home.dart';
import 'package:news_app/lang.dart';
import 'package:news_app/splashscreen.dart';
import 'package:news_app/topic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: const Splashscreen(),
      routes: {
        '/country': (context) => const CountryPicker(),
        '/topic': (context) => const Topic(),
        '/language': (context) => const Language(),
        '/home': (context) => const NavigationExample(),
        // Add more routes here
      },
    );
  }
}
