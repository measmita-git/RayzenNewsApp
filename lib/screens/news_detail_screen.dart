// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../model/all_feed.dart';
//
// class NewsDetailScreen extends StatelessWidget {
//   final Blog newsItem;
//
//   const NewsDetailScreen({Key? key, required this.newsItem}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         automaticallyImplyLeading: false,
//         title: InkWell(
//           onTap: (){
//             Navigator.of(context).pop();
//           },
//             child: Icon(Icons.cancel_sharp,color: Colors.white,),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.only(top: screenHeight/3),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 newsItem.coverImg != null
//                     ? Image.network(
//                   newsItem.coverImg!,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 250,
//                 )
//                     : Container(
//                   height: 250,
//                   color: Colors.grey,
//                   child: Center(
//                     child: Icon(Icons.image_not_supported),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: screenHeight*0.15,left: screenWidth*0.04),
//                   child: Text(
//                     newsItem.title,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
//                   ),
//                 ),
//
//                 // Add more details as needed
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
