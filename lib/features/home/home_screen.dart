import 'package:flutter/material.dart';
import 'package:myapp/features/home/form_screen.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  bool _isHovering = false;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    // Fade animation for text
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Slide animation for right section (projects)
    _slideAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Scale animation for button
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1E1E), Color(0xFF121212)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 32.0, vertical: 20.0),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIntroSection(isMobile),
                  const SizedBox(height: 40),
                  _buildProjectsCard(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildIntroSection(isMobile)),
                  Expanded(child: _buildProjectsCard()),
                ],
              ),
      ),
    );
  }

  // Introduction Section
  Widget _buildIntroSection(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              "Hi, I'm Mayur Chaudhari,",
              style: TextStyle(
                fontSize: isMobile ? 30 : 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              "and I'm a Flutter Developer. 👁️‍🗨️",
              style: TextStyle(
                fontSize: isMobile ? 18 : 20,
                color: const Color(0xFFF7F7F7),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ScaleTransition(
            scale: _scaleAnimation,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovering = true),
              onExit: (_) => setState(() => _isHovering = false),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: _isHovering ? Colors.blue : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "WORK WITH ME",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fintech Projects Card
  Widget _buildProjectsCard() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.credit_card, size: 50, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "Developed Multiple\nFintech",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "1. Eazr\n2. CredDaily",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
