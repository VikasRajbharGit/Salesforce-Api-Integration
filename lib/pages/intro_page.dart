import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';
import 'package:salesforce/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  final int _pageCount = 2;

  void onDoneTap(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GFIntroScreen(
        color: Colors.blueGrey,
        slides: slides(context),
        pageController: _pageController,
        currentIndex:
            _pageController.hasClients ? _pageController.page.floor() : 0,
        pageCount: _pageCount,
        introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
          pageController: _pageController,
          pageCount: _pageCount,
          currentIndex:
              _pageController.hasClients ? _pageController.page.floor() : 0,
          onForwardButtonTap: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          },
          onBackButtonTap: () {
            _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut);
          },
          navigationBarColor: Colors.white,
          showDivider: false,
          activeColor: GFColors.SUCCESS,
          onDoneTap: () {
            onDoneTap(context);
          },
          onSkipTap: () {
            onDoneTap(context);
          },
        ),
      ),
    );
  }
}

List<Widget> slides(BuildContext context) {
  Map<String, String> splashTitles = {
    "splash_1.png": "Salesforce App for on site sales executives",
    "splash_2.png": "Hassle free Contact records maintenance"
  };
  List<Widget> widgets = [];
  splashTitles.forEach((key, value) {
    widgets.add(Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            'images/$key',
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Text(
              "$value",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    ));
  });
  return widgets;
}
