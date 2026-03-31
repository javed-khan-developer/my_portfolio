import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/core/utils/responsive_helper.dart';
import '../../../../core/theme/app_theme.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

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
            _buildHeader(context),
            SizedBox(height: isMobile ? 20 : 32),
            if (isMobile)
              Column(
                children: [
                  _buildSummary(context),
                  SizedBox(height: isMobile ? 20 : 32),
                  _buildExperienceGrid(context, isMobile),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _buildSummary(context)),
                  const SizedBox(width: 60),
                  Expanded(
                    flex: 2,
                    child: _buildExperienceGrid(context, isMobile),
                  ),
                ],
              ),
          ],
        ),
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
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 12,
          ),
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 6),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ).animate().fadeIn(delay: 200.ms).scaleX(),
      ],
    );
  }

  Widget _buildSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.person_search_outlined,
              size: 28,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Engineering Scalable Solutions with a Performance-First Mindset',
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
            ),
          ],
        ).animate().fadeIn(delay: 300.ms),
        const SizedBox(height: 16),
        Text(
          'I am a passionate Software Engineer with expertise in building high-performance mobile applications using Flutter. My approach focuses on clean architecture, modular design, and seamless user experiences.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.6,
            fontSize: ResponsiveHelper.getResponsiveFontSize(
              context,
              14,
              maxSize: 15,
            ),
          ),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 12),
        Text(
          'With hands-on experience in building scalable solutions across E-commerce, Attendance Management, Visitor Management Systems (VMS), Marketing Platforms, and Audio Streaming applications, I specialize in developing robust Flutter applications that handle real-world business workflows while ensuring performance, reliability, and security.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.6,
            fontSize: ResponsiveHelper.getResponsiveFontSize(
              context,
              14,
              maxSize: 15,
            ),
          ),
        ).animate().fadeIn(delay: 500.ms),
      ],
    );
  }

  Widget _buildExperienceGrid(BuildContext context, bool isMobile) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: isMobile ? 1.3 : 0.9,
      children: [
        _buildStatCard(context, '3+', 'Years Experience', isMobile),
        _buildStatCard(context, '8+', 'Projects Delivered', isMobile),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String value,
    String label,
    bool isMobile,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMD),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: ResponsiveHelper.getResponsiveFontSize(
                context,
                28,
                maxSize: 32,
              ),
              fontWeight: FontWeight.w800,
              color: AppTheme.primaryColor,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  12,
                  maxSize: 14,
                ),
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().scale();
  }
}
