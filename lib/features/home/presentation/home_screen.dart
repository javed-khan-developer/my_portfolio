import 'package:flutter/material.dart';
import '../../../core/widgets/app_nav_bar.dart';
import '../../../core/widgets/responsive_layout.dart';
import 'sections/landing_section.dart';
import 'sections/about_me_section.dart';
import 'sections/tech_stack_section.dart';
import 'sections/projects_section.dart';
import 'sections/case_study_section.dart';
import 'sections/security_section.dart';
import 'sections/performance_section.dart';
import 'sections/architecture_section.dart';
import 'sections/failure_handling_section.dart';
import 'sections/resume_section.dart';
import 'sections/contact_section.dart';
import '../../../core/widgets/app_footer.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // Keys for scrolling to sections
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Tech': GlobalKey(),
    'Projects': GlobalKey(),
    'Case Studies': GlobalKey(),
    'Security': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return ResponsiveLayout(
      child: Scaffold(
        appBar: AppNavBar(onSectionSelect: _scrollToSection),
        drawer: isMobile ? _buildMobileDrawer() : null,
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(), // Smooth bouncing scroll for web
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
              children: [
                LandingSection(
                  key: _sectionKeys['Home'],
                  onViewProjects: () => _scrollToSection('Projects'),
                ),
                AboutMeSection(key: _sectionKeys['About']),
                TechStackSection(key: _sectionKeys['Tech']),
                ProjectsSection(key: _sectionKeys['Projects']),
                CaseStudySection(key: _sectionKeys['Case Studies']),
                // const ProductionImpactSection(),
                SecuritySection(key: _sectionKeys['Security']),
                const PerformanceSection(),
                const ArchitectureSection(),
                const FailureHandlingSection(),
                const ResumeSection(),
                ContactSection(key: _sectionKeys['Contact']),
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppTheme.radiusLG),
          bottomRight: Radius.circular(AppTheme.radiusLG),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppTheme.primaryColor,
                  child: CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage(AppAssets.profileImage),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Mohammad Javed Khan',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Divider(height: 1),
          ..._sectionKeys.keys.map(
            (section) => ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              minLeadingWidth: 0,
              title: Text(
                section,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(section);
              },
            ),
          ),
        ],
      ),
    );
  }
}
