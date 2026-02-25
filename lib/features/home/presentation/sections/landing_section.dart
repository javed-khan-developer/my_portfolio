import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/app_assets.dart';
import 'package:my_portfolio/core/utils/responsive_helper.dart';
import 'package:my_portfolio/core/services/file_service.dart';

class LandingSection extends StatelessWidget {
  final VoidCallback? onViewProjects;
  const LandingSection({super.key, this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      constraints: BoxConstraints(
        minHeight: size.height * (isMobile ? 0.1 : 0.4),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: isMobile ? 16 : 40,
      ),
      child: Stack(
        children: [
          // Background Elements (Subtle gradients or shapes)
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.05),
              ),
            ),
          ).animate().fadeIn(duration: 1000.ms).scale(duration: 1000.ms),

          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '👋 HELLO, I\'M',
                      style: GoogleFonts.inter(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(
                          context,
                          isMobile ? 17 : 18,
                        ),
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 3,
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),
                    SizedBox(height: isMobile ? 12 : 16),
                    Text(
                      'Mohammad Javed Khan\n(Flutter Developer)',
                      style: isMobile
                          ? Theme.of(context).textTheme.displaySmall?.copyWith(
                              height: 1.1,
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                context,
                                26,
                              ),
                              fontWeight: FontWeight.bold,
                            )
                          : Theme.of(context).textTheme.displayMedium?.copyWith(
                              height: 1.1,
                              fontSize: ResponsiveHelper.getResponsiveFontSize(
                                context,
                                45,
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                    ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1),
                    SizedBox(height: isMobile ? 16 : 24),
                    Text(
                      'Specializing in designing, building, and optimizing scalable production-grade android and iOS applications with Flutter.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: ResponsiveHelper.getResponsiveFontSize(
                          context,
                          isMobile ? 18 : 20,
                        ),
                      ),
                    ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.1),
                    SizedBox(height: isMobile ? 24 : 48),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        ElevatedButton(
                          onPressed: onViewProjects,
                          child: const Text('View Projects'),
                        ),
                        OutlinedButton(
                          onPressed: () =>
                              FileService.downloadResume(AppAssets.resume),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Download Resume'),
                        ),
                      ],
                    ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2),
                  ],
                ),
              ),
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: Center(
                    child:
                        Container(
                              width: 400,
                              height: 400,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://media.licdn.com/dms/image/v2/D4D03AQGjkzaHh5jMZQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1681478444095?e=1773273600&v=beta&t=EKmAxz3i9WQ_GN1uEVuB8SEEa1jVSZp6DsnwJuJgq04',
                                  ), // Replace with actual avatar
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(
                                      context,
                                    ).primaryColor.withOpacity(0.2),
                                    blurRadius: 100,
                                    spreadRadius: 20,
                                  ),
                                ],
                              ),
                            )
                            .animate()
                            .fadeIn(delay: 500.ms)
                            .scale(begin: const Offset(0.8, 0.8)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
