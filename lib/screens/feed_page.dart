import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/feed_page_controller.dart';
import '../model/all_feed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final PageController pageController = PageController();
  final FeedPageController signUpHomeController = Get.put(FeedPageController());
  bool _showAppBars = false;
  Blog? _currentNewsItem;
  bool isFirstTime = true;
  bool _showScrollDownMessage = true;

  @override
  void initState() {
    super.initState();
    checkFirstTime();
    _startScrollDownMessageTimer();

    if (signUpHomeController.resources.isNotEmpty) {
      setState(() {
        _currentNewsItem = signUpHomeController.resources.first;
      });
    }

    pageController.addListener(_pageChangeListener);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _pageChangeListener() {
    int currentPageIndex = pageController.page?.round() ?? 0;
    setState(() {
      _currentNewsItem = signUpHomeController.resources[currentPageIndex];
    });
  }

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
    setState(() {
      this.isFirstTime = isFirstTime;
    });
  }

  void _startScrollDownMessageTimer() {
    Timer(Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          _showScrollDownMessage = false;
        });
      }
    });
  }

  Future<void> _refreshNewsFeed() async {
    await signUpHomeController.fetchResources();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (signUpHomeController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      return Scaffold(
        appBar: _showAppBars
            ? AppBar(title: Text('My Feed'), backgroundColor: Colors.blueAccent)
            : null,
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 60.h,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.blueAccent),
                    onPressed: () {
                      // Share functionality
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.copy, color: Colors.blueAccent),
                    onPressed: () {
                      // Copy functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshNewsFeed,
          child: ListView.builder(
            controller: pageController,
            itemCount: signUpHomeController.resources.length,
            itemBuilder: (context, index) {
              return NewsCard(
                newsItem: signUpHomeController.resources[index],
                onNewsItemTapped: (newsItem) {
                  setState(() {
                    _currentNewsItem = newsItem;
                  });
                },
              );
            },
          ),
        ),
      );
    });
  }
}

class NewsCard extends StatelessWidget {
  final Blog newsItem;
  final ValueChanged<Blog> onNewsItemTapped;

  const NewsCard({required this.newsItem, required this.onNewsItemTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onNewsItemTapped(newsItem);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => NewsWebView(url: newsItem.urlToImage?? ''),
        //   ),
        // );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Image.network(
                newsItem.urlToImage ?? 'https://example.com/default-image.png',
                fit: BoxFit.cover,
                height: 200.h,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network('https://example.com/default-image.png');
                },
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsItem.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    newsItem.description,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
