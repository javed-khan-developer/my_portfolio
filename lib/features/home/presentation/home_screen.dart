import 'package:flutter/material.dart';
import '../../../core/widgets/app_nav_bar.dart';
import '../../../core/widgets/responsive_layout.dart';
import 'sections/landing_section.dart';
import 'sections/about_me_section.dart';
import 'sections/tech_stack_section.dart';
import 'sections/projects_section.dart';
import 'sections/case_study_section.dart';
import 'sections/production_impact_section.dart';
import 'sections/security_section.dart';
import 'sections/performance_section.dart';
import 'sections/architecture_section.dart';
import 'sections/failure_handling_section.dart';
import 'sections/resume_section.dart';
import 'sections/contact_section.dart';
import '../../../core/widgets/app_footer.dart';

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
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return ResponsiveLayout(
      child: Scaffold(
        appBar: AppNavBar(onSectionSelect: _scrollToSection),
        drawer: isMobile ? _buildMobileDrawer() : null,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              LandingSection(key: _sectionKeys['Home']),
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
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                'KANISHKA',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ..._sectionKeys.keys.map((section) => ListTile(
                title: Text(section),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(section);
                },
              )),
        ],
      ),
    );
  }
}
