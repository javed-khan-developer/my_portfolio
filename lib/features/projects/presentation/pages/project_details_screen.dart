import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/models/project_model.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: theme.primaryColor.withOpacity(0.1),
                child: Center(
                  child: Hero(
                    tag: 'project-icon-${project.name}',
                    child: Icon(
                      project.projectIcon ?? Icons.work_outline,
                      size: 100,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : size.width * 0.15,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              style: theme.textTheme.displayLarge?.copyWith(
                                fontSize: isMobile ? 32 : 48,
                              ),
                            ),
                            Text(
                              project.role,
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildLinksRow(project),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle(context, 'Overview'),
                  const SizedBox(height: 16),
                  Text(
                    project.description,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 40),
                  _buildSectionTitle(context, 'Technologies'),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: project.technologies
                        .map((tech) => _buildTechBadge(context, tech))
                        .toList(),
                  ),
                  const SizedBox(height: 40),
                  _buildSectionTitle(context, 'Key Features'),
                  const SizedBox(height: 16),
                  ...project.features.map(
                    (feature) => _buildBulletPoint(context, feature),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle(context, 'Challenges'),
                            const SizedBox(height: 16),
                            Text(
                              project.challenges,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!isMobile) const SizedBox(width: 48),
                      if (!isMobile)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(context, 'Solutions'),
                              const SizedBox(height: 16),
                              Text(
                                project.solutions,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  if (isMobile) ...[
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Solutions'),
                    const SizedBox(height: 16),
                    Text(
                      project.solutions,
                      style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                    ),
                  ],
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        fontSize: 14,
      ),
    );
  }

  Widget _buildTechBadge(BuildContext context, String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Text(
        tech,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }

  Widget _buildLinksRow(Project project) {
    return Row(
      children: [
        if (project.githubLink != null && project.githubLink!.isNotEmpty)
          _buildLinkIcon(Icons.code, 'GitHub', project.githubLink!),
        if (project.playStoreLink != null && project.playStoreLink!.isNotEmpty)
          _buildLinkIcon(Icons.shop, 'Play Store', project.playStoreLink!),
        if (project.appStoreLink != null && project.appStoreLink!.isNotEmpty)
          _buildLinkIcon(Icons.apple, 'App Store', project.appStoreLink!),
      ],
    );
  }

  Widget _buildLinkIcon(IconData icon, String tooltip, String url) {
    return IconButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon),
      tooltip: tooltip,
      iconSize: 28,
    );
  }
}
