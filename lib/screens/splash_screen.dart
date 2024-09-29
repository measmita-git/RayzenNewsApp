import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feed_page.dart';
import 'language_selection_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
  }

  _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NewsScreen()),
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LanguagePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset('assets/logo.svg'), // Add your logo image in the assets directory
      ),
    );
  }
}
