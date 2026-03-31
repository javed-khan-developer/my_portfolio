import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/responsive_helper.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

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
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, isMobile),
            SizedBox(height: isMobile ? 24 : 40),
            _buildArchitectureDiagram(context, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Center(
      child: Column(
        children: [
          Text(
            'ARCHITECTURE VISUALIZATION',
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
            'Modular & Scalable Design',
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
      ),
    );
  }

  Widget _buildArchitectureDiagram(BuildContext context, bool isMobile) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(isMobile ? 24 : 40),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(AppTheme.radiusLG),
            border: Border.all(
              color: AppTheme.primaryColor.withOpacity(0.1),
              width: 1,
            ),
            boxShadow: AppTheme.cardShadow,
          ),
          child: Column(
            children: [
              _buildLayer(context, 'PRESENTATION LAYER', Colors.blue, [
                'UI Components',
                'State Management',
                'View Models',
              ], isMobile),
              _buildArrow(),
              _buildLayer(context, 'DOMAIN LAYER', Colors.green, [
                'Use Cases',
                'Entities',
                'Repository Interfaces',
              ], isMobile),
              _buildArrow(),
              _buildLayer(context, 'DATA LAYER', Colors.orange, [
                'Repositories',
                'Data Sources',
                'Models/DTOs',
              ], isMobile),
            ],
          ),
        ).animate().fadeIn().scale(begin: const Offset(0.9, 0.9)),
      ),
    );
  }

  Widget _buildLayer(
    BuildContext context,
    String name,
    Color color,
    List<String> items,
    bool isMobile,
  ) {
    return Container(
      width: isMobile ? 280 : 360,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppTheme.radiusMD),
        border: Border.all(color: color.withOpacity(0.4), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: color,
              fontSize: isMobile ? 13 : 15,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: isMobile ? 10 : 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) => _buildItemChip(item, color)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildItemChip(String text, Color color) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      backgroundColor: Colors.transparent,
      side: BorderSide(color: color.withOpacity(0.3)),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }

  Widget _buildArrow() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Icon(Icons.arrow_downward, color: Colors.blueGrey),
    );
  }
}
