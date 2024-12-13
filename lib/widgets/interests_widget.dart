import 'package:flutter/material.dart';

class InterestsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Interests:', style: Theme.of(context).textTheme.bodyLarge),
        Text('Badminton'),
      ],
    );
  }
}
