import 'package:flutter/material.dart';
import 'introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToIntroductionScreen();
  }

  _navigateToIntroductionScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => IntroductionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Icon(
          Icons.flutter_dash,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
