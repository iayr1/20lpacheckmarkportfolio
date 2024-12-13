import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/screens/portfolio_page.dart';
import 'package:myapp/theme/theme_manager.dart';
import 'package:device_frame/device_frame.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  @override
  _MyPortfolioAppState createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  final ScrollController _scrollController = ScrollController();
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mayur Chaudhari Portfolio',
      theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme,
      home: Scaffold(
        body: Column(
          children: [
            // Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Portfolio Title
                  Text(
                    'Mayur Chaudhari Portfolio',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  // Navigation Links
                  Row(
                    children: [
                      _buildNavItem('Home', 0),
                      const SizedBox(width: 20),
                      _buildNavItem('About', 1),
                      const SizedBox(width: 20),
                      _buildNavItem('Projects', 2),
                      const SizedBox(width: 20),
                      _buildNavItem('Contact', 3),
                    ],
                  ),
                  // Light/Dark Mode Toggle
                  IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });
                    },
                    tooltip:
                        isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                  ),
                ],
              ),
            ),
            // Body Content
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHomeSection(context),
                    _buildSection(
                      context,
                      title: 'About',
                      content:
                          'I am a passionate Flutter developer with expertise in building hybrid mobile applications for iOS and Android.',
                      color: Colors.green[50]!,
                    ),
                    _buildSection(
                      context,
                      title: 'Projects',
                      content:
                          'Here are some of the amazing projects I have worked on:\n- Portfolio Web App\n- Flutter E-Commerce App\n- Chat Application',
                      color: Colors.orange[50]!,
                    ),
                    _buildSection(
                      context,
                      title: 'Contact',
                      content:
                          'Reach out to me at:\nmayurflutter@gmail.com\n+91 8087205660',
                      color: Colors.pink[50]!,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        _scrollToSection(index);
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _scrollToSection(int index) {
    final sectionHeight = MediaQuery.of(context).size.height;
    _scrollController.animateTo(
      index * sectionHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildHomeSection(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: Colors.blue[50], // Light blue background color
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 200),
        // Left side: Professional photo
        Container(
          width: MediaQuery.of(context).size.width * 0.4, // 40% of the screen width
          color: Colors.blue[50], // Background color for the image section
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5), // Blue border
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow:  const [
                  BoxShadow(
                    color: Colors.black26, // Shadow color
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 5), // Offset of the shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Match border radius
                child: Image.asset(
                  'assets/photo.png', // Path to your image
                  fit: BoxFit.cover, // Ensure the image covers the available space
                ),
              ),
            ),
          ),
        ),

        // Right side: PortfolioPage inside a DeviceFrame
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: DeviceFrame(
              device: Devices.ios.iPhone13,
              isFrameVisible: true,
              screen: Builder(
                builder: (context) => AppGridScreen(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _buildSection(BuildContext context,
      {required String title,
      required String content,
      required Color color}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(32),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  String getRandomText() {
    final randomTexts = [
      "Welcome to My Portfolio!",
      "Dream Big, Code Bigger.",
      "Fluttering into the Future.",
      "Innovation Starts Here.",
      "Transforming Ideas into Reality."
    ];
    return randomTexts[Random().nextInt(randomTexts.length)];
  }
}
