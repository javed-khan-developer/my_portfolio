import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/build_whatsapp_url.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isMobile ? 24 : 100,
      ),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          if (isMobile)
            _buildMobileLayout(context, currentYear)
          else
            _buildDesktopLayout(context, currentYear),
          const SizedBox(height: 40),
          const Divider(height: 1),
          const SizedBox(height: 40),
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
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Building production-grade digital experiences with Flutter. Focused on performance, architecture, and user-centric design.',
                style: TextStyle(color: Colors.blueGrey, height: 1.6),
              ),
            ],
          ),
        ),
        const Spacer(),
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
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildSocialSection(context),
      ],
    );
  }

  Widget _buildSocialSection(BuildContext context) {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width < 800
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.end,
      children: [
        const Text(
          'CONNECT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 12,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSocialIcon(
              FontAwesomeIcons.linkedin,
              'https://www.linkedin.com/in/mohammad-javed-khan-89b554245?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(
              FontAwesomeIcons.github,
              'https://github.com/javed-khan-developer',
            ),
            const SizedBox(width: 20),
            _buildSocialIcon(FontAwesomeIcons.whatsapp, buildWhatsappUrl()),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.platformDefault);
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Icon(icon, color: Colors.blueGrey, size: 24),
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
            style: const TextStyle(color: Colors.blueGrey, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
