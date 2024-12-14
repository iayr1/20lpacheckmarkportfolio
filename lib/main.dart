import 'package:flutter/material.dart';
import 'package:myapp/core/theme/theme_manager.dart';
import 'package:myapp/features/splash/splash_screen.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  _MyPortfolioAppState createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mayur Chaudhari Portfolio',
      theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme,
      home: const SplashScreen(),
    );
  }
}
