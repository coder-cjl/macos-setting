/*
 * @description:
 * @author: 雷子
 * @data: 2024/6/6 09:51
 */

import 'package:flutter/foundation.dart';

/// 调试打印
void appDebugPrint(dynamic message) {
  _print("[DEBUG]", message);
}

/// 警告打印
void appWarningPrint(dynamic message) {
  _print("[WARNING]", message);
}

/// 信息打印
void appInfoPrint(dynamic message) {
  _print("[INFO]", message);
}

/// 错误打印
void appErrorPrint(dynamic message) {
  _print("[ERROR]", message);
}

/// 详细打印
void appVerbosePrint(dynamic message) {
  _print("[VERBOSE]", message);
}

_print(String tag, dynamic message) {
  if (kDebugMode) {
    print("${DateTime.now()}\n$tag: $message\n");
  }
}
