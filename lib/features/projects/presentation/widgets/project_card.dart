import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../data/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 380,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered
                ? Theme.of(context).primaryColor.withOpacity(0.5)
                : Theme.of(context).dividerColor.withOpacity(0.05),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.1 : 0.05),
              blurRadius: isHovered ? 30 : 20,
              offset: Offset(0, isHovered ? 15 : 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(22),
              ),
              child: Container(
                height: isMobile ? 80 : 200,
                width: isMobile ? size.width : 380,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Icon(
                  widget.project.projectIcon,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // _buildTechBadge(widget.project.technologies.first),
                  const SizedBox(height: 12),
                  Text(
                    widget.project.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.technologies
                        .take(3)
                        .map((t) => _buildSmallBadge(t))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      if (widget.project.githubLink != null)
                        _buildLinkButton(
                          Icons.code,
                          'GitHub',
                          widget.project.githubLink!,
                        ),
                      if (widget.project.playStoreLink != null)
                        _buildLinkButton(
                          Icons.shop,
                          'Play Store',
                          widget.project.playStoreLink!,
                        ),
                      if (widget.project.appStoreLink != null)
                        _buildLinkButton(
                          Icons.apple,
                          'App Store',
                          widget.project.appStoreLink!,
                        ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {}, // Navigate to detail
                        child: const Row(
                          children: [
                            Text('View Details'),
                            Icon(Icons.arrow_forward_rounded, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95));
  }

  Widget _buildSmallBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11)),
    );
  }

  Widget _buildLinkButton(IconData icon, String label, String url) {
    return IconButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon, size: 20),
      tooltip: label,
    );
  }
}
