import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DevOpsSection extends StatelessWidget {
  const DevOpsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 64),
          _buildDevOpsGrid(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DEVOPS & RELEASE',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Automated Pipelines & Monitoring',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
        ),
      ],
    );
  }

  Widget _buildDevOpsGrid(BuildContext context, bool isMobile) {
    final items = [
      {'title': 'CI/CD Pipelines', 'desc': 'Automated builds with GitHub Actions and Fastlane for Play Store/App Store.'},
      {'title': 'Monitoring', 'desc': 'Firebase Crashlytics and Sentry for real-time error tracking and performance monitoring.'},
      {'title': 'Feature Flags', 'desc': 'Remote Config gated releases for controlled rollouts and A/B testing.'},
      {'title': 'Env Management', 'desc': 'Strict separation between Dev, QA, and Prod environments using Flavoring.'},
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isMobile ? 1 : 2,
      mainAxisSpacing: 32,
      crossAxisSpacing: 32,
      childAspectRatio: 2.5,
      children: items.map((item) => _buildDevOpsCard(context, item['title']!, item['desc']!)).toList(),
    );
  }

  Widget _buildDevOpsCard(BuildContext context, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.infinity, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1);
  }
}
