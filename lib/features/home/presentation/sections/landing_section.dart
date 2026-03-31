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
    final isTablet = size.width >= 900 && size.width < 1200;

    // Dynamic padding based on screen size - more compact
    final horizontalPadding = isMobile ? 24.0 : (isTablet ? 40.0 : 80.0);
    final verticalPadding = isMobile ? 32.0 : (isTablet ? 48.0 : 64.0);

    // Reduced minimum height for less empty space
    final minHeight = isMobile ? size.height * 0.6 : size.height * 0.7;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
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
                top: -80,
                right: -80,
                child: Container(
                  width: isMobile ? 250 : 350,
                  height: isMobile ? 250 : 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.06),
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
                bottom: -40,
                left: -40,
                child: Container(
                  width: isMobile ? 200 : 280,
                  height: isMobile ? 200 : 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppTheme.secondaryColor.withOpacity(0.05),
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
              constraints: BoxConstraints(maxWidth: 1100),
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
                                      isMobile ? 15 : 17,
                                      minSize: 13,
                                    ),
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryColor,
                                letterSpacing: 2.5,
                                height: 1.4,
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 300.ms, duration: 800.ms)
                            .slideX(
                              begin: -0.3,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                        SizedBox(height: isMobile ? 10 : 14),
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
                                            26,
                                            maxSize: 32,
                                          ),
                                      fontWeight: FontWeight.w800,
                                    )
                                  : isTablet
                                  ? Theme.of(
                                      context,
                                    ).textTheme.displayMedium?.copyWith(
                                      height: 1.15,
                                      fontSize:
                                          ResponsiveHelper.getResponsiveFontSize(
                                            context,
                                            42,
                                            maxSize: 50,
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
                                            48,
                                            maxSize: 56,
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
                        SizedBox(height: isMobile ? 14 : 20),
                        Text(
                              'Specializing in designing, building, and optimizing scalable production-grade Android and iOS applications with Flutter.',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontSize:
                                        ResponsiveHelper.getResponsiveFontSize(
                                          context,
                                          isMobile ? 14 : 16,
                                          minSize: 13,
                                        ),
                                    height: 1.5,
                                  ),
                            )
                            .animate()
                            .fadeIn(delay: 700.ms, duration: 800.ms)
                            .slideX(
                              begin: -0.1,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            ),
                        SizedBox(height: isMobile ? 24 : 36),
                        Wrap(
                              spacing: 14,
                              runSpacing: 14,
                              children: [
                                ElevatedButton(
                                  onPressed: onViewProjects,
                                  child: const Text('View Projects'),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 14,
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
                                      horizontal: 28,
                                      vertical: 14,
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
                    SizedBox(width: isTablet ? 40 : 60),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child:
                            Container(
                                  width: isTablet ? 320 : 420,
                                  height: isTablet ? 320 : 420,
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
                                            .withOpacity(0.15),
                                        blurRadius: isTablet ? 60 : 80,
                                        spreadRadius: isTablet ? 20 : 30,
                                      ),
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.08),
                                        blurRadius: isTablet ? 30 : 40,
                                        offset: Offset(0, isTablet ? 15 : 20),
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
