// ignore: depend_on_referenced_packages
import 'package:country_list_pick/country_list_pick.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:news_app/intro.dart';
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
        body: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              "Choose Your Country",
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
              "Choose The Country to get you all your News from.",
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
                    selectedCountry = code.name; // Store the selected country
                  });
                  await _saveCountry(code.name!); // Save to local storage
                  print("Saved Country: ${code.name}");
                }
              },
            ),
            // if (selectedCountry != null)
            //   Text(
            //     "Selected Country: $selectedCountry",
            //     style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
            //   ),
            const SizedBox(height: 410.0),
            PrimaryButton(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Language()),
                );
              },
              text: "Next",
            ),
          ],
        ),
      ),
    );
  }
}