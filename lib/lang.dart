import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:news_app/intro.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  Column(
          children: [
            const SizedBox(height: 20.0,),

            const Text("Choose Your Language", style: TextStyle(
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

            const Text("Choose The Language you want your News in.", style: TextStyle(
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
                    
                },
            text: "Next")
          ],
        )
      ),
    );
  }
}