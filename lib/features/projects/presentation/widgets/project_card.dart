import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/responsive_helper.dart';

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
    final isMobile = MediaQuery.of(context).size.width < 650;
    final isTablet = MediaQuery.of(context).size.width < 1000;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        transform: Matrix4.identity()..translate(0, isHovered ? -6 : 0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusMD),
          border: Border.all(
            color: isHovered
                ? AppTheme.primaryColor.withOpacity(0.25)
                : Theme.of(context).dividerColor.withOpacity(0.08),
            width: isHovered ? 1.2 : 1,
          ),
          boxShadow: isHovered ? AppTheme.hoverShadow : AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ICON SECTION
            Container(
              height: isMobile ? 100 : 140,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppTheme.primaryColor.withOpacity(0.08),
                    AppTheme.primaryColor.withOpacity(0.04),
                  ],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppTheme.radiusMD),
                ),
              ),
              child: Center(
                child: Icon(
                  widget.project.projectIcon,
                  size: isMobile ? 36 : 48,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),

            /// CONTENT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(
                          context,
                          isMobile ? 15 : 17,
                          maxSize: 18,
                        ),
                        height: 1.3,
                      ),
                    ).animate().fadeIn().scale(begin: Offset(0.95, 0.95)),

                    const SizedBox(height: 8),

                    Text(
                      widget.project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        height: 1.4,
                        fontSize: ResponsiveHelper.getResponsiveFontSize(
                          context,
                          12,
                          maxSize: 13,
                        ),
                      ),
                    ).animate().fadeIn(delay: 100.ms),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.technologies
                          .take(3)
                          .map((tech) => _buildTechChip(tech))
                          .toList(),
                    ).animate().fadeIn(delay: 200.ms),

                    const Spacer(),

                    Row(
                      children: [
                        if (widget.project.githubLink != null)
                          _buildStoreButton(
                            Icons.code_outlined,
                            widget.project.githubLink!,
                          ),

                        if (widget.project.playStoreLink != null)
                          _buildStoreButton(
                            Icons.play_arrow_rounded,
                            widget.project.playStoreLink!,
                          ),

                        if (widget.project.appStoreLink != null)
                          _buildStoreButton(
                            Icons.apple,
                            widget.project.appStoreLink!,
                          ),

                        const Spacer(),

                        _buildViewDetailsButton(context),
                      ],
                    ).animate().fadeIn(delay: 300.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.03, end: 0);
  }

  Widget _buildViewDetailsButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.push('/project-details', extra: widget.project);
        },
        borderRadius: BorderRadius.circular(AppTheme.radiusSM),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Details',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: AppTheme.primaryColor,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_rounded,
                size: 16,
                color: AppTheme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppTheme.radiusSM),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.12),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppTheme.primaryColor,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildStoreButton(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 20,
            color: AppTheme.primaryColor.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
