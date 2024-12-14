import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/features/dashboard/navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isDarkMode = false; // Initialize isDarkMode

  @override
  void initState() {
    super.initState();

    // Navigate to NavigationScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationScreen(
            isDarkMode: isDarkMode,
            toggleTheme: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display Lottie animation for splash.json
            Lottie.asset(
              'assets/splash.json', // Path to your splash.json file
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Image.asset(
                'assets/vintage.png', // Path to your vintage.png file
              ),
            ),
          ],
        ),
      ),
    );
  }
}
