import 'package:flutter/material.dart';

class ContactInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information:',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 16),
        _buildContactTile(
          context,
          icon: Icons.email,
          title: 'mayurflutter@gmail.com',
        ),
        _buildContactTile(
          context,
          icon: Icons.phone,
          title: '+91 8087205660',
        ),
        _buildContactTile(
          context,
          icon: Icons.location_on,
          title: 'Mumbai, India',
        ),
        _buildContactTile(
          context,
          icon: Icons.link,
          title: 'Portfolio: mayur.click',
          isLink: true,
        ),
        _buildContactTile(
          context,
          icon: Icons.link,
          title: 'GitHub: github.com/iayr1',
          isLink: true,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildContactTile(BuildContext context,
      {required IconData icon, required String title, bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isLink
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).textTheme.bodyMedium?.color,
                    decoration: isLink ? TextDecoration.underline : null,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
