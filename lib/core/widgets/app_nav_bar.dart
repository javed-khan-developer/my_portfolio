import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../theme/app_theme.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onSectionSelect;
  final String? activeSection;

  const AppNavBar({
    super.key,
    required this.onSectionSelect,
    this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;
    final isMobile = MediaQuery.of(context).size.width < 900;

    return AppBar(
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor.withOpacity(0.85),
      elevation: 0,
      centerTitle: false,
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onSectionSelect('Home'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'J',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                'Javed AppWorks',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: isMobile
          ? [
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => themeProvider.toggleTheme(),
                tooltip: 'Toggle Theme',
              ),
              SizedBox(width: 8),
            ]
          : [
              _buildNavItem('Home', () => onSectionSelect('Home')),
              _buildNavItem('About', () => onSectionSelect('About')),
              _buildNavItem('Projects', () => onSectionSelect('Projects')),
              _buildNavItem(
                'Case Studies',
                () => onSectionSelect('Case Studies'),
              ),
              _buildNavItem('Security', () => onSectionSelect('Security')),
              _buildNavItem('Contact', () => onSectionSelect('Contact')),
              SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () => themeProvider.toggleTheme(),
                  tooltip: 'Toggle Theme',
                ),
              ),
              SizedBox(width: 16),
            ],
    );
  }

  Widget _buildNavItem(String label, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 4),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 2,
                width: 0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
