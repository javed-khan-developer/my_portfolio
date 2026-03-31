import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/responsive_helper.dart';

class FailureHandlingSection extends StatelessWidget {
  const FailureHandlingSection({super.key});

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
            _buildFailureGrid(context, isMobile),
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
          'FAILURE HANDLING',
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
              colors: [AppTheme.primaryColor, AppTheme.warningColor],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Building Great User Experiences',
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

  Widget _buildFailureGrid(BuildContext context, bool isMobile) {
    final strategies = [
      {
        'title': 'Retry Mechanism',
        'desc': 'Exponential backoff for transient network failures.',
      },
      {
        'title': 'Offline Fallback',
        'desc': 'Background sync and data persistence (Hive/SQLite).',
      },
      {
        'title': 'Network-Aware UI',
        'desc': 'Real-time connectivity monitoring and adaptation.',
      },
      {
        'title': 'Request Timeout',
        'desc': 'Abort long-running API calls to prevent UI blocking.',
      },
      {
        'title': 'Token Refresh',
        'desc': 'Auto refresh expired authentication tokens.',
      },
      {
        'title': 'Pagination',
        'desc': 'Efficient lazy loading for large datasets.',
      },
      {
        'title': 'Location Validation',
        'desc': 'Geofence-based attendance verification.',
      },
    ];

    if (isMobile) {
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: strategies
            .map(
              (s) => _buildStrategyCard(
                context,
                s['title']!,
                s['desc']!,
                isMobile,
              ),
            )
            .toList(),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      itemCount: strategies.length,
      itemBuilder: (context, index) {
        final strategy = strategies[index];
        return _buildStrategyCard(
          context,
          strategy['title']!,
          strategy['desc']!,
          isMobile,
        );
      },
    );
  }

  Widget _buildStrategyCard(
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
          color: AppTheme.warningColor.withOpacity(0.25),
          width: 1,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.report_problem_outlined,
            color: AppTheme.warningColor,
            size: isMobile ? 24 : 32,
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                isMobile ? 13 : 14,
                maxSize: 15,
              ),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              desc,
              textAlign: TextAlign.left,
              maxLines: 3,
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
    ).animate().fadeIn().scale();
  }
}
