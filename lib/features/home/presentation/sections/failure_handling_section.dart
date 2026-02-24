import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FailureHandlingSection extends StatelessWidget {
  const FailureHandlingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical: isMobile?30: 60),
      color: Theme.of(context).primaryColor.withOpacity(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
           SizedBox(height: isMobile?32: 64),
          _buildFailureGrid(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAILURE HANDLING',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Building Resilient User Experiences',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
        ),
      ],
    );
  }

  Widget _buildFailureGrid(BuildContext context, bool isMobile) {
    final strategies = [
      {'title': 'Retry Mechanism', 'desc': 'Exponential backoff for transient network failures.'},
      {'title': 'Offline Fallback', 'desc': 'Background sync and data persistence (Hive/SQLite).'},
      {'title': 'Error Boundaries', 'desc': 'Graceful UI recovery from unexpected runtime exceptions.'},
      {'title': 'Network-Aware UI', 'desc': 'Real-time connectivity monitoring and adaptation.'},
    ];

    return Wrap(
      spacing: 32,
      runSpacing: 32,
      children: strategies.map((s) => _buildStrategyCard(context, s['title']!, s['desc']!, isMobile)).toList(),
    );
  }

  Widget _buildStrategyCard(BuildContext context, String title, String desc, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : (MediaQuery.of(context).size.width - 264) / 4,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Icon(Icons.report_problem_outlined, color: Colors.amber, size: 28),
          const SizedBox(height: 16),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
        ],
      ),
    ).animate().fadeIn().scale();
  }
}
