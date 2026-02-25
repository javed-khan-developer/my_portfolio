import 'package:flutter/material.dart';
import '../../../../data/models/project_model.dart';
import '../../../projects/presentation/widgets/project_card.dart';
import 'package:my_portfolio/core/utils/responsive_helper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    final List<Project> projects = [
      Project(
        name: 'Our Attendance',
        description: 'A real-time employee attendance management system',
        features: [
          'Fingerprint Check-in',
          'Face Check-in',
          'Automatic Face Check-in',
          'Proxy Detection',
        ],
        technologies: [
          'Flutter',
          'Firebase Cloud Messaging',
          'Google ML Kit',
          'GetX',
          'REST API',
          'Sqflite',
          'Method Channels',
        ],

        role: 'Flutter Developer',
        challenges:
            'Ensuring accurate attendance sync in low-network environments & Prevent Proxy Attendance .',
        solutions:
            'Implemented offline-data caching & blink eye detection/fake GPS detection for proxy prevention.',
        playStoreLink:
            'https://play.google.com/store/apps/details?id=com.kspl.ourattendance',
        appStoreLink: '',
      ),

      Project(
        name: 'Entry IQ',
        description:
            'A kiosk-based Visitor Management System for secure office entry with real-time host notifications.',
        features: [
          'Visitor Check-in/Check-out',
          'QR Code Generation',
          'Dynamic Form Builder',
          'Thermal Printer Integration',
        ],
        technologies: [
          'Flutter',
          'Provider',
          'Firebase Crashlytics',
          'REST API',
        ],

        role: 'Flutter Engineer',
        challenges:
            'Handling hardware integration with thermal printers and scanners on kiosk devices',
        solutions:
            'Built a modular hardware abstraction layer using platform channels for stable device communication.',
        playStoreLink:
            'https://play.google.com/store/apps/details?id=com.kspl.vmsKiosk1',
        appStoreLink: 'https://apps.apple.com/us/app/entryiq/id6476648198',
      ),

      Project(
        name: 'HealthyU',
        description:
            'A scalable e-commerce application with product management, cart system, and secure checkout.',
        features: [
          'Product Listing & Filters',
          'Cart & Wishlist',
          'Order Tracking',
        ],
        technologies: ['Flutter', 'Riverpod', 'REST API', 'Firebase'],

        role: 'Flutter Developer',
        challenges:
            'Managing complex cart state and ensuring smooth checkout flow.',
        solutions:
            'Implemented centralized state management with optimized rebuild control and secure token handling.',
        playStoreLink: 'YOUR_PLAYSTORE_LINK',
      ),

      Project(
        name: 'KoMark',
        description:
            'A marketing automation mobile app for managing campaigns, posting photos and videos.',
        features: [
          'Push Notifications',
          'Submit Photos/Videos Post',
          'Deep Linking',
        ],
        technologies: ['Flutter', 'Firebase Messaging', 'REST API', 'GetX'],

        role: 'Mobile Application Developer',
        challenges:
            'Handling high-volume push notifications and deep link routing.',
        solutions:
            'Integrated FCM with proper background handlers and implemented dynamic route parsing.',
        playStoreLink:
            'https://play.google.com/store/apps/details?id=com.kspl.mark_app',
        appStoreLink: '',

      ),

      Project(
        name: 'My Nearby Masjid',
        description:
            'An audio streaming application providing live and scheduled Azan notifications.',
        features: [
          'Live Audio Streaming',
          'Background Playback',
          'Scheduled Notifications',
          'Location-based Timing',
        ],
        technologies: [
          'Flutter',
          'Audio Service',
          'Getx',
          'REST API',
          'Local Notifications',
          'Native Android/iOS code',
        ],

        role: 'Flutter Developer',
        challenges:
            'Ensuring uninterrupted background streaming across Android OEM devices.',
        solutions:
            'Optimized foreground service handling and implemented battery optimization handling logic.',
        playStoreLink:
            'https://play.google.com/store/apps/details?id=com.maqjaconsultancy.mymosque',
        appStoreLink: 'https://apps.apple.com/us/app/my-nearby-masjid/id6758878080',
      ),
      Project(
        name: 'Society Management System',
        description:
            'A residential society management application for managing residents, building/flats, maintenance billing, online payments.',
        features: [
          'Resident Management',
          'Maintenance Billing & Payment Tracking',
          'Complaint Management',
          'Notice Board & Announcements',
        ],
        technologies: [
          'Flutter',
          'Provider',
          'REST API',
          'Firebase Notifications',
          'Razorpay Integration',
        ],

        role: 'Flutter Developer',
        challenges:
            'Managing real-time communication between residents, security, and admin users.',
        solutions:
            'Implemented role-based access and real-time notification system for seamless communication.',
        playStoreLink: 'YOUR_PLAYSTORE_LINK',
        appStoreLink: '',
      ),
      Project(
        name: 'Inventory Management System',
        description:
            'A mobile inventory tracking solution for managing stock levels, product movement, and reporting.',
        features: ['Stock Management', 'Product Tracking', 'Inventory Reports'],
        technologies: ['Flutter', 'REST API', 'Firebase'],

        role: 'Flutter Developer',
        challenges:
            'Handling large inventory datasets without UI performance degradation.',
        solutions:
            'Optimized image using cache image and implemented pagination for efficient data loading.',
        githubLink: '',
      ),
      Project(
        name: 'Notes App',
        description: 'A note management application with offline support.',
        features: [
          'Create & Manage Notes',
          'Share Notes',
          'Language Translation',
        ],
        technologies: [
          'Flutter',
          'Cloud Firestore',
          'Getx',
          'Firebase',
          'Local Storage',
        ],

        role: 'Flutter Developer',
        challenges:
            'Maintaining consistency between local cached data and language translation.',
        solutions:
            'Implemented background sync strategy with conflict resolution for offline data handling and language translation.',
        githubLink: 'https://github.com/javed-khan-developer/cloud_note',
      ),
    ];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: isMobile ? 30 : 60,
      ),
      color: Theme.of(context).primaryColor.withOpacity(0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: isMobile ? 32 : 64),
          Wrap(
            spacing: 32,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: projects.map((p) => ProjectCard(project: p)).toList(),
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
          'PROJECTS',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.rocket_launch_outlined, size: 32),
            const SizedBox(width: 16),
            Text(
              'Featured Apps',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: ResponsiveHelper.getResponsiveFontSize(context, 32),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
