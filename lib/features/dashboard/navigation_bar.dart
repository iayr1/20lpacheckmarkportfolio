import 'package:flutter/material.dart';
import 'package:myapp/features/home/home_screen.dart';
import '../about/about_section.dart';
import '../projects/project_section.dart';
import '../contact/contact_section.dart';

class NavigationScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const NavigationScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0; // Tracks the current section
  final ScrollController _scrollController = ScrollController(); // For desktop scrolling

  // Define your sections here
  final List<Widget> _sections = [
    const HomeSection(),
    const AboutSection(),
    const ProjectsSection(),
    const ContactSection(),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (MediaQuery.of(context).size.width > 800) {
      // Desktop: Scroll to the respective section
      final sectionHeight = MediaQuery.of(context).size.height;
      _scrollController.animateTo(
        sectionHeight * index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: isDesktop
          ? _buildDesktopView() // Single-page website layout for desktop
          : _buildMobileView(), // Screen-based navigation for mobile
      bottomNavigationBar: isDesktop ? null : _buildMobileBottomNavigationBar(),
    );
  }

  // Desktop View: Single-page website with scrollable sections
  Widget _buildDesktopView() {
    return Column(
      children: [
        _buildDesktopNavigationBar(),
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: List.generate(
                _sections.length,
                (index) => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: _sections[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Mobile View: IndexedStack with screen-like navigation
  Widget _buildMobileView() {
    return IndexedStack(
      index: _currentIndex,
      children: _sections,
    );
  }

  // Desktop Navigation Bar
  Widget _buildDesktopNavigationBar() {
    return Container(
      color: widget.isDarkMode ? Colors.grey[900] : Colors.orange,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Logo
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.circle,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "Mayur",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          // Right Side: Navigation Items
          Row(
            children: [
              for (int i = 0; i < _sections.length; i++) _buildDesktopNavItem(i),
              const SizedBox(width: 20), // Add spacing for the toggle button
              ElevatedButton(
                onPressed: () {
                  // Custom CTA Button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text(
                  "Get Started Now",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Desktop Navigation Item
  Widget _buildDesktopNavItem(int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onNavTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          _getLabelForIndex(index),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Mobile Bottom Navigation Bar
  Widget _buildMobileBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: widget.isDarkMode ? Colors.grey[900] : Colors.orange,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      items: List.generate(
        _sections.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(_getIconForIndex(index)),
          label: _getLabelForIndex(index),
        ),
      ),
    );
  }

  // Helper functions for icons and labels
  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.info;
      case 2:
        return Icons.work;
      case 3:
        return Icons.contact_mail;
      default:
        return Icons.help;
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "About";
      case 2:
        return "Projects";
      case 3:
        return "Contact";
      default:
        return "";
    }
  }
}
