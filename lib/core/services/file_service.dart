import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class FileService {
  static Future<void> openResume(String assetPath) async {
    if (kIsWeb) {
      final Uri url = Uri.parse(assetPath);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    } else {
      try {
        final File file = await _getAssetFile(assetPath);
        await OpenFilex.open(file.path);
      } catch (e) {
        debugPrint('Error opening resume: $e');
      }
    }
  }

  static Future<void> downloadResume(String assetPath) async {
    if (kIsWeb) {
      final Uri url = Uri.parse(assetPath);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    } else {
      try {
        final File file = await _getAssetFile(assetPath);
        await Share.shareXFiles([XFile(file.path)], text: 'My Resume');
      } catch (e) {
        debugPrint('Error downloading/sharing resume: $e');
      }
    }
  }

  static Future<File> _getAssetFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final fileName = assetPath.split('/').last;
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    if (!await file.exists()) {
      await file.writeAsBytes(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );
    }
    return file;
  }
}
