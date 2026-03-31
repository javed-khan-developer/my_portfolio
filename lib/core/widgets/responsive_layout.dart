import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 360, name: 'MOBILE_SMALL'),
        const Breakpoint(start: 361, end: 600, name: 'MOBILE'),
        const Breakpoint(start: 601, end: 900, name: 'TABLET'),
        const Breakpoint(start: 901, end: 1200, name: 'LAPTOP'),
        const Breakpoint(start: 1201, end: 1920, name: 'DESKTOP'),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: child,
    );
  }
}
