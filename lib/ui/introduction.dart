import 'package:cheki_keja/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboardme/onboardme.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Index()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return OnboardingMe(
      /// Number of Pages for the screens
      numOfPage: 3,

      /// No of colors you want for your screen
      noOfBackgroundColor: 2,

      /// List of background colors => In descending order
      bgColor: [
        Color.fromARGB(255, 255, 101, 6),
        Color.fromARGB(255, 255, 161, 46),
      ],

      /// List of  Call-to-action action
      ctaText: [
        'Skip',
        'Get Started'
      ],

      /// List that maps your screen content
      screenContent: [
        {
          'Scr 1 Heading' : 'Quality Apartments',
          'Scr 1 Sub Heading' : 'Canvas through various quality high class apartments',
          'Scr 1 Image Path' : 'assets/images/onboard1.jpg',
        },
        {
          'Scr 2 Heading' : 'Pick What You Like',
          'Scr 2 Sub Heading' : 'Look,see and take what you like',
          'Scr 2 Image Path' : 'assets/images/onboard2.jpg',
        },
        {
          'Scr 3 Heading' : 'Comfort and Leisure at your hand',
          'Scr 3 Sub Heading' : 'Go through lots of comfortable and luxurious apartments',
          'Scr 3 Image Path' : 'assets/images/onboard3.jpg',
        },
      ],

      /// Bool for Circle Page Indicator
      isPageIndicatorCircle: true,

      /// Home Screen Route that lands after on-boarding
      homeRoute: '/index',
    );}
}
