// ignore: depend_on_referenced_packages
import 'package:country_list_pick/country_list_pick.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  Column(
          children: [
            const SizedBox(height: 20.0,),

            const Text("Choose Your Country", style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 30,
              fontWeight: FontWeight.w700,
              shadows: [Shadow(
                 blurRadius:2.0,  // shadow blur
                  color: Colors.grey, // shadow color
                  offset: Offset(2.0,0.0),
              )]
            ),),
            const SizedBox(height: 20.0,),

            const Text("Choose The Country to get you all your News from.", style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 15,
              fontWeight: FontWeight.w400
            ),),
            const SizedBox(height: 20.0,),

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
              // or
              // initialSelection: 'US'
              onChanged: (CountryCode? code) => {
                print(code?.name )
              },
            ),

            const SizedBox(height: 410.0),
            PrimaryButton(onTap: () {
                    Navigator.of(context).pushReplacement(
                    // MaterialPageRoute(builder: (_) => const MyHomePage(title: "Hello"))
                    MaterialPageRoute(builder: (_) => const Language())
                    );
                },
            text: "Next")
          ],
        )
      ),
    );
  }
}