import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:news_app/services/api_service.dart' as api;

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  static const String _savedCountryKey = 'selected_country';
  static const String _savedLanguageKey = 'selected_language';
  static const String _savedTopicsKey = 'selected_topics';

  String? selectedCountry;
  String? selectedLanguage;
  List<String>? selectedTopics = [];

  final List<Map> languages = [{"name":"English", "value":"en"}, {"name":"Arabic", "value":"ar"}];
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

  @override
  void initState() {
    super.initState();
    selectedCountry = api.country;
    selectedLanguage = api.lang;
    selectedTopics = api.topic;
  }

  Future<void> _saveCountry(String country) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_savedCountryKey, country);
    print("Saved Country: $country");
    api.loadUserSelects();
  }

  Future<void> _saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_savedLanguageKey, language);
    setState(() {
      selectedLanguage = language;
    });
    print("Saved Language: $language");
    api.loadUserSelects();
  }

  Future<void> _saveSelectedTopics() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_savedTopicsKey, selectedTopics ?? []);
    print("Saved Topics: $selectedTopics");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              const Text("Select Country:"),
              const Gap(80),
              CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: const Text('Pick your country'),
            ),
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: false,
              isDownIcon: true,
              showEnglishName: false,
              labelColor: Colors.blueAccent,
            ),
            initialSelection: selectedCountry ?? "US",
            onChanged: (CountryCode? code) async {
              if (code != null && code.name != null) {
                setState(() {
                  selectedCountry = code.code;
                });
                await _saveCountry(code.code!);
                print("Saved Country: ${code.name}");
              }
            },
          ),
            ],
          ),
          // Country Selection
          
          const SizedBox(height: 20),

          // Language Selection
          DropdownButtonFormField<dynamic>(
            value: "ar",
            items: languages.map((i) {
              return DropdownMenuItem(
                value: i['value'], 
                child: Text(i["name"]),
                );
            }).toList(),
            
            onChanged: (value) {
              if (value != null) {
                _saveLanguage(value);
              }
            },
            decoration: const InputDecoration(
              labelText: 'Select Language',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Topics Selection
          const Text('Select Topics:', style: TextStyle(fontSize: 16)),
          Wrap(
            spacing: 8.0,
            children: topics.map((topic) {
              return FilterChip(
                label: Text(topic),
                avatar: Icon(topicIcons[topic]),
                selected: selectedTopics?.contains(topic) ?? false,
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedTopics?.add(topic);
                    } else {
                      selectedTopics?.remove(topic);
                    }
                  });
                  _saveSelectedTopics();
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
