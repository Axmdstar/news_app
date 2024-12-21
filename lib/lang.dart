import 'package:news_app/topic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import "package:news_app/components/primary_button.dart";

void main() {
  runApp(const Language());
}

class Language extends StatefulWidget {
  const Language({super.key});
  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  static const String _savedLanguageKey = 'selected_language'; // Storage key
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    _loadLanguage(); // Load saved language on startup
  }

  // Function to save the selected language to local storage
  Future<void> _saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_savedLanguageKey, language);
    print("Saved Language: $language");
  }

  // Function to load the saved language from local storage
  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString(_savedLanguageKey);
    });
    print("Loaded Language: $selectedLanguage");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const Icon(
                    Icons.translate,
                    size: 100,
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 10.0),
                  const Center(
                    child: Text(
                      "Choose Your Language",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  

                  // Language Selection
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Available Languages:",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RadioListTile<String>(
                          title: const Text("English"),
                          
                          value: "English",
                          groupValue: selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value;
                            });
                            _saveLanguage(value!); // Save to storage
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text("Arabic"),
                          value: "Arabic",
                          groupValue: selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value;
                            });
                            _saveLanguage(value!); // Save to storage
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PrimaryButton(
            onTap: () {
              if (selectedLanguage == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please select a language."),
                  ),
                );
              } else {
                // Proceed to the next step
                print("Selected Language: $selectedLanguage");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Topic()),
                );
              }
            },
            text: "Next",
          ),
        ),
      ),
    );
  }
}
