import 'file_service_mobile.dart'
    if (dart.library.html) 'file_service_web.dart';

class FileService {
  static Future<void> openResume(String assetPath) async {
    return FileServicePlatform.openResume(assetPath);
  }

  static Future<void> downloadResume(String assetPath) async {
    return FileServicePlatform.downloadResume(assetPath);
  }
}
