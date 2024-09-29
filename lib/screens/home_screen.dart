// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/feed_page_controller.dart';
// import '../model/all_feed.dart';
// import 'feed_page.dart';
// import 'news_web_view.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final FeedPageController signUpHomeController = Get.put(FeedPageController());
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize your controllers and any other setup
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (signUpHomeController.isLoading.value) {
//         return Center(child: CircularProgressIndicator());
//       }
//
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('News Home'),
//           centerTitle: true,
//           backgroundColor: Colors.blueAccent,
//         ),
//         body: RefreshIndicator(
//           onRefresh: () async {
//             await signUpHomeController.fetchResources();
//           },
//           child: ListView(
//             padding: EdgeInsets.symmetric(vertical: 10.0),
//             children: [
//               // Featured News Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Featured News',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
//                 ),
//               ),
//               SizedBox(
//                 height: 220, // Increased height for better visibility
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: signUpHomeController.resources.length,
//                   itemBuilder: (context, index) {
//                     return NewsCard(
//                       newsItem: signUpHomeController.resources[index],
//                       onNewsItemTapped: (newsItem) {
//                         // Navigate to web view or detailed page
//                         // Get.to(NewsWebView( url: '',)); // Example navigation
//                       },
//                     );
//                   },
//                 ),
//               ),
//
//               // Categories Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Categories',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
//                 ),
//               ),
//               // Implement categories list here (using GridView or ListView)
//               SizedBox(
//                 height: 100,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   children: signUpHomeController.resources.map((category) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Chip(
//                         label: Text(category.description, style: TextStyle(color: Colors.white)),
//                         backgroundColor: Colors.blueAccent, // Background color for better visibility
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//
//               // Recently Viewed News Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Recently Viewed News',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
//                 ),
//               ),
//               // Implement recently viewed news list here
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: signUpHomeController.recentlyViewedResources.length,
//                 itemBuilder: (context, index) {
//                   return NewsCard(
//                     newsItem: signUpHomeController.recentlyViewedResources[index],
//                     onNewsItemTapped: (newsItem) {
//                       // Navigate to web view or detailed page
//                       // Get.to(NewsWebView( url: '',)); // Example navigation
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
