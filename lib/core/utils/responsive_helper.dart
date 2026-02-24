import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    double width = MediaQuery.of(context).size.width;
    if (width < 450) {
      // Mobile - reduced font size
      return baseSize * 0.8;
    } else if (width < 800) {
      // Tablet - slightly reduced
      return baseSize * 0.9;
    } else {
      // Desktop - original size
      return baseSize;
    }
  }
}
