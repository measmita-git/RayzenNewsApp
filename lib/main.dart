import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

