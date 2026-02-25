import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileServicePlatform {
  static Future<void> openResume(String assetPath) async {
    try {
      final File file = await _getAssetFile(assetPath);
      await OpenFilex.open(file.path);
    } catch (e) {
      print('Error opening resume on mobile: $e');
    }
  }

  static Future<void> downloadResume(String assetPath) async {
    try {
      final File file = await _getAssetFile(assetPath);
      await Share.shareXFiles([XFile(file.path)], text: 'My Resume');
    } catch (e) {
      print('Error downloading/sharing resume on mobile: $e');
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
