import 'package:flutter/material.dart';
import 'login_screen.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, String>> _introData = [
    {
      "title": "Welcome",
      "subtitle": "Discover new features",
      "image": "assets/img1.jpg", // Add your own images
    },
    {
      "title": "Explore",
      "subtitle": "Find what you love",
      "image": "assets/img2.jpg",
    },
    {
      "title": "Get Started",
      "subtitle": "Join us today",
      "image": "assets/img3.jpg",
    },
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onDone() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Widget _buildPageContent(Map<String, String> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(data["image"]!, height: 300, width: 300),
        SizedBox(height: 20),
        Text(
          data["title"]!,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          data["subtitle"]!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _introData.length,
              itemBuilder: (context, index) {
                return _buildPageContent(_introData[index]);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _introData.length,
                  (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          _currentPage == _introData.length - 1
              ? ElevatedButton(
            onPressed: _onDone,
            child: Text('Get Started'),
          )
              : TextButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Next'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
