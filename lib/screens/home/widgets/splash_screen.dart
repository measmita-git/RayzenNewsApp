import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'user_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 2 seconds then check for userId
    Timer(const Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('userId');

      if (userId != null) {
        // Navigate to HomeScreen if userId is already stored
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(userId: userId)),
        );
      } else {
        // Navigate to UserSelectionScreen if no userId is found
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserSelectionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              height: height * 0.2,

            ),
          ),
          SizedBox(height: height * 0.04),
          Text(
            'News App',
            style: GoogleFonts.anton(
              letterSpacing: 0.6,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: height * 0.04),
          const SpinKitChasingDots(
            color: Colors.blue,
            size: 40,
          ),
        ],
      ),
    );
  }
}
