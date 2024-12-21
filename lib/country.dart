// ignore: depend_on_referenced_packages

import 'package:country_list_pick/country_list_pick.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import "package:news_app/components/primary_button.dart";
import 'package:news_app/lang.dart';

void main() {
  runApp(const CountryPicker());
}

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<CountryPicker> {
  String? selectedCountry;
  static const String _savedCountryKey = 'selected_country'; // Key for storage

  @override
  void initState() {
    super.initState();
    _loadCountry();
  }

  // Function to store the selected country in local storage
  Future<void> _saveCountry(String countryName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_savedCountryKey, countryName);
    print("Saved Country: $countryName");
  }

  // Function to load the saved country from local storage
  Future<void> _loadCountry() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCountry = prefs.getString(_savedCountryKey);
    });
    print("Loaded Country: $selectedCountry");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const Icon(
                    Icons.public,
                    size: 100,
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Choose Your Country",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Choose the country to get all your news from.",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20.0),
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
                    initialSelection: '+252',
                    onChanged: (CountryCode? code) async {
                      if (code != null) {
                        setState(() {
                          selectedCountry =
                              code.name; // Store the selected country
                        });
                        await _saveCountry(code.name!); // Save to local storage
                        print("Saved Country: ${code.name}");
                      }
                    },
                  ),
                  const Spacer(),
                  PrimaryButton(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Language()),
                      );
                    },
                    text: "Next",
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ));
  }
}
