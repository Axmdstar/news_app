import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/intro.dart';
import 'package:news_app/services/api_service.dart' as api;
// import 'package:shared_preferences/shared_preferences.dart';

class AppColors {
  static const Color kdark = Color(0xff000000);
  static const Color klightdard = Color(0xff14213D);
  static const Color kgold = Color(0xffFCA311);
  static const Color kgrey = Color.fromARGB(255, 229, 229, 229);
  static const Color kwhite = Color.fromARGB(255, 255, 255, 255);
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

  @override
  void initState() {
    super.initState();
    api.loadUserSelects();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () async {

      //* if User new first time Opening redirect to intro Screen 
      if(api.country != null && api.topic != null && api.lang != null){
      if (!mounted) return;
      Navigator.pushNamed(context, '/home');
      } else {
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const NgamarOnboardingPage())
      );
      }
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
            "MineNews",
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