import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/responsive_helper.dart';

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;
    final padding = ResponsiveHelper.getResponsivePadding(
      context,
      vertical: isMobile ? 32 : 48,
    );

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            AppTheme.primaryColor.withOpacity(0.015),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, isMobile),
            SizedBox(height: isMobile ? 24 : 40),
            _buildSecurityGrid(context, isMobile),
          ],
        ),
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
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Hardening Digital Assets',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: ResponsiveHelper.getResponsiveFontSize(
              context,
              22,
              maxSize: 26,
            ),
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
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
        'title': 'API Authentication',
        'desc':
            'Managed access and refresh tokens with automatic session handling and token expiration checks.',
      },
      {
        'title': 'Root/Emulator Detection',
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

    if (isMobile) {
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: practices
            .map(
              (p) => _buildSecurityCard(
                context,
                p['title']!,
                p['desc']!,
                isMobile,
              ),
            )
            .toList(),
      );
    }

    // Desktop: Use GridView for uniform card sizing
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.0, // Square cards for consistency
      ),
      itemCount: practices.length,
      itemBuilder: (context, index) {
        final practice = practices[index];
        return _buildSecurityCard(
          context,
          practice['title']!,
          practice['desc']!,
          isMobile,
        );
      },
    );
  }

  Widget _buildSecurityCard(
    BuildContext context,
    String title,
    String desc,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMD),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.15),
          width: 1,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.shield_outlined,
            color: AppTheme.primaryColor,
            size: isMobile ? 28 : 32,
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                isMobile ? 14 : 15,
                maxSize: 16,
              ),
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              desc,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  11,
                  maxSize: 12,
                ),
                height: 1.4,
                color: Colors.blueGrey.shade700,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideX(begin: 0.1);
  }
}
