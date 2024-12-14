// import 'package:flutter/material.dart';
// import 'package:myapp/widgets/achievements_widget.dart';
// import 'package:myapp/widgets/contact_info_widget.dart';
// import 'package:myapp/widgets/experience_widget.dart';
// import 'package:myapp/widgets/interests_widget.dart';
// import 'package:myapp/widgets/skills_widget.dart';

// class PortfolioPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Section with Gradient Background
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.white, Colors.purple],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                   borderRadius: const BorderRadius.vertical(
//                     bottom: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image
//                       backgroundColor: Colors.white,
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       'Mayur Chaudhari',
//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Flutter & Hybrid iOS Developer',
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             color: Colors.white70,
//                           ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               // Content Section
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SectionHeader(title: 'Contact Info'),
//                      ContactInfoWidget(),
//                     const SizedBox(height: 16),
//                     SectionHeader(title: 'Experience'),
//                      ExperienceWidget(),
//                     const SizedBox(height: 16),
//                     SectionHeader(title: 'Skills'),
//                      SkillsWidget(),
//                     const SizedBox(height: 16),
//                     SectionHeader(title: 'Achievements'),
//                      AchievementsWidget(),
//                     const SizedBox(height: 16),
//                     SectionHeader(title: 'Interests'),
//                      InterestsWidget(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SectionHeader extends StatelessWidget {
//   final String title;

//   const SectionHeader({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//     );
//   }
// }

import 'package:flutter/material.dart';


class AppGridScreen extends StatefulWidget {
  const AppGridScreen({super.key});

  @override
  _AppGridScreenState createState() => _AppGridScreenState();
}

class _AppGridScreenState extends State<AppGridScreen> {
  List<String> appLabels = List.generate(30, (index) => 'App ${index + 1}');
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredApps = appLabels
        .where((label) => label.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Search apps...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (query) {
            setState(() {
              searchQuery = query;
            });
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: filteredApps.length,
          itemBuilder: (context, index) {
            String appName = filteredApps[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppDetailScreen(appName: appName),
                  ),
                );
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text(
                      appName.substring(0, 1),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    appName,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppDetailScreen extends StatelessWidget {
  final String appName;

  const AppDetailScreen({super.key, required this.appName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appName)),
      body: Center(
        child: Text(
          appName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

