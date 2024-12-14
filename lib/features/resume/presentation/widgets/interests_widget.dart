import 'package:flutter/material.dart';

class InterestsWidget extends StatelessWidget {
  const InterestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Interests:', style: Theme.of(context).textTheme.bodyLarge),
        const Text('Badminton'),
      ],
    );
  }
}
