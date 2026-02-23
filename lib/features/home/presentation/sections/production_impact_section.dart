import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductionImpactSection extends StatelessWidget {
  const ProductionImpactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical: 60),
      color: Theme.of(context).primaryColor.withOpacity(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 64),
          _buildImpactGrid(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'PRODUCTION IMPACT',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Real-World Performance Metrics',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildImpactGrid(BuildContext context, bool isMobile) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: isMobile ? 1 : 3,
      mainAxisSpacing: 32,
      crossAxisSpacing: 32,
      childAspectRatio: 1.5,
      children: [
        _buildImpactCard(context, Icons.trending_down, 'Crash-Free Sessions', '99.98%'),
        _buildImpactCard(context, Icons.speed, 'Startup Time Reduction', '70%'),
        _buildImpactCard(context, Icons.battery_charging_full, 'Battery Optimization', '40%'),
        _buildImpactCard(context, Icons.download_for_offline, 'App Size Reduction', '25MB'),
        _buildImpactCard(context, Icons.timer, 'API Latency Reduction', '300ms'),
        _buildImpactCard(context, Icons.analytics, 'User Retention Boost', '15%'),
      ],
    );
  }

  Widget _buildImpactCard(BuildContext context, IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Theme.of(context).primaryColor),
          const SizedBox(height: 20),
          Text(
            value,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 36,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blueGrey),
          ),
        ],
      ),
    ).animate().fadeIn().scale().shimmer(delay: 3000.ms);
  }
}
