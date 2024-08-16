import 'dart:io';

class FileService {
  static Future<String> readTextFile(String filePath) async {
    try {
      final file = File(filePath);
      return await file.readAsString();
    } catch (e) {
      return 'Error reading file: $e';
    }
  }
}