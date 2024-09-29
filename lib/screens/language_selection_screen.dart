import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/dt_button.dart';
import 'feed_page.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  String _selectedLanguage = '';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));
  }

  void _onLanguageSelected(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    // _controller.forward();
  }

  void _handleSwipeUp() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NewsScreen()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value.dy * screenHeight),
                  child: child,
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/a.png',
                      height: screenHeight * 0.2,
                    ), // Add your language images to assets
                    SizedBox(height: screenHeight * 0.09),
                    Text(
                      'Choose your language',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),

                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.2,
                        right: screenWidth * 0.2,
                        top: screenHeight * 0.05,
                        bottom: screenHeight * 0.04,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: DTButton(
                              onClick: () => _onLanguageSelected('English'),
                              label: 'English',
                              buttonColor: _selectedLanguage == 'English'
                                  ? Colors.blue
                                  : Colors.transparent,
                              borderRadius: 10.r,
                              borderColor: Colors.grey,
                              width: screenWidth * 0.25,
                              height: screenHeight * 0.06,
                              textColor: _selectedLanguage == 'English'
                                  ? Colors.white
                                  : Colors.blue,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DTButton(
                              onClick: () => _onLanguageSelected('हिन्दी'),
                              label: 'हिन्दी',
                              buttonColor: _selectedLanguage == 'हिन्दी'
                                  ? Colors.blue
                                  : Colors.transparent,
                              borderRadius: 10,
                              borderColor: Colors.grey,
                              width: screenWidth * 0.25,
                              height: screenHeight * 0.06,
                              textColor: _selectedLanguage == 'हिन्दी'
                                  ? Colors.white
                                  : Colors.blue,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Language not available?',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'भाषा का चयन करें',
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            if (_selectedLanguage
                .isNotEmpty) // Render "Swipe up" only if a language is selected
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onVerticalDragEnd: (_) => _handleSwipeUp(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/arrow.json',
                          height: screenHeight*0.2,
                          width: screenWidth*0.4,
                          // Path to your Lottie animation file
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}