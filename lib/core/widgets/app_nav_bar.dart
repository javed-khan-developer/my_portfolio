import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onSectionSelect;

  const AppNavBar({super.key, required this.onSectionSelect});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    final isMobile = MediaQuery.of(context).size.width < 800;

    return AppBar(
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor.withOpacity(0.8),
      elevation: 0,
      centerTitle: false,
      leading: isMobile ? null : null, // AppBar handles drawer automatically
      title: Text(
        'My Portfolio',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      actions: isMobile
          ? [
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => themeProvider.toggleTheme(),
              ),
              const SizedBox(width: 16),
            ]
          : [
              _NavBarItem(label: 'Home', onTap: () => onSectionSelect('Home')),
              _NavBarItem(
                label: 'About',
                onTap: () => onSectionSelect('About'),
              ),
              _NavBarItem(
                label: 'Projects',
                onTap: () => onSectionSelect('Projects'),
              ),
              _NavBarItem(
                label: 'Case Studies',
                onTap: () => onSectionSelect('Case Studies'),
              ),
              _NavBarItem(
                label: 'Security',
                onTap: () => onSectionSelect('Security'),
              ),
              _NavBarItem(
                label: 'Contact',
                onTap: () => onSectionSelect('Contact'),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => themeProvider.toggleTheme(),
              ),
              const SizedBox(width: 16),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _NavBarItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavBarItem({required this.label, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                  color: isHovered ? Theme.of(context).primaryColor : null,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isHovered ? 20 : 0,
                color: Theme.of(context).primaryColor,
                margin: const EdgeInsets.only(top: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
