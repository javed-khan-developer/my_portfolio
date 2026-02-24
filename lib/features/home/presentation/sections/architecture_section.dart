import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical:isMobile?30: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context,isMobile),
           SizedBox(height: isMobile?32: 64),
          _buildArchitectureDiagram(context, isMobile),
        ],
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
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Modular & Scalable Design',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: isMobile?27: 32),
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
          padding: const EdgeInsets.all(48),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.1)),
          ),
          child: Column(
            children: [
              _buildLayer(context, 'PRESENTATION LAYER', Colors.blue, ['UI Components', 'State Management', 'View Models']),
              _buildArrow(),
              _buildLayer(context, 'DOMAIN LAYER', Colors.green, ['Use Cases', 'Entities', 'Repository Interfaces']),
              _buildArrow(),
              _buildLayer(context, 'DATA LAYER', Colors.orange, ['Repositories', 'Data Sources', 'Models/DTOs']),
            ],
          ),
        ).animate().fadeIn().scale(begin: const Offset(0.9, 0.9)),
      ),
    );
  }

  Widget _buildLayer(BuildContext context, String name, Color color, List<String> items) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5), width: 2),
      ),
      child: Column(
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 18)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: items.map((item) => _buildItemChip(item, color)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildItemChip(String text, Color color) {
    return Chip(
      label: Text(text, style: const TextStyle(fontSize: 12)),
      backgroundColor: Colors.white.withOpacity(0.05),
      side: BorderSide(color: color.withOpacity(0.2)),
    );
  }

  Widget _buildArrow() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Icon(Icons.arrow_downward, color: Colors.blueGrey),
    );
  }
}
