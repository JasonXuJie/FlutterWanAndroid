import 'package:flutter/material.dart';
import 'package:Inke/config/config.dart';
import 'dart:async';

class ErrorReport {

  ///初始化
  static void init() {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (Config.isDebug) {//Debug模式下打印到控制台
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack);
      }
    };
  }

  ///上传错误日志
  static void reportException(Object obj, StackTrace stack) {
    print("错误报告obj$obj");
    print("错误报告stack$stack");
  }

}