import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PerformanceSection extends StatelessWidget {
  const PerformanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: isMobile?30: 60,
      ),
      color: Theme.of(context).primaryColor.withOpacity(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
           SizedBox(height: isMobile?32: 64),
          _buildPerformanceContent(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PERFORMANCE ENGINEERING',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Optimizing for the Next Billion Users',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
        ),
      ],
    );
  }

  Widget _buildPerformanceContent(BuildContext context, bool isMobile) {
    final techniques = [
      {
        'title': 'Isolate Usage',
        'desc':
            'Offloaded heavy computations and background data processing to isolates to maintain smooth UI rendering.',
      },
      {
        'title': 'Widget Rebuild Optimization',
        'desc':
            'Minimized unnecessary rebuilds using selective listeners and efficient state management patterns.',
      },
      {
        'title': 'Lazy Loading & Pagination',
        'desc':
            'Implemented paginated API calls and lazy list rendering for large datasets like inventory and attendance logs.',
      },
      {
        'title': 'Offline-First Sync Optimization',
        'desc':
            'Designed local-first storage with controlled background synchronization to reduce redundant network calls.',
      },
      {
        'title': 'API Call Throttling & Retry Logic',
        'desc':
            'Optimized network requests with timeout handling, retry mechanisms, and reduced duplicate API triggers.',
      },
      {
        'title': 'Image Optimization & Caching',
        'desc':
            'Compressed images and implemented caching strategy to improve load time on low-bandwidth networks.',
      },
      {
        'title': 'Memory Management',
        'desc':
            'Ensured proper disposal of controllers and streams to prevent memory leaks in complex workflows.',
      },
      {
        'title': 'App Startup Optimization',
        'desc':
            'Reduced cold start time by deferring non-critical initialization and optimizing dependency loading.',
      },
    ];
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      children: techniques
          .map(
            (t) => _buildPerformanceItem(
              context,
              t['title']!,
              t['desc']!,
              isMobile,
            ),
          )
          .toList(),
    );
  }

  Widget _buildPerformanceItem(
    BuildContext context,
    String title,
    String desc,
    bool isMobile,
  ) {
    return Container(
      width: isMobile
          ? double.infinity
          : (MediaQuery.of(context).size.width - 280) / 2,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Theme.of(context).primaryColor, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideX(begin: -0.1);
  }
}
