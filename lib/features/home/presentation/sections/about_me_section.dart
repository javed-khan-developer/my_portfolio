import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

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
           SizedBox(height: isMobile?24: 48),
          if (isMobile)
            Column(
              children: [
                _buildSummary(context),
                 SizedBox(height: isMobile?24: 48),
                _buildExperienceGrid(context),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildSummary(context)),
                const SizedBox(width: 80),
                Expanded(flex: 2, child: _buildExperienceGrid(context)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT ME',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 8),
        Container(
          width: 100,
          height: 4,
          color: Theme.of(context).primaryColor,
        ).animate().fadeIn(delay: 200.ms).scaleX(),
      ],
    );
  }

  Widget _buildSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Engineering Scalable Solutions with a Performance-First Mindset',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
        ).animate().fadeIn(delay: 300.ms),
        const SizedBox(height: 24),
        Text(
          'I am a passionate Software Engineer with expertise in building high-performance mobile applications using Flutter. My approach focuses on clean architecture, modular design, and seamless user experiences.',
          style: Theme.of(context).textTheme.bodyLarge,
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 16),
        Text(
          'With hands-on experience in building scalable solutions across E-commerce, Attendance Management, Visitor Management Systems (VMS), Marketing Platforms, and Audio Streaming applications, I specialize in developing robust Flutter applications that handle real-world business workflows while ensuring performance, reliability, and security.',
          style: Theme.of(context).textTheme.bodyLarge,
        ).animate().fadeIn(delay: 500.ms),
      ],
    );
  }

  Widget _buildExperienceGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(context, '3+', 'Years Experience'),
        _buildStatCard(context, '8+', 'Projects Delivered'),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ).animate().fadeIn().scale();
  }
}
