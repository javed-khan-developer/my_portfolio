import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CaseStudySection extends StatelessWidget {
  const CaseStudySection({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context,isMobile),
           SizedBox(height: isMobile?32: 64),
          _buildCaseStudyItem(
            context,
            isMobile,
            'Smart Attendance System with Proxy Detection',
            'Business Requirement: Track employee attendance in low-connectivity environments with accurate synchronization.',
            [
              'Face Camera Check-in Workflow: Captured and processed facial data for matching face & attendance marking.',
              'Automatic realtime Face Camera Check-in for branch employees.',
              'Fingerprint/Biometric Check-in for onsite employees.',
              'Proxy Detection: Implemented fake gps prevention and blink eye detection to prevent proxy check-ins.',
            ],
            'Ensured user friendly attendance marking with accurate synchronization and proxy prevention across multiple branches.',
            'lib/assets/images/case_study_3.png',
          ),
           SizedBox(height: isMobile?32:64),
          _buildCaseStudyItem(
            context,
            isMobile,
            'Audio Streaming App with Background Service',
            'Business Requirement: Provide uninterrupted scheduled audio streaming across Android and iOS devices.',
            [
              'Streaming: Implemented live audio playback using foreground service.',
              'Background Handling: Managed playback during app termination.',
              'Notification Controls for media playback.',
              'Scheduled playback using local notifications.',
              'Platform Channels for native functionality audio external microphone support',
            ],
            'Achieved stable background streaming across multiple Android and iOS devices.',
            'lib/assets/images/case_study_5.png',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ENGINEERING CASE STUDIES',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'How I Solve Complex Engineering Problems',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: isMobile?27: 32),
        ),
      ],
    );
  }

  Widget _buildCaseStudyItem(
    BuildContext context,
    bool isMobile,
    String title,
    String requirement,
    List<String> points,
    String impact,
    String image, {
    bool reverse = false,
  }) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(requirement, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 24),
        ...points.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(p)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Impact: $impact',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

    if (isMobile) {
      return Column(
        children: [  SizedBox(height:isMobile?16: 32), content],
      );
    }

    return Row(
      children: [
        if (reverse) Expanded(flex: 3, child: SizedBox()),
        if (reverse) const SizedBox(width: 64),
        Expanded(flex: 4, child: content),
        if (!reverse) const SizedBox(width: 64),
        if (!reverse) Expanded(flex: 3, child: SizedBox()),
      ],
    ).animate().fadeIn().slideY(begin: 0.1);
  }
}
