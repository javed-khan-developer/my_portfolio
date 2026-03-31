import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/build_whatsapp_url.dart';
import '../theme/app_theme.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 64,
        horizontal: isMobile ? 24 : 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: isMobile
                ? _buildMobileLayout(context, currentYear)
                : _buildDesktopLayout(context, currentYear),
          ),
          SizedBox(height: isMobile ? 32 : 48),
          Divider(
            height: 1,
            color: Theme.of(context).dividerColor.withOpacity(0.3),
          ),
          SizedBox(height: isMobile ? 24 : 32),
          _buildBottomBar(context, currentYear),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, int year) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohammad Javed Khan',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Text(
                  'Building production-grade digital experiences with Flutter. Focused on performance, architecture, and user-centric design.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        _buildSocialSection(context),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, int year) {
    return Column(
      children: [
        Text(
          'Mohammad Javed Khan',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 16),
        Text(
          'Building production-grade digital experiences with Flutter.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
        ),
        SizedBox(height: 24),
        _buildSocialSection(context),
      ],
    );
  }

  Widget _buildSocialSection(BuildContext context) {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width < 900
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.end,
      children: [
        Text(
          'CONNECT',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
            fontSize: 11,
            color: AppTheme.primaryColor,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSocialIcon(
              FontAwesomeIcons.linkedin,
              'https://www.linkedin.com/in/mohammad-javed-khan-89b554245?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
            ),
            SizedBox(width: 16),
            _buildSocialIcon(
              FontAwesomeIcons.github,
              'https://github.com/javed-khan-developer',
            ),
            SizedBox(width: 16),
            _buildSocialIcon(FontAwesomeIcons.whatsapp, buildWhatsappUrl()),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.platformDefault);
          }
        },
        borderRadius: BorderRadius.circular(AppTheme.radiusSM),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            icon,
            color: AppTheme.primaryColor.withOpacity(0.8),
            size: 22,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, int year) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            '© $year Javed AppWorks. All rights reserved.',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
