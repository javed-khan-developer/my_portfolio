import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/core/utils/responsive_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: isMobile ? 30 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, isMobile),
          SizedBox(height: isMobile ? 32 : 64),
          if (isMobile)
            Column(
              children: [
                _buildContactInfo(context, isMobile),
                SizedBox(height: isMobile ? 32 : 64),
                // _buildContactForm(context, isMobile),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildContactInfo(context)),
                const SizedBox(width: 100),
                // Expanded(flex: 3, child: _buildContactForm(context)),
              ],
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
          'CONTACT ME',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.connect_without_contact_outlined, size: 32),
            const SizedBox(width: 16),
            Text(
              !isMobile
                  ? 'Let\'s Build Something Great Together'
                  : 'Let\'s Build Something\nGreat Together',
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

  Widget _buildContactInfo(BuildContext context, [bool isMobile = false]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your visions.',
          style: TextStyle(fontSize: 18, height: 1.6, color: Colors.blueGrey),
        ),
        SizedBox(height: isMobile ? 24 : 48),
        _buildInfoItem(
          context,
          Icons.email_outlined,
          'Email',
          'jkhan.kj862@gmail.com',
          onTap: () => launchUrl(Uri.parse('mailto:jkhan.kj862@gmail.com')),
        ),
        _buildInfoItem(
          context,
          Icons.phone_outlined,
          'Phone',
          '8948426729',
          onTap: () => launchUrl(Uri.parse('tel:8948426729')),
        ),
        _buildInfoItem(
          context,
          Icons.location_on_outlined,
          'Location',
          'Ghatkopar West, Mumbai, India',
          onTap: () => launchUrl(
            Uri.parse(
              'https://www.google.com/maps/search/?api=1&query=Ghatkopar+West,+Mumbai,+India',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Row(
            children: [
              Icon(icon, color: Theme.of(context).primaryColor, size: 28),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(value, style: const TextStyle(color: Colors.blueGrey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
