import 'package:file_picker/file_picker.dart';

class FilePickerUtil {
  static Future<String?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      return result.files.single.path;
    }
    return null;
  }
}