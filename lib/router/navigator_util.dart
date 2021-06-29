import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorUtil{

  ///跳转
  static Future<T> push<T>(String path,{dynamic arguments}){
    return Get.toNamed(path,arguments: arguments);
  }

  ///跳转并销毁自身
  static Future<T> pushAndReplace<T>(String path,{dynamic arguments}){
    return Get.offNamed(path,arguments: arguments);
  }

  ///返回
  static void goBack<T>({dynamic result}){
     Get.back<T>(result: result);
  }

  ///带参数返回
  static void goBackByParams(BuildContext context,dynamic result){
    Navigator.of(context).pop(result);
  }


  ///跳转并销毁所有页面
  static Future<T> pushAndRemoveAll<T>(String path,{dynamic arguments}){
    return Get.offAllNamed<T>(path,arguments: arguments);
  }

}