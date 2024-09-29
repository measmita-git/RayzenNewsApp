import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app/screens/splash_screen.dart';

import 'package:showcaseview/showcaseview.dart';
import 'controller/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 885),
      minTextAdapt: true,
      // splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShowCaseWidget(
          builder: (context) => FutureBuilder<bool?>(
            future: PrefrencesManager().getIsFirstLogin(),
            builder: (context, isFirstSnapshot) {
              if (isFirstSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                bool isFirst = isFirstSnapshot.data ?? true;
                return SplashScreen(); // Modify this based on isFirst if needed
              }
            },
          ),
        ),
      ),
    );
  }
}
