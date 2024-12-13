import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills:', style: Theme.of(context).textTheme.bodyLarge),
        Text(
            'Flutter, Dart, RESTful API, SQLite, Hive, Firebase, Bloc, Provider'),
        SizedBox(height: 16),
      ],
    );
  }
}
