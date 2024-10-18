// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:news_app/screens/feed_page.dart';
// import 'package:news_app/screens/home_screen.dart';
// import 'package:news_app/screens/main_news_feed.dart';
// import 'package:news_app/screens/news_detail_screen.dart';
// import 'package:showcaseview/showcaseview.dart';
// import 'controller/shared_preferences.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(800, 885),
//       minTextAdapt: true,
//       // splitScreenMode: true,
//       child: GetMaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: ShowCaseWidget(
//           builder: (context) => FutureBuilder<bool?>(
//             future: PrefrencesManager().getIsFirstLogin(),
//             builder: (context, isFirstSnapshot) {
//               if (isFirstSnapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else {
//
//                 return AnimatedSplashScreen(
//                   splash: 'assets/logo.png',
//                   splashIconSize: 200,
//                   nextScreen: HomeScreen(),
//                   splashTransition: SplashTransition.scaleTransition,
//                   backgroundColor: const Color.fromARGB(255, 240, 249, 245),
//                   duration: 4000,
//
//                 ); // Modify this based on isFirst if needed
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/screens/home/widgets/splash_screen.dart';
import 'bloc/news_bloc.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/widgets/splash_screen.dart';
import 'bloc/news_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (BuildContext context) => NewsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light, // Set brightness to light here
          ),
          useMaterial3: true,
          brightness: Brightness.light,  // Ensure brightness matches
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,  // Set brightness to dark here
          ),
          useMaterial3: true,
          brightness: Brightness.dark,  // Ensure brightness matches
        ),
        themeMode: ThemeMode.system,  // Automatically switch based on system theme
        home: SplashScreen(),
      ),
    );
  }
}




const spinkit = SpinKitChasingDots(
  color: Colors.blue,
  size: 40.0,
);

