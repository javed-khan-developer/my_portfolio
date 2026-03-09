import 'package:flutter/material.dart';

class ResponsiveHelper {

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenWidth(BuildContext context) {
    return screenSize(context).width;
  }

  static double screenHeight(BuildContext context) {
    return screenSize(context).height;
  }

  static bool isSmallPhone(BuildContext context) =>
      screenWidth(context) < 360;

  static bool isPhone(BuildContext context) =>
      screenWidth(context) >= 360 && screenWidth(context) < 600;

  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 1024;

  static bool isLaptop(BuildContext context) =>
      screenWidth(context) >= 1024 && screenWidth(context) < 1440;

  static bool isDesktop(BuildContext context) =>
      screenWidth(context) >= 1440;

  /// Responsive font scaling
  static double getResponsiveFontSize(
      BuildContext context,
      double baseSize,
      ) {
    double width = screenWidth(context);
    double height = screenHeight(context);

    double scaleFactor;

    if (width < 360) {
      // Small phones
      scaleFactor = 0.75;
    } else if (width < 600) {
      // Normal phones
      scaleFactor = 0.85;
    } else if (width < 1024) {
      // Tablets / iPad
      scaleFactor = 0.95;
    } else if (width < 1440) {
      // Laptops
      scaleFactor = 1.0;
    } else {
      // Large desktop / wide monitors
      scaleFactor = 1.1;
    }

    // Landscape adjustments
    if (width > height) {
      scaleFactor *= 0.95;
    }

    return baseSize * scaleFactor;
  }
}