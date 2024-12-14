import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    bool isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1200;

    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                "About Mayur Chaudhari",
                style: TextStyle(
                  fontSize: isMobile ? 24 : (isTablet ? 28 : 32),
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent[100],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "By profession, I'm a Software Developer carrying a substantial experience of two years in this particular domain. My exposure is a mixture of working on Mobile App development, Hybrid Flutter, Swift, and Native Android Development. I regularly work with different IDEs such as Android Studio, Xcode, Visual Code, Postman, etc. I also have great experience with APIs, Firebase, Sockets, Payment Methods, Maps Integration, etc.",
                style: TextStyle(
                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                  color: Colors.grey[300],
                  height: 1.5, // Line height for better readability
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Container Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background Styling
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.grey[800]!, Colors.grey[700]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    // Content inside the Container
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.code_rounded,
                            size: isMobile ? 60 : (isTablet ? 70 : 80),
                            color: Colors.greenAccent[100],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Always Coding. Always Learning.",
                            style: TextStyle(
                              fontSize: isMobile ? 16 : (isTablet ? 18 : 20),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
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
}
