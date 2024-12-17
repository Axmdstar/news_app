import 'package:flutter/material.dart';
import 'package:news_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

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
    "science", "sports", "business", "health", "entertainment", "tech", "politics", "food", "travel"
  ];

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
        body: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              "Choose Your Favorite Topics",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 30,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    blurRadius: 2.0, // shadow blur
                    color: Colors.grey, // shadow color
                    offset: Offset(2.0, 0.0),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Your Favorite Topics Will be Viewed in MyNews Tab",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20.0),

            // GridView inside Expanded for flexible height
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3, // Adjust to fit topic text
                ),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  final isSelected = selectedTopics.contains(topic);

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
                        color: isSelected ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        topic,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

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
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const PrimaryButton({required this.onTap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
