import 'dart:html' as html;
import 'package:flutter/services.dart';

class FileServicePlatform {
  static Future<void> openResume(String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.window.open(url, '_blank');
      // Note: We don't revoke the URL immediately as it might break the new tab
    } catch (e) {
      print('Error opening resume on web: $e');
    }
  }

  static Future<void> downloadResume(String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      final fileName = assetPath.split('/').last;
      html.AnchorElement(href: url)
        ..setAttribute('download', fileName)
        ..click();

      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error downloading resume on web: $e');
    }
  }
}
