import 'package:dio/dio.dart';

///@desc 网络请求错误
///@author J@son
class HttpError {


  String msg;

  HttpError(this.msg);

  HttpError.dioError(DioError error) {
    msg = error.message;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        msg = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.receiveTimeout:
        msg = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.sendTimeout:
        msg = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.response:
        msg = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        msg = "请求已被取消，请重新请求";
        break;
      case DioErrorType.other:
        msg = "网络异常，请稍后重试！";
        break;
    }
  }
}
