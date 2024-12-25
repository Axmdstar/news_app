import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppColors {
  static const Color kdark = Color(0xff000000);
  static const Color klightdard = Color(0xff14213D);
  static const Color kgold = Color(0xffFCA311);
  static const Color kgrey = Color(0xffE5E5E5);
  static const Color kwhite = Color(0xffFFFFFF);
  // static const Color kPrimary = Color(0xFFD1A661);
  // static const Color kWhite = Color(0xFFFEFEFE);
  static LinearGradient customOnboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF110C1D).withOpacity(0.0),
      const Color(0xFF110C1D),
    ],
  );
}



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> 
with  SingleTickerProviderStateMixin
{
  static const String _savedCountryKey = 'selected_country'; // Key for storage
  static const String _savedLanguageKey = 'selected_language'; // Storage key
  static const String _savedTopicsKey = 'selected_topics'; // Storage key

  Future<bool> _loadUserSelects() async {
      final prefs = await SharedPreferences.getInstance();
      String? lang = prefs.getString(_savedLanguageKey);
      List<String>? topic = prefs.getStringList(_savedTopicsKey);
      String? country = prefs.getString(_savedCountryKey);
    
      print("Loaded : $lang");
      print("Loaded Topic: $topic");
      print("Loaded Country: $country");

      bool hasData =  lang != null && topic != null && country != null;
      return hasData;
    }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () async {

      //* if User new first time Opening redirect to intro Screen 
      if(await _loadUserSelects()){
        // ignore: use_build_context_synchronously
      if (!mounted) return;
      Navigator.pushNamed(context, '/home');
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => const NavigationBarApp()),
      // );
      
      } else {
        // ignore: use_build_context_synchronously
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Intro()));
      Navigator.of(context).pushReplacement(
        // MaterialPageRoute(builder: (_) => const MyHomePage(title: "Hello"))
        MaterialPageRoute(builder: (_) => const NgamarOnboardingPage())
      );

      }

      //* else Home Screen

      
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[AppColors.kgrey, AppColors.kwhite],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter )
        ),
        child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "JusNews",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 30,
              fontWeight: FontWeight.w700
            ),
            )
        ],
      ),
      )
    ),
    );
  }
}