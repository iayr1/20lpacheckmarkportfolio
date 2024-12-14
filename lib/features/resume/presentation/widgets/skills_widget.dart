import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills:', style: Theme.of(context).textTheme.bodyLarge),
        const Text(
            'Flutter, Dart, RESTful API, SQLite, Hive, Firebase, Bloc, Provider'),
        const SizedBox(height: 16),
      ],
    );
  }
}
