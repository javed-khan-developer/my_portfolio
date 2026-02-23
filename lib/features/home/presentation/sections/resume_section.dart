import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical: 60),
      color: Theme.of(context).primaryColor.withOpacity(0.02),
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 64),
          _buildResumeCard(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'RESUME',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Professional Credentials',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 32),
        ),
      ],
    );
  }

  Widget _buildResumeCard(BuildContext context, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 600,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          const Icon(Icons.picture_as_pdf, color: Colors.redAccent, size: 64),
          const SizedBox(height: 32),
          const Text(
            'Curriculum Vitae',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Updated September 2023',
            style: TextStyle(color: Colors.blueGrey),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye),
                label: const Text('View Online'),
              ),
              const SizedBox(width: 20),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text('Download PDF'),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn().scale();
  }
}
