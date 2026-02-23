import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
          if (isMobile)
            Column(
              children: [
                _buildContactInfo(context),
                const SizedBox(height: 64),
                _buildContactForm(context),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildContactInfo(context)),
                const SizedBox(width: 100),
                Expanded(flex: 3, child: _buildContactForm(context)),
              ],
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
          'CONTACT ME',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Let\'s Build Something Great Together',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your visions.',
          style: TextStyle(fontSize: 18, height: 1.6, color: Colors.blueGrey),
        ),
        const SizedBox(height: 48),
        _buildInfoItem(context, Icons.email_outlined, 'Email', 'kanishka@software.com'),
        _buildInfoItem(context, Icons.phone_outlined, 'Phone', '+91 99999 00000'),
        _buildInfoItem(context, Icons.location_on_outlined, 'Location', 'Remote / Hybrid'),
        const SizedBox(height: 48),
        Row(
          children: [
            _buildSocialIcon(FontAwesomeIcons.linkedinIn, () {}),
            _buildSocialIcon(FontAwesomeIcons.github, () {}),
            _buildSocialIcon(FontAwesomeIcons.twitter, () {}),
            _buildSocialIcon(FontAwesomeIcons.medium, () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 28),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(value, style: const TextStyle(color: Colors.blueGrey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon, size: 24, color: Colors.blueGrey),
      ),
    ).animate().fadeIn().scale();
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTextField('Full Name', Icons.person_outline),
          const SizedBox(height: 20),
          _buildTextField('Email Address', Icons.email_outlined),
          const SizedBox(height: 20),
          _buildTextField('Message', Icons.message_outlined, maxLines: 5),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Send Message'),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideX(begin: 0.1);
  }

  Widget _buildTextField(String label, IconData icon, {int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 0.1),
        ),
      ),
    );
  }
}
