import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveHelper {
  // Breakpoint constants
  static const double mobileSmallMax = 360;
  static const double mobileLargeMax = 600;
  static const double tabletMax = 900;
  static const double laptopMax = 1200;
  static const double desktopMax = 1920;

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
      screenWidth(context) < mobileSmallMax;

  static bool isPhone(BuildContext context) =>
      screenWidth(context) >= mobileSmallMax &&
      screenWidth(context) < mobileLargeMax;

  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= mobileLargeMax &&
      screenWidth(context) < tabletMax;

  static bool isLaptop(BuildContext context) =>
      screenWidth(context) >= tabletMax && screenWidth(context) < laptopMax;

  static bool isDesktop(BuildContext context) =>
      screenWidth(context) >= laptopMax && screenWidth(context) < desktopMax;

  static bool is4K(BuildContext context) => screenWidth(context) >= desktopMax;

  /// Get current breakpoint name
  static String getBreakpoint(BuildContext context) {
    final width = screenWidth(context);
    if (width < mobileSmallMax) return 'MOBILE';
    if (width < mobileLargeMax) return 'MOBILE';
    if (width < tabletMax) return 'TABLET';
    if (width < laptopMax) return 'LAPTOP';
    if (width < desktopMax) return 'DESKTOP';
    return '4K';
  }

  /// Responsive font scaling with fluid typography
  static double getResponsiveFontSize(
    BuildContext context,
    double baseSize, {
    double? minSize,
    double? maxSize,
  }) {
    double width = screenWidth(context);
    double height = screenHeight(context);

    // Fluid scaling factor based on screen width
    double scaleFactor;

    if (width < mobileSmallMax) {
      // Small phones - scale down
      scaleFactor = 0.75 + (width / mobileSmallMax) * 0.1;
    } else if (width < mobileLargeMax) {
      // Normal phones - gradual scale up
      scaleFactor =
          0.85 +
          ((width - mobileSmallMax) / (mobileLargeMax - mobileSmallMax)) * 0.1;
    } else if (width < tabletMax) {
      // Tablets / iPad
      scaleFactor =
          0.95 +
          ((width - mobileLargeMax) / (tabletMax - mobileLargeMax)) * 0.05;
    } else if (width < laptopMax) {
      // Laptops - standard size
      scaleFactor = 1.0;
    } else if (width < desktopMax) {
      // Desktops - slight scale up
      scaleFactor =
          1.0 + ((width - laptopMax) / (desktopMax - laptopMax)) * 0.1;
    } else {
      // Large desktop / wide monitors
      scaleFactor = 1.1;
    }

    // Landscape mode adjustment
    if (width > height) {
      scaleFactor *= 0.95;
    }

    double calculatedSize = baseSize * scaleFactor;

    // Apply min/max constraints if provided
    if (minSize != null)
      calculatedSize = calculatedSize.clamp(minSize, double.infinity);
    if (maxSize != null) calculatedSize = calculatedSize.clamp(0, maxSize);

    return calculatedSize;
  }

  /// Get responsive padding based on screen size
  static EdgeInsets getResponsivePadding(
    BuildContext context, {
    double horizontal = 24,
    double vertical = 32,
  }) {
    final width = screenWidth(context);

    if (width < mobileSmallMax) {
      return EdgeInsets.symmetric(horizontal: 16, vertical: vertical * 0.75);
    } else if (width < mobileLargeMax) {
      return EdgeInsets.symmetric(horizontal: 20, vertical: vertical * 0.85);
    } else if (width < tabletMax) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 1.2,
        vertical: vertical,
      );
    } else if (width < laptopMax) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 1.5,
        vertical: vertical * 1.2,
      );
    } else {
      return EdgeInsets.symmetric(horizontal: 100, vertical: vertical * 1.5);
    }
  }

  /// Get max content width for better readability
  static double getMaxContentWidth(BuildContext context) {
    final width = screenWidth(context);
    if (width < tabletMax) return width;
    if (width < laptopMax) return 800;
    if (width < desktopMax) return 1000;
    return 1200; // Cap at 1200px for large screens
  }

  /// Get grid column count for responsive layouts
  static int getGridColumnCount(double width) {
    if (width < 650) return 1;
    if (width < 1000) return 2;
    if (width < 1400) return 3;
    return 4;
  }
}
