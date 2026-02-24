import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

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
           SizedBox(height:isMobile?32: 64),
          _buildSecurityGrid(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SECURITY PRACTICES',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Hardening Digital Assets',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: isMobile?27: 32),
        ),
      ],
    );
  }

  Widget _buildSecurityGrid(BuildContext context, bool isMobile) {
    final practices = [
      {
        'title': 'Secure Token Storage',
        'desc':
            'Stored authentication tokens securely using Flutter Secure Storage with encrypted keychain support.',
      },
      {
        'title': 'API Authentication Handling',
        'desc':
            'Managed access and refresh tokens with automatic session handling and token expiration checks.',
      },
      {
        'title': 'Root / Emulator Detection',
        'desc':
            'Restricted application usage on rooted or emulated devices to prevent unauthorized access.',
      },
      {
        'title': 'SSL Pinning',
        'desc':
            'Implemented certificate pinning to prevent man-in-the-middle attacks on API communication.',
      },

      {
        'title': 'App Obfuscation',
        'desc':
            'Applied Flutter code obfuscation and Proguard/R8 rules for release build protection.',
      },

      {
        'title': 'Secure API Communication',
        'desc':
            'Validated API requests and handled network failures using retry and timeout mechanisms.',
      },
    ];
    return Wrap(
      spacing: 32,
      runSpacing: 32,
      children: practices
          .map(
            (p) =>
                _buildSecurityCard(context, p['title']!, p['desc']!, isMobile),
          )
          .toList(),
    );
  }

  Widget _buildSecurityCard(
    BuildContext context,
    String title,
    String desc,
    bool isMobile,
  ) {
    return Container(
      width: isMobile
          ? double.infinity
          : (MediaQuery.of(context).size.width - 264) / 3,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.redAccent.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.shield_outlined, color: Colors.redAccent, size: 32),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: const TextStyle(color: Colors.blueGrey, height: 1.5),
          ),
        ],
      ),
    ).animate().fadeIn().slideX(begin: 0.1);
  }
}
