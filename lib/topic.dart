import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import "package:news_app/components/primary_button.dart";

void main() => runApp(const Topic());

class Topic extends StatefulWidget {
  const Topic({super.key});
  @override
  State<Topic> createState() => _TopicState();
}

class _TopicState extends State<Topic> {
  static const String _savedTopicsKey = 'selected_topics'; // Storage key

  // Example list of topics
  final List<String> topics = [
    "science",
    "sports",
    "business",
    "health",
    "entertainment",
    "tech",
    "politics",
    "food",
    "travel"
  ];

  // Map of topics to icons
  final Map<String, IconData> topicIcons = {
    "science": Icons.science,
    "sports": Icons.sports_football,
    "business": Icons.business,
    "health": Icons.health_and_safety,
    "entertainment": Icons.movie,
    "tech": Icons.computer,
    "politics": Icons.gavel,
    "food": Icons.fastfood,
    "travel": Icons.flight,
  };

  // Track selected topics
  final Set<String> selectedTopics = {};

  @override
  void initState() {
    super.initState();
    _loadSelectedTopics(); // Load saved topics on startup
  }

  // Function to save selected topics as a list
  Future<void> _saveSelectedTopics() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_savedTopicsKey, selectedTopics.toList());
    print("Saved Topics: $selectedTopics");
  }

  // Function to load saved topics
  Future<void> _loadSelectedTopics() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTopics = prefs.getStringList(_savedTopicsKey) ?? [];
    setState(() {
      selectedTopics.addAll(savedTopics);
    });
    print("Loaded Topics: $selectedTopics");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const Icon(
                    Icons.translate,
                    size: 100,
                    color: Colors.amber,
                  ),
                const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose Your Favorite Topics",
                  style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  ),
                ),
                ),
                const SizedBox(height: 10.0),
              // GridView inside Expanded for flexible height
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.5, // Adjust to make the box bigger
                  ),
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    final isSelected = selectedTopics.contains(topic);
                    final icon = topicIcons[topic] ?? Icons.topic;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedTopics.remove(topic);
                          } else {
                            selectedTopics.add(topic);
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(
                            color: isSelected
                                ? Colors.blue
                                : const Color.fromARGB(255, 255, 253, 253),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icon,
                              color: isSelected
                                  ? Colors.white
                                  : Colors
                                      .orange, // Change icon color to orange
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              topic,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(
                  height: 10.0), // Add space between the next button and topics

              // Next Button
              PrimaryButton(
                onTap: () async {
                  await _saveSelectedTopics(); // Save topics
                  print("Selected Topics: $selectedTopics");
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const NavigationBarApp()),
                  );
                },
                text: "Next",
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    ));
  }
}
