import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../services/file_service.dart';
import '../widgets/text_display_widget.dart';
import '../utils/get_permission.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fast_gbk/fast_gbk.dart';
import 'dart:io';
import 'dart:convert';
import '../utils/detectEncoding.dart';

class TextReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Reader'),
      ),
      body: FutureBuilder<String>(
        future: _loadTextFile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            print('File content: ${snapshot.data}');
            return TextDisplayWidget(content: snapshot.data ?? 'No content');
          } else {
            return TextDisplayWidget(content: snapshot.data ?? 'No content');
          }
        },
      ),
    );
  }

  Future<String> _loadTextFile() async {
    //checkPermission();
    try {
      // 获取公共存储目录路径
      // final directory = Directory('/storage/emulated/0');
      // final path = '${directory.path}/Documents/aaa.txt';
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        String? path = result.files.single.path;
        // 读取并显示文件内容
        //return FileService.readTextFile(path!);
        return readTextFileWithGB2312(path!);
      }else{
        return 'error';
      }

    } catch (e) {
      return 'Error reading file: $e';
    }
  }
}

Future<String> readTextFileWithGB2312(String path) async {
  try {
    final file = File(path);
    final bytes = await file.readAsBytes();  // 读取字节数据
    print(bytes.sublist(0, 100)); // 打印前100字节
    try {
      return utf8.decode(bytes);
    } catch (_) {
      // 如果 UTF-8 解码失败，尝试 GBK 解码
      return gbk.decode(bytes);
    }
  } catch (e) {
    return 'Error reading file: $e';
  }
}



Future<String> readAndConvertFileToUtf8(String path) async {
  try {
    final file = File(path);
    final bytes = await file.readAsBytes();
    final decoded = gbk.decode(bytes);  // 使用 GBK 解码
    final utf8Encoded = utf8.encode(decoded);  // 将解码后的内容重新编码为 UTF-8
    return utf8.decode(utf8Encoded);  // 解析为字符串
  } catch (e) {
    return 'Error reading file: $e';
  }
}