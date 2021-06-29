import 'package:get/get.dart';
import 'dart:async';
import 'package:Inke/util/string_util.dart';
import 'package:Inke/util/toast.dart';
import 'package:Inke/router/navigator_util.dart';
import 'package:Inke/http/api.dart';
import 'package:Inke/http/http_manager.dart';

class RegisterController extends GetxController {
  Timer _timer;
  var countdownTime = 0.obs;



  void startCountdownTimer() {
    if (countdownTime.value == 0) {
      countdownTime.value = 60;
      const oneSec = const Duration(seconds: 1);
      var callback = (timer) => {
            if (countdownTime < 1)
              {_timer.cancel()}
            else
              {countdownTime = countdownTime - 1}
          };
      _timer = Timer.periodic(oneSec, callback);
    }
  }


  void submit(String username,String pwd,String repassword)async{
    if(StringUtil.isEmpty(username) || StringUtil.isEmpty(pwd)){
      Toast.show('请填写正确');
      return;
    }
    final data = await HttpManager.getInstance().post(url: Api.register,params: {'username':username,"password":pwd,"repassword":repassword});
    if(data != null){
      Toast.show('注册成功');
      NavigatorUtil.goBack();
    }
  }

  @override
  void onClose() {
    super.onClose();
    print('onClose');
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
