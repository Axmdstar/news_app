import 'package:animate_do/animate_do.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_app/country.dart';

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

class AppAssets {
  static String phone = 'images/pexels-leeloothefirst-7873573.jpg';
  static String newPapersOne = 'images/pexels-gulsahaydgn-18807133(1).jpg';
  static String newPapersTwo = 'images/thomas-charters-zAi2Is48-MA-unsplash.jpg';
}



class NgamarOnboardingPage extends StatefulWidget {
  const NgamarOnboardingPage({super.key});

  @override
  State<NgamarOnboardingPage> createState() => _NgamarOnboardingPageState();
}

class _NgamarOnboardingPageState extends State<NgamarOnboardingPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(onboardingList[_currentIndex].bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomGradientCard(
          gradient: AppColors.customOnboardingGradient,
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      onboarding: onboardingList[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomDotsIndicator(
                dotsCount: onboardingList.length,
                position: _currentIndex,
              ),
              const SizedBox(height: 30),
              
              PrimaryButton(
                onTap: () {
                  if (_currentIndex == onboardingList.length - 1) {
                    // Redirect to Choose Country
                    Navigator.of(context).pushReplacement(
                    // MaterialPageRoute(builder: (_) => const MyHomePage(title: "Hello"))
                    MaterialPageRoute(builder: (_) => const CountryPicker())
        
                    );
                    // print("Last");
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
                text: 'Continue',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}


class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            height: widget.height ?? 50,
            alignment: Alignment.center,
            width: widget.width ?? double.maxFinite,
            decoration: BoxDecoration(
              color: widget.color ?? AppColors.kgold,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.color == null ? AppColors.kgrey : Colors.black,
                  fontSize: widget.fontSize ?? 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingCard extends StatelessWidget {
  final Onboarding onboarding;
  const OnboardingCard({required this.onboarding, super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            onboarding.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.kgrey),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              onboarding.info,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kgrey),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGradientCard extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  const CustomGradientCard({
    required this.child,
    required this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: child,
    );
  }
}

class CustomDotsIndicator extends StatelessWidget {
  final int position;
  final int dotsCount;
  const CustomDotsIndicator({
    required this.dotsCount,
    required this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        color: AppColors.kgrey,
        size: const Size.square(8.0),
        activeSize: const Size(24, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        activeColor: AppColors.kgold,
      ),
    );
  }
}

class Onboarding {
  String bgImage;
  String title;
  String info;
  Onboarding({
    required this.bgImage,
    required this.title,
    required this.info,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
    bgImage: AppAssets.phone,
    title: 'Best News in Somali',
    info:
        'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ',
  ),
  Onboarding(
    bgImage: AppAssets.newPapersOne,
    title: "Up to Date News",
    info:
        'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ',
  ),
  Onboarding(
    bgImage: AppAssets.newPapersTwo,
    title: "Start Reading Now",
    info:
        '',
  ),
];