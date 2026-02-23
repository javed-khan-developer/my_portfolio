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
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 64),
          _buildCaseStudyItem(
            context,
            isMobile,
            'Enterprise Visitor Management System',
            'Business Requirement: Build a secure visitor check-in system with dynamic forms, device tracking, and host notification workflow.',
            [
              'Dynamic UI: Implemented runtime form rendering based on API-driven configuration.',
              'Validation Engine: Designed flexible validation logic for dynamically generated input fields.',
              'State Management: Managed form state and device tracking using Provider.',
              'Performance: Reduced unnecessary widget rebuilds during large form rendering.',
              'Network Handling: Implemented reusable API layer with retry and timeout handling.',
            ],
            'Reduced manual visitor entry time by 60% and improved check-in efficiency.',
            'lib/assets/images/case_study_1.png',
          ),

          _buildCaseStudyItem(
            context,
            isMobile,
            'Visitor Kiosk System with Hardware Integration',
            'Business Requirement: Develop a self-service kiosk-based visitor entry system with printer and QR scanner support.',
            [
              'Architecture: Separated UI, business logic, and hardware layer using modular structure.',
              'Hardware Integration: Used platform channels for thermal printer and QR scanner communication.',
              'Offline Support: Implemented offline-first visitor check-in with background sync.',
              'Failure Handling: Added retry mechanism for unstable network environments.',
              'Device Security: Restricted unauthorized usage using kiosk mode.',
            ],
            'Improved kiosk reliability with stable hardware communication.',
            'lib/assets/images/case_study_2.png',
            reverse: !isMobile,
          ),

          _buildCaseStudyItem(
            context,
            isMobile,
            'Smart Attendance System with Offline Sync',
            'Business Requirement: Track employee attendance in low-connectivity environments with accurate synchronization.',
            [
              'Offline First: Stored attendance logs locally using Hive.',
              'Background Sync: Implemented retry logic for failed submissions.',
              'QR / Biometric Check-in support.',
              'Optimized API calls to reduce redundant sync attempts.',
              'Dashboard Integration for real-time attendance monitoring.',
            ],
            'Ensured reliable attendance tracking even with intermittent connectivity.',
            'lib/assets/images/case_study_3.png',
          ),

          _buildCaseStudyItem(
            context,
            isMobile,
            'Biometric Fingerprint Authentication System',
            'Business Requirement: Integrate fingerprint SDK for secure employee identity verification.',
            [
              'SDK Integration: Connected native fingerprint SDK using platform channels.',
              'Secure Storage: Stored biometric reference data locally using Isar.',
              'Matching Logic: Implemented accurate fingerprint verification workflow.',
              'Performance: Optimized fingerprint capture and response handling.',
              'Error Handling: Managed SDK failure cases gracefully.',
            ],
            'Enabled secure and fast biometric-based authentication.',
            'lib/assets/images/case_study_4.png',
            reverse: isMobile,
          ),

          _buildCaseStudyItem(
            context,
            isMobile,
            'Audio Streaming App with Background Service',
            'Business Requirement: Provide uninterrupted scheduled audio streaming across Android OEM devices.',
            [
              'Streaming: Implemented live audio playback using foreground service.',
              'Background Handling: Managed playback during app termination.',
              'Battery Optimization: Handled OEM battery restrictions.',
              'Notification Controls for media playback.',
              'Scheduled playback using local notifications.',
            ],
            'Achieved stable background streaming across multiple Android devices.',
            'lib/assets/images/case_study_5.png',
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(requirement, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 24),
        ...points.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, size: 18, color: Theme.of(context).primaryColor),
                  const SizedBox(width: 12),
                  Expanded(child: Text(p)),
                ],
              ),
            )),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Impact: $impact',
            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    final imageWidget = Container(
      height: isMobile?70 :210,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
      ),
      child: const Center(child: Icon(Icons.cases_outlined, size: 64, color: Colors.blueGrey)),
    );

    if (isMobile) {
      return Column(
        children: [
          imageWidget,
          const SizedBox(height: 32),
          content,
        ],
      );
    }

    return Row(
      children: [
        if (reverse) Expanded(flex: 3, child: imageWidget),
        if (reverse) const SizedBox(width: 64),
        Expanded(flex: 4, child: content),
        if (!reverse) const SizedBox(width: 64),
        if (!reverse) Expanded(flex: 3, child: imageWidget),
      ],
    ).animate().fadeIn().slideY(begin: 0.1);
  }
}
