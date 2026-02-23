import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Text(
            'KANISHKA',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Built with ❤️ using Flutter Web',
            style: TextStyle(color: Colors.blueGrey, fontSize: 12),
          ),
          const SizedBox(height: 32),
          const Divider(indent: 100, endIndent: 100),
          const SizedBox(height: 32),
          Text(
            '© ${DateTime.now().year} Kanishka. All rights reserved.',
            style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
