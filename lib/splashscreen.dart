import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/intro.dart';
// import 'package:news_app/main.dart';
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
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {

      //* if User new first time Opening redirect to intro Screen 

      //* else Home Screen

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        // MaterialPageRoute(builder: (_) => const MyHomePage(title: "Hello"))
        MaterialPageRoute(builder: (_) => const NgamarOnboardingPage())
        
      );
    });
  }

  @override
  void dispose() {
    // super.dispose();
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
          Image(image: 
            AssetImage(
              "images/image-removebg-preview (1).png",
              ),
              width: 70.0,
              ),
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
      
      
            )
      ,
    );
  }
}