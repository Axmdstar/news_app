import 'package:flutter/material.dart';
import 'package:news_app/Cards/card_4.dart';

void main() {
  runApp(const MaterialApp(
    home: Singlesoucre(),
  ));
}

class Singlesoucre extends StatefulWidget {
  final String? title;
  final String? sourceUrl;

  const Singlesoucre({super.key, this.title, this.sourceUrl});

  @override
  State<Singlesoucre> createState() => _SinglesoucreState();
}

class _SinglesoucreState extends State<Singlesoucre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "CNN"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.sourceUrl ?? "https://via.placeholder.com/150"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Text(
                  widget.title ?? "Title",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return 
                const Card4();
              },
            ),
          ),
          // Add more widgets here
        ],
      ),
    );
  }
}