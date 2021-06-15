import 'package:flutter/material.dart';
import 'package:inshorts_clone/screens/category_screen.dart';
import 'package:inshorts_clone/screens/home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        CategoryScreen(),
        HomePage(),
      ],
    );
  }
}
