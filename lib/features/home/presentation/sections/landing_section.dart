import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/app_assets.dart';
import 'package:my_portfolio/core/utils/responsive_helper.dart';
import 'package:my_portfolio/core/services/file_service.dart';
import '../../../../core/theme/app_theme.dart';

class LandingSection extends StatelessWidget {
  final VoidCallback? onViewProjects;
  const LandingSection({super.key, this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;
    final padding = ResponsiveHelper.getResponsivePadding(
      context,
      horizontal: 24,
      vertical: isMobile ? 40 : 80,
    );

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height * 0.8),
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.03),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Subtle background decoration
          Positioned(
                top: -100,
                right: -100,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.08),
                        Theme.of(context).primaryColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 1500.ms)
              .scale(begin: Offset(0.8, 0.8), duration: 2000.ms),

          // Second decorative element
          Positioned(
                bottom: -50,
                left: -50,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.secondaryColor.withOpacity(0.06),
                        AppTheme.secondaryColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(delay: 500.ms, duration: 1500.ms)
              .scale(begin: Offset(0.6, 0.6), duration: 2000.ms),

          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: isMobile ? 1 : 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                              '👋 HELLO, I\'M',
                              style: GoogleFonts.inter(
                                fontSize:
                                    ResponsiveHelper.getResponsiveFontSize(
                                      context,
                                      isMobile ? 16 : 18,
                                      minSize: 14,
                                    ),
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryColor,
                                letterSpacing: 3,
                                height: 1.5,
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 300.ms, duration: 800.ms)
                            .slideX(
                              begin: -0.3,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                        SizedBox(height: isMobile ? 12 : 16),
                        Text(
                              'Mohammad Javed Khan\n(Flutter Developer)',
                              style: isMobile
                                  ? Theme.of(
                                      context,
                                    ).textTheme.displaySmall?.copyWith(
                                      height: 1.2,
                                      fontSize:
                                          ResponsiveHelper.getResponsiveFontSize(
                                            context,
                                            28,
                                            maxSize: 36,
                                          ),
                                      fontWeight: FontWeight.w800,
                                    )
                                  : Theme.of(
                                      context,
                                    ).textTheme.displayLarge?.copyWith(
                                      height: 1.1,
                                      fontSize:
                                          ResponsiveHelper.getResponsiveFontSize(
                                            context,
                                            52,
                                            maxSize: 64,
                                          ),
                                      fontWeight: FontWeight.w800,
                                    ),
                            )
                            .animate()
                            .fadeIn(delay: 500.ms, duration: 800.ms)
                            .slideX(
                              begin: -0.2,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                        SizedBox(height: isMobile ? 16 : 24),
                        Text(
                              'Specializing in designing, building, and optimizing scalable production-grade Android and iOS applications with Flutter.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    fontSize:
                                        ResponsiveHelper.getResponsiveFontSize(
                                          context,
                                          isMobile ? 16 : 18,
                                          minSize: 14,
                                        ),
                                    height: 1.6,
                                  ),
                            )
                            .animate()
                            .fadeIn(delay: 700.ms, duration: 800.ms)
                            .slideX(
                              begin: -0.1,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                        SizedBox(height: isMobile ? 32 : 48),
                        Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                ElevatedButton(
                                  onPressed: onViewProjects,
                                  child: const Text('View Projects'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppTheme.radiusMD,
                                      ),
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () => FileService.downloadResume(
                                    AppAssets.resume,
                                  ),
                                  child: const Text('Download Resume'),
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 32,
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppTheme.radiusMD,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                            .animate()
                            .fadeIn(delay: 900.ms, duration: 800.ms)
                            .slideY(
                              begin: 0.3,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                      ],
                    ),
                  ),
                  if (!isMobile) ...[
                    SizedBox(width: 60),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child:
                            Container(
                                  width: 450,
                                  height: 450,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppTheme.primaryColor,
                                      width: 3,
                                    ),
                                    image: const DecorationImage(
                                      image: AssetImage(AppAssets.profileImage),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppTheme.primaryColor
                                            .withOpacity(0.2),
                                        blurRadius: 80,
                                        spreadRadius: 30,
                                      ),
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        offset: Offset(0, 20),
                                      ),
                                    ],
                                  ),
                                )
                                .animate()
                                .fadeIn(delay: 600.ms, duration: 1000.ms)
                                .scale(
                                  begin: const Offset(0.7, 0.7),
                                  end: const Offset(1, 1),
                                  curve: Curves.easeOutCubic,
                                ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
