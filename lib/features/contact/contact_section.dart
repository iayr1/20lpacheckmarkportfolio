import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
                // Toggle dark mode based on the state
                if (_isDarkMode) {
                  ThemeMode.dark;
                } else {
                  ThemeMode.light;
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResumeTile(),
            const ContactScreen(),
          ],
        ),
      ),
    );
  }
}

class ResumeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildSection(
      context,
      title: 'Resume',
      content: 'Check out my resume for more details on my professional journey.',
      color: Colors.blue[50]!,
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      context,
      title: 'Contact',
      content: 'Reach out to me at:\nmayurflutter@gmail.com\n+91 8087205660',
      color: Colors.pink[50]!,
    );
  }
}

Widget _buildSection(BuildContext context, {required String title, required String content, required Color color}) {
  return Container(
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