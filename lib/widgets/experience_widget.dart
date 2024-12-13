import 'package:flutter/material.dart';

class ExperienceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Work Experience:', style: Theme.of(context).textTheme.bodyLarge),
        const ListTile(
          title: Text('Flutter Developer at Eazr Digipayments Pvt Ltd'),
          subtitle: Text('June 2024 - Present'),
        ),
        const ListTile(
          title: Text('Full Stack Developer at Shareshiksha'),
          subtitle: Text('November 2023 - May 2024'),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
