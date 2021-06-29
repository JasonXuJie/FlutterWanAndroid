/**
 * {
    "data": ...,
    "errorCode": 0,
    "errorMsg": ""
    }
    errorCode = 0 代表执行成功，不建议依赖任何非0的 errorCode.
    errorCode = -1001 代表登录失效，需要重新
 * **/



class HttpResult{
  int errorCode;
  String errorMsg;
  dynamic data;

  HttpResult(this.errorCode,this.errorMsg,this.data);

  HttpResult.fromJson(Map<String,dynamic> json){
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    data = json;
  }
}