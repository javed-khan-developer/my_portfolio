import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/utils/responsive_helper.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

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
          _buildHeader(context),
           SizedBox(height: isMobile?32: 64),
          _buildTechGrid(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECH STACK',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          const Icon(Icons.code_off_outlined, size: 32),
          const SizedBox(height: 16),
          Text(
            'Technologies I Work With',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(
                  fontSize: ResponsiveHelper.getResponsiveFontSize(context, 32),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    ).animate().fadeIn().slideY();
  }

  Widget _buildTechGrid(BuildContext context, bool isMobile) {
    final techs = [
      {
        'name': 'Flutter',
        'icon': FontAwesomeIcons.flutter,
        'color': Colors.blue,
      },
      {'name': 'Dart', 'icon': Icons.code, 'color': Colors.teal},
      {
        'name': 'Firebase',
        'icon': FontAwesomeIcons.fire,
        'color': Colors.orange,
      },
      {'name': 'REST API', 'icon': Icons.api, 'color': Colors.green},
      {'name': 'Provider', 'icon': Icons.layers, 'color': Colors.indigo},
      {'name': 'Getx', 'icon': Icons.trip_origin, 'color': Colors.blueAccent},
      {'name': 'SQLite/Isar', 'icon': Icons.storage, 'color': Colors.cyan},
      {
        'name': 'Android/iOS Deployment',
        'icon': Icons.settings_input_component,
        'color': Colors.purple,
      },
      {
        'name': 'Android',
        'icon': FontAwesomeIcons.android,
        'color': Colors.lightGreen,
      },
      {'name': 'iOS', 'icon': FontAwesomeIcons.apple, 'color': Colors.grey},
      {
        'name': 'Git',
        'icon': FontAwesomeIcons.github,
        'color': Colors.redAccent,
      },
      {'name': 'MVC/MVVM', 'icon': Icons.view_quilt, 'color': Colors.brown},
      {'name': 'Secure Storage', 'icon': Icons.lock, 'color': Colors.green},
      {
        'name': 'Firebase Crashlytics',
        'icon': Icons.bug_report,
        'color': Colors.deepOrange,
      },
    ];

    return Wrap(
      spacing:isMobile?16: 32,
      runSpacing:isMobile?16: 32,
      alignment: WrapAlignment.center,
      children: techs
          .asMap()
          .entries
          .map((entry) => _buildTechCard(context, entry.value, entry.key,isMobile))
          .toList(),
    );
  }

  Widget _buildTechCard(
    BuildContext context,
    Map<String, dynamic> tech,
    int index,
    bool isMobile,
  ) {
    return Container(
      width: isMobile?135:  160,
      height: isMobile?135:  200,
      padding:  EdgeInsets.symmetric(vertical: isMobile?12: 24, horizontal: isMobile?12: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: (tech['color'] as Color).withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            tech['icon'] as IconData,
            size: 48,
            color: tech['color'] as Color,
          ),
          const SizedBox(height: 16),
          Text(
            tech['name'] as String,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 50).ms).scale().shimmer(delay: 2000.ms);
  }
}
