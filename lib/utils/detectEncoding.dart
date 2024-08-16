import 'dart:convert';

// String detectEncoding(List<int> bytes) {
//   // UTF-8 的字节序模式
//   bool isUtf8 = true;
//   int i = 0;
//
//   while (i < bytes.length) {
//     int byte = bytes[i];
//
//     if (byte <= 0x7F) {
//       // ASCII 范围，单字节字符
//       i++;
//     } else if (byte >= 0xC2 && byte <= 0xDF) {
//       // 两字节 UTF-8 序列
//       if (i + 1 < bytes.length && bytes[i + 1] >= 0x80 && bytes[i + 1] <= 0xBF) {
//         i += 2;
//       } else {
//         isUtf8 = false;
//         break;
//       }
//     } else if (byte >= 0xE0 && byte <= 0xEF) {
//       // 三字节 UTF-8 序列
//       if (i + 2 < bytes.length &&
//           bytes[i + 1] >= 0x80 && bytes[i + 1] <= 0xBF &&
//           bytes[i + 2] >= 0x80 && bytes[i + 2] <= 0xBF) {
//         i += 3;
//       } else {
//         isUtf8 = false;
//         break;
//       }
//     } else if (byte >= 0xF0 && byte <= 0xF4) {
//       // 四字节 UTF-8 序列
//       if (i + 3 < bytes.length &&
//           bytes[i + 1] >= 0x80 && bytes[i + 1] <= 0xBF &&
//           bytes[i + 2] >= 0x80 && bytes[i + 2] <= 0xBF &&
//           bytes[i + 3] >= 0x80 && bytes[i + 3] <= 0xBF) {
//         i += 4;
//       } else {
//         isUtf8 = false;
//         break;
//       }
//     } else {
//       isUtf8 = false;
//       break;
//     }
//   }
//
//   if (isUtf8) {
//     return 'UTF-8';
//   }
//
//   // 如果不是 UTF-8，可以假设为 GBK 或其他编码
//   // 你可以在这里加入更多编码的检测逻辑
//   return 'GBK';
// }



String detectEncoding(List<int> bytes) {
  // 尝试将字节解码为 UTF-8
  try {
    utf8.decode(bytes);
    return 'UTF-8';
  } catch (_) {
    // 如果 UTF-8 解码失败，尝试 GBK 解码
    return 'GBK';
  }
}